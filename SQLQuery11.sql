/*

Today's Topic: Subqueries (in the Select, From, and Where Statement)

*/

select * from employeesalary


Select idig, JobTitle, SalaryThisMonth
From employeesalary

-- Subquery in Select

Select idig, SalaryThisMonth, (Select AVG(SalaryThisMonth) From employeesalary) as AllAvgSalary
From employeesalary

-- How to do it with Partition By
Select idig, SalaryThisMonth, AVG(SalaryThisMonth) over () as AllAvgSalary
From employeesalary

-- Why Group By doesn't work
Select idig, SalaryThisMonth, AVG(SalaryThisMonth) as AllAvgSalary
From employeesalary
Group By idig, SalaryThisMonth
order by idig


-- Subquery in From

Select a.idig, AllAvgSalary
From 
	(Select idig, SalaryThisMonth, AVG(SalaryThisMonth) over () as AllAvgSalary
	 From employeesalary) a
Order by a.idig


-- Subquery in Where


Select idig, JobTitle, SalaryThisMonth
From employeesalary
where idig in (
	Select idig 
	From employees_table
	where Age > 30)