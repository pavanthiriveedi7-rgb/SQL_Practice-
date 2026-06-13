USE employee_details;

INSERT INTO employeerecords
VALUES (7,"Pavan","Kumar","Intern_sql","15000");
INSERT INTO employeerecords
VALUES (10,"Pavan","kalyan","Intern_Hr","12000");

SELECT * FROM employeerecords;

insert into employeerecords
values(8,"Ram","Dirisala","CEO","100000");

SELECT * FROM employeerecords;

insert into employeerecords
       (employeeid , Firstname,department)
values (9,"anusha","DA");

SELECT * FROM employeerecords;

update employeerecords
set salary = 0
where lastname  = "kalyan";


update employeerecords
set salary = salary * 1.5
WHERE Department = ("Intern_sql");

delete from employeerecords
where EmployeeID = 10;
select * from employeerecords;


create table EMP_Backup
AS select * from employeerecords;

select * from employeerecords;

select * from emp_backup;



