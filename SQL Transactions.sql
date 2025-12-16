-- TRANSACTIONS

-- MULTIPLE STATEMENTS TREATED AS SINGLE STATEMENT
-- either all the operations in the traction will successed(commited0 or non of them will take effect(rollback)

-- ACID PROPERTIES
     -- A - atomicity (all or nothing)
	 -- C - consistency (referal integrity)
	 -- I - isolation 
	 -- D - durability


------------------------------------------------------EXAMPLE--------------------------------------------------
-- A customer initiates a recharge through mobile/web/UPI. The system should:
    --Deduct the recharge amount from their wallet (real money involved)
	--Insert the recharge record for history, invoicing, and refunds
	--Update the plan expiry date based on selected plan
	--Log the transaction status (SUCCESS/FAILURE with reason)
    --All steps must happen together, or none at all. If anything fails, rollback everything.


	use campusx_class1

	create table users1
	(user_id int primary key,
	mobile_no varchar(10),
	wallet_balance decimal(10,2),
	plan_expiry date)

	create table plans
	(plan_id int primary key,
	price decimal(10,2),
	validity_days int)

	CREATE TABLE Recharges (
    recharge_id INT PRIMARY KEY,
    user_id INT,
    plan_id INT,
    recharge_date DATE,
    amount DECIMAL(10,2)
);

CREATE TABLE Transaction_Log (
    txn_id INT PRIMARY KEY,
    user_id INT,
    status VARCHAR(20),
    txn_date DATETIME,
    failure_reason VARCHAR(255)
);


INSERT INTO Users1 (user_id, mobile_no, wallet_balance, plan_expiry)
VALUES 
(1001, '9876543210', 500.00, NULL),   
(1002, '9012345678', 100.00, NULL);    


INSERT INTO Plans (plan_id, price, validity_days)
VALUES 
(1, 199.00, 28),
(2, 399.00, 56),
(3, 599.00, 84);


select * from users1
select * from plans



CREATE  or alter PROCEDURE  USP_PERFORMRECHARGE 
         @USER_ID INT,
		 @PLAN_ID INT
AS
BEGIN
   declare 
    @amount decimal(10,2),
	@validity int,
	@wallet decimal(10,2),
	@new_recharge_id int,
	@new_txn_id int


   BEGIN TRANSACTION
     BEGIN TRY 
	     -- FOR THE GIVEN PLAN ID , IT WILL FETCH THE PLAN INFORMATION..
		 SELECT @amount=price, @validity = validity_days
		 FROM PLANS WHERE plan_id=@PLAN_ID

		 -- IF PLAN WAS FOUND OR NOT 
		 if @amount  is null
		    Throw 51000, 'Invalid Plan ID',1;

	    
		-- FOR THE GIVEN USER , FETCH ITS INFORMATION.
		select @wallet= wallet_balance from Users1 where user_id=@USER_ID

		-- if the user exist
		if @wallet is null 
		throw 51001 ,'Invalid User ID',1;

		--  validate the wallet balance
		if @wallet<@amount
		     THROW 51002 , 'INsufficient Wallet Balance',1;

	   
	   -- extend plan expiry 
	   update Users1
	   set plan_expiry= DATEADD(DAY, @validity,isnull(plan_expiry,getdate()))
	   where USER_ID=@USER_ID


	   -- insert into recharge record
	   select @new_recharge_id = isnull(max(recharge_id),1000)+1 from Recharges

	   insert into Recharges(recharge_id, user_id,plan_id, recharge_date, amount)
	   values(@new_recharge_id, @USER_ID, @PLAN_ID, getdate(), @amount)


	   -- Insert values into Transactions
	   select @new_txn_id= isnull(max(txn_id),5000)+1 from Transaction_Log
	   insert into Transaction_Log(txn_id,user_id,status, txn_date, failure_reason)
	   values(@new_txn_id, @USER_ID, 'Success',GETDATE(), null)
	  
	   
	   commit  transaction;
	   print('Recharge Completed Successfully')
	end try

	begin catch
	   rollback transaction

	   select @new_txn_id= isnull(max(txn_id),5000)+1 from Transaction_Log
	   insert into Transaction_Log(txn_id,user_id,status, txn_date, failure_reason)
	   values(@new_txn_id, @USER_ID, 'Failed',GETDATE(), ERROR_MESSAGE())
	   
	   print('Recharge failed'+ error_message())
	end catch 
end;



select * from users1;
select * from plans;
select * from Recharges;
select * from Transaction_Log


exec USP_PERFORMRECHARGE 1001, 1
exec USP_PERFORMRECHARGE 999, 1
exec USP_PERFORMRECHARGE 1001, 1
exec USP_PERFORMRECHARGE 1002, 1




