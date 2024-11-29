select *from Bank_loan_data

-----(1 kpi Total loan Application)----------
Select count(id ) As Total_loan_Applications from Bank_loan_data
Where Month(issue_date)=12 and year(issue_date) =2021

------(2 Kpi Month Wise loan Fund given by bank)------
select sum(loan_amount) As MTD_Total_funded_Amount From Bank_loan_data
Where Month(issue_date)=12 and year(issue_date) =2021

------(3Kpi total Rev Amount to  bank in from custmer in form of EmI)------
select sum(total_payment) As MTD_Total_amount_recived From Bank_loan_data
where month(issue_date)=12 and year(issue_date)= 2021

------(4kpi Average Interest rate From bank)----------
select avg(int_rate)*100 As mtd_Avg_interest_rate from Bank_loan_data
 where month(issue_date)=12 and year(issue_date)= 2021

 -----(5kpi financial health income of customer)-------
 select avg(dti)*100 As avg_dti from Bank_loan_data
 where month(issue_date)=12 and year(issue_date)= 2021
 
 ------(Bank wanted to see good loan Application in percentage wise)--------
 SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM Bank_loan_data

 
 ------(Bank wanted to see Good Loan Application)------------
 select count(id) As good_loan_application from Bank_loan_data
 Where loan_status='fully paid' or loan_status='current'

 -------(bank Wanted to see Good loan funded amount )------------
   select sum(loan_amount) As good_loan_funded_amount from Bank_loan_data
 Where loan_status='fully paid' or loan_status='current'


 ----------(bank wanted to see good loan Revived amount to bank)------------
   select sum(total_payment) As good_loan_recived_amount from Bank_loan_data
 Where loan_status='fully paid' or loan_status='current'

 ------(Bank wanted to see  Bad  loan Application in percentage wise)--------
 SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM Bank_loan_data

-------(bank Wanted to see  Bad_Loan_Applications  )------------
SELECT COUNT(id) AS Bad_Loan_Applications FROM Bank_loan_data
WHERE loan_status = 'Charged Off'

 ----------(bank wanted to see Bad_Loan_Funded_amount )------------
 SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM Bank_loan_data
WHERE loan_status = 'Charged Off'

----------(bank wanted to see Bad loan Revived amount to bank)------------
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM Bank_loan_data
WHERE loan_status = 'Charged Off'

-----------(bank wanted to see loan Status)--------------------
SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        Bank_loan_data
    GROUP BY
        loan_status

----------(Bank wanted to see loan Report by month Wise)--------
SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

------------(Bank Wanted to see loan report by State wise )--------
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY address_state
ORDER BY address_state

-----------(bank wanted to see Term Wise loan Report)---------
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY term
ORDER BY term
 
 ------------(bank wanted to see Employee LENGTH wise Report)------
 SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY emp_length
ORDER BY emp_length

-----(bank wanted to see which purpose most Loan Application  Report)-------
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY purpose
ORDER BY purpose

--------------(bank wanted to see  HOME OWNERSHIP wise Report)-------
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership

