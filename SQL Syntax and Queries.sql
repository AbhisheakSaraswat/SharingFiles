/*
RDBMS : Relational DataBase Management System

MS SQL
MySQL
PostGresSQL
Oracle
MS Access
SQL Lite
DB2
etc

To interact with these application, we required SQL.
Structure Query language.


DQL (Data Query Language) : SELECT
DDL (Data Definition Language) : CREATE, ALTER, TRUNCATE, DROP, RENAME
DCL (Data Control Language): GRANT, REVOKE
TCL (Transaction Control Language): COMMIT, ROLLBACK, SAVEPOINT
DML (Data Manipulation Language): INSERT, UPDATE, DELETE
*/
-- Create a DataBase

Create DataBase upGrad;

Use upGrad;

Drop database upGrad;

/* DBMS and RDBMS */

/* What is DataBase?

Database is the collection of data, fact, info etc.
In SQL, database is the collection of tables.

Table: Table is the combination of rows and columns. (eg. MS excel)
*/

-- Select Statement

Select * from EmployeeDB; -- * : I want all the columns

Select FirstName, LastName, Grade, Sales
From EmployeeDB;

Select * from Superstore;

Select Order_date, Region, Category, Sales from Superstore;

-- Can you display First 5 Records of a Table
Select  * From EmployeeDB
Limit 5;


Select Region, Segment, Sales from Superstore Limit 5;

Create DataBase Neha;

Select * from new_cricket;

-- Order by Clause

-- Using this clause we can sort the data in asc or desc (by default asc)
Select * from EmployeeDb
Order by Sales;

Select * from EmployeeDb
Order by Grade Desc,
Sales ASC, YearlyIncome Desc;

-- where clause   and Logical Operators
Select * from EmployeeDB
where Grade = 'A';

Select * from EmployeeDB
where Grade = 'A' And Sales > 3000;

Select * from EmployeeDb
Where (Grade = 'A' or Grade = 'C')
and (Sales > 3000 and Sales <= 5000);

-- In Clause
Select * from EmployeeDB
Where Grade in ('A','c');

-- I want all the employee whose grade except A, and C
Select * from EmployeeDB
Where Grade not in ('A','c');

Select * from EmployeeDb
where Sales > 3000;

Select * from EmployeeDb
where not Sales > 3000;

-- Between 
/* Using this clause we can filter the data in specific range,
and between operator include both starting position and ends position.
*/
Select * from EmployeeDb 
Where Sales Between 3000 and 3805; -- Including both sales

Select * from EmployeeDb 
Where Sales Between 3001 and 3804; 

Select * from EmployeeDb 
Where Sales not Between 3000 and 3805; -- You will have everything except between 3000 to 3805

Select cast(123.45 as Char) as Result;

Select cast(123.45 as unsigned) as Result;

-- SQL Aggregated Function
-- Sum, Max, Min, Count, Avg
Select sum(Sales) as TotalSales from Superstore;
Select round(sum(Sales),2) as TotalSales from Superstore;
Select round(sum(Sales),2)  TotalSales from Superstore;

SELECT 
    ROUND(SUM(Sales), 2) TotalSales,
    MAX(Sales) AS MaxSales,
    MIN(Sales) AS MinSales,
    ROUND(AVG(Sales), 2) AS AvgSales,
    COUNT(*) AS TotalRec
FROM
    Superstore;

/* 
Group by:

We can utilized the group by statement when we are aggregating the dataset.

*/

-- Can you display Region wise TotalSales
Select Region, ROUND(SUM(Sales), 2) TotalSales
From Superstore
group by Region;

/*
Note: All the non-aggregated column must be the part of group by statement,
if you missed anything then it will raise an exception.
*/

Select Region, Category, ROUND(SUM(Sales), 2) TotalSales
From Superstore
group by Region, Category
Order by TotalSales;

-- How to exclude category such as Office Supplies
Select * from Superstore;

Select Region, Category, ROUND(SUM(Sales), 2) TotalSales
From Superstore
Where Category != 'Office Supplies'
group by Region, Category
Order by Category;


Select count(*) as TotalRec from Superstore;
Select count(1) as TotalRec from Superstore;
Select count('Tejasva') as TotalChar From Superstore;
Select length('Tejasva') as totalChar;


Select Region, category, Sales
from Superstore
order by segment;

Select Region, Sales from Superstore
Order by Sales Desc
Limit 5;

/*Note:
You can not utilize aggreaged function in where clause.
*/

Select Region, category, sum(Sales)as totalsales
from Superstore
group by region, category
order by totalsales;
--

Select Region, category,Segment, round(sum(Sales),2) as totalsales
from Superstore
group by segment, region, category
having totalsales > 80000;


Select Region, category,Segment, round(sum(Sales),2) as totalsales
from Superstore
Where Category != 'Office Supplies'
group by segment, region, category
having totalsales > 60000;

Select Region, category,Segment, round(sum(Sales),2) as totalsales
from Superstore
Where totalsales > 60000 -- Invalid query
group by segment, region, category;

/* Using having clause we can filter the aggregated column result, however, having clause
can be utilized without using aggregated function as well.

On the other hand, where clause just filter the normal rows and not aggregated column rows.
*/

Select Region, Category, sales
From Superstore
having region = 'East'
and category = 'Technology'
and (sales > 500 and sales < 700)
order by sales desc;

-- Like Operator
/* Using this operator we can filter the data based on wildcard patterns.

There are two wild card chars:
1. % : Represent any series of char.
2. _ : Represent any single char.
*/
Select distinct CustomerName  from Superstore
Where customername like 'A%';

Select distinct CustomerName  from Superstore
Where customername like 'A_A%';

Select distinct CustomerName  from Superstore
Where customername like 'A%Y';

Select distinct CustomerName  from Superstore
Where customername like 'A% A%';

Select distinct CustomerName  from Superstore
Where customername like '% A%';

Select distinct CustomerName  from Superstore
Where customername like '[A-C]%' ;-- In MS SQL

Select distinct CustomerName  from Superstore
Where customername regexp '^[abc]'
order by customername;

Select state, sum(Sales) as totalSales from Superstore
group by state
having state regexp '^[ABCD]';

-- without aggregated or group by statement, can I utilized having clause? 
-- Ans: Yes

Select State from Superstore
having state regexp '^[ABCD]';

Select state, sum(sales) as totalsales from superstore
group by state
having totalsales > 89473.708  and state != 'Texas'

49 : 48 State You have 10000 rows
1 : Texas: 1 Millions Rows


Select state, sum(sales) as totalsales from superstore
where state != 'Texas'
group by state
having totalsales > 89473.708;

-- WHERE filters rows earlier in the execution process, 
-- reducing the data size and improving query performance.

use hr;

Select first_name, last_Name, emp.job_id, salary, job.job_title,
 job.min_salary, job.max_salary
 from Employees as emp
inner join jobs as job
on emp.job_id = job.job_id








