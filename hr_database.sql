-- Retrieve all employees whose address is in Elgin,IL.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%';

-- Retrieve all employees who were born during the 1970's.
SELECT F_NAME , L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '1970';

-- Retrieve all employees in department 5 whose salary is between 60000 and 70000.
SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5;

-- Retrieve a list of employees ordered by department ID.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID;

-- Retrieve a list of employees ordered in descending order by department ID and within each department ordered alphabetically 
-- in descending order by last name.
SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC;

-- For each department ID retrieve the number of employees in the department.
SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- For each department retrieve the number of employees in the department, and the average employee salary in the department.
SELECT DEP_ID, COUNT(*), AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEP_ID;

-- Label the computed columns in the result set of prev problem as NUM_EMPLOYEES and AVG_SALARY.
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID;

-- In prev problem, limit the result to departments with fewer than 4 employees.
SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING count(*) < 4
ORDER BY AVG_SALARY;

-- Execute a query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
select EMP_ID, F_NAME, L_NAME, SALARY 
from EMPLOYEES
where SALARY < (select AVG(SALARY) from EMPLOYEES);
                
-- Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
select EMP_ID, SALARY, ( select MAX(SALARY) from EMPLOYEES ) AS MAX_SALARY from EMPLOYEES;

-- Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY).
select * from ( select EMP_ID, F_NAME, L_NAME, DEP_ID from EMPLOYEES) AS EMP4ALL;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from EMPLOYEES where JOB_ID IN (select JOB_IDENT from JOBS);

-- Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
select * from EMPLOYEES where JOB_ID IN (select JOB_IDENT from JOBS where JOB_TITLE= 'Jr. Designer');

-- Retrieve JOB information and who earn more than $70,000.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from JOBS where JOB_IDENT IN (select JOB_ID from EMPLOYEES where SALARY > 70000 );

-- Retrieve JOB information and list of employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from JOBS where JOB_IDENT IN (select JOB_ID from EMPLOYEES where YEAR(B_DATE)>1976 );

-- Retrieve JOB information and list of female employees whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT from JOBS  where JOB_IDENT IN (select JOB_ID from EMPLOYEES where YEAR(B_DATE)>1976 and SEX='F' );

-- Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
select * from EMPLOYEES, JOBS;

-- Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
select * from EMPLOYEES, JOBS where EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;

-- Redo the previous query, using shorter aliases for table names.
select * from EMPLOYEES E, JOBS J where E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
select EMP_ID,F_NAME,L_NAME, JOB_TITLE from EMPLOYEES E, JOBS J where E.JOB_ID = J.JOB_IDENT;

-- Redo the previous query, but specify the fully qualified column names with aliases in the SELECT clause.
select E.EMP_ID,E.F_NAME,E.L_NAME, J.JOB_TITLE from EMPLOYEES E, JOBS  J where E.JOB_ID = J.JOB_IDENT;