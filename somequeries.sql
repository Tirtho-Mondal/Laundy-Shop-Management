--Add column dateOfBirth in the table employees
alter table employees add dateofbirth date;



--How to drop payment table;
drop table payment;

--Modify column definition in the table employees
alter table employees modify dateofbirth varchar(50);

--Rename the column name of employees
alter table employees rename column dateofbirth to dob;


--Drop column from the table employees
alter table employees drop column dob;


--Update cloths whose clothid=3
update cloths set clothtype = 'shirt', color = 'black', sizee = 'xl' where clothid = 3;

--How many clients ?
select count(*) as num_clients from clients;

--Show the information of the client how are in the same address
select * from clients where address = 'Khulna, Bangladesh';


--The sum of the subtoal of clients whos id =1
select sum(subtotal) as total_subtotal from orderdetails where clientid = 1;


--The highest unitprice of the oderdetails ;
select max(unitprice) as highest_unit_price from orderdetails;



--The information of client whos paid the highest amout single transection using Nested query
select * from clients where clientid = (select clientid from orderdetails where unitprice = (select max(unitprice) from orderdetails));

--The employeer who got the lowest cost for washing.(using Nested query)
select * from employees where employeeid = (select employeeid from orderdetails where subtotal = (select min(subtotal) from orderdetails));

--Find the information of the client who have the same last name.(Subquery)
select * from clients where lastname = (select lastname from clients group by lastname having count(lastname) > 1);


--Find the average age of employees grouped by their position, where the average age is greater than 32

alter table employees add age number;
update employees set age= 30 where employeeid = 4;
update employees set age= 40 where employeeid = 3;
update employees set age= 33 where employeeid = 2;
update employees set age= 45 where employeeid = 1;
update employees set age= 28 where employeeid = 5;
select * from employees;

select position, avg(age) as avg_age from employees group by position having avg(age) > 32;



--Find the employees whos age is less than 30 and also whos name Last name sarted with 'A'
select * from employees where age < 30 or lastname like 'A%';

--Find the clients whos firstname started with 'T' and lastname with 'M'
select * from clients where firstname like 'T%' and lastname like 'M%';


--Find the clients whos firstname hast exactly 7 character and he is not live in Khulna.
select *  from clients where firstname like '_______' and address not like 'Khulna%';
