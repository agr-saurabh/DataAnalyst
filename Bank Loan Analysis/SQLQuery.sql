select * from bank_loan_data;

-- total loan application issued
select count(*) as Total_Loan_Application from bank_loan_data;

-- total application in a certain month
select count(*) as MTD_Total_Loan_Application from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

-- total loan amount  till now
select sum(loan_amount) as Total_Funded_Amount from bank_loan_data;

-- total loan amount of a certain month
select sum(loan_amount) as MTD_Total_Funded_Amount from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;


-- total amount received back to the bank
select sum(total_payment) as Total_Amount_Received from bank_loan_data;

-- total amount received back to the bank in a certain month
select sum(total_payment) as MTD_Total_Amount_Received from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

-- Average interest rate
select round(avg(int_rate)*100, 2) as Avg_Interest_Rate from bank_loan_data;

-- Average interest rate by month
select round(avg(int_rate)*100, 2) as MTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

-- Average debt to income ratio
select round(avg(dti)*100, 2) as Avg_DTI from bank_loan_data;

-- Average debt to income ratio by month
select round(avg(dti)*100, 2) as MTD_Avg_DTI from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021;

-- Good loan vs Bad loan
select loan_status from bank_loan_data;

-- Good loan: Current or Fully Paid
select (count(case when loan_status in('Fully Paid', 'Current') then id end)*100.0)/count(id)
as Good_Loan_Percentage from bank_loan_data;

select count(id) as Good_Loan_Application from bank_loan_data
where loan_status in ('Fully Paid', 'Current');

select sum(loan_amount) as Good_Loan_Funded_Amount from bank_loan_data
where loan_status in ('Fully Paid', 'Current');

select sum(total_payment) as Good_Loan_Received_Amount from bank_loan_data
where loan_status in ('Fully Paid', 'Current');

-- Bad loan: Charged Off
select (count(case when loan_status = 'Charged Off' then id end)*100.0)/count(id)
as Bad_Loan_Percentage from bank_loan_data;

select count(id) as Bad_Loan_Application from bank_loan_data
where loan_status = 'Charged Off';

select sum(loan_amount) as Bad_Loan_Funded_Amount from bank_loan_data
where loan_status = 'Charged Off';

select sum(total_payment) as Bad_Loan_Received_Amount from bank_loan_data
where loan_status = 'Charged Off';

-- Loan Status
select 
	loan_status,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount,
	avg(int_rate) as Avg_Interest_Rate,
	avg(dti) as Avg_DTI
from bank_loan_data
group by loan_status;

-- Loan Status of a month
select 
	loan_status,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data where month(issue_date) = 12
group by loan_status;

-- Month wise analysis
select 
	month(issue_date) as Month_Number,
	datename(month, issue_date) as Month_Name,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by month(issue_date), datename(month, issue_date)
order by month(issue_date);

-- State wise analysis
select 
	address_state,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by address_state
order by count(id) desc;

-- Term wise analysis
select 
	term,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by term
order by term;

-- Employeement wise analysis
select 
	emp_length,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by emp_length
order by count(id) desc;

-- Loan purpose analysis
select 
	purpose,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by purpose
order by count(id) desc;

-- Home ownership wise analysis
select 
	home_ownership,
	count(id) as Total_Loan_Application,
	sum(total_payment) as Total_Amount_Received,
	sum(loan_amount) as Total_Funded_Amount
from bank_loan_data 
group by home_ownership
order by count(id) desc;