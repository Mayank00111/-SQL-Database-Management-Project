-- 1. List employee number, last name, first name, sex, and salary

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees AS e
INNER JOIN Salaries AS s ON
e.emp_no = s.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986

SELECT TOP 10 * FROM Employees;
SELECT TOP 10 * FROM Salaries;

SELECT first_name, last_name, hire_date
FROM Employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-01';
-- WHERE hire_date >= '1986-01-01' 
-- AND hire_date < '1987-01-01';

--3. List the manager of each department w/ department number and name, 
--the manager's employee number, and last and first name
SELECT TOP 10 * FROM Dept_Emp;
SELECT TOP 10 * FROM Dept_Manager;
SELECT TOP 10 * FROM Employees;
SELECT TOP 10 * FROM Departments;

SELECT dm.dept_no, dm.emp_no, e.last_name, e.first_name
FROM Dept_Manager dm
INNER JOIN Employees e ON dm.emp_no = e.emp_no

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Departments AS d
LEFT JOIN Dept_Emp AS dm ON
d.dept_no = dm.dept_no
LEFT JOIN Employees AS e ON
dm.emp_no = e.emp_no;

--4. List the department of each employee with employee number,
--   last and first name, and department name

SELECT TOP 10 * FROM Dept_Emp; -- emp_no, dept_no
SELECT TOP 10 * FROM Departments; --dept_no, dept_name
SELECT TOP 10 * FROM Employees;

SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Employees AS e
LEFT JOIN Dept_Emp AS dm ON
e.emp_no = dm.emp_no
LEFT JOIN Departments AS d ON
d.dept_no = dm.dept_no;

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
INNER JOIN Dept_Manager AS dm ON
e.emp_no = dm.emp_no
INNER JOIN Departments AS d ON
dm.dept_no = d.dept_no;


--3. List the manager of each department w/ department number and name, 
--the manager's employee number, and last and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM Departments AS d
LEFT JOIN Dept_Emp AS dm ON
d.dept_no = dm.dept_no
LEFT JOIN Employees AS e ON
dm.emp_no = e.emp_no;
SELECT * FROM Dept_Emp;      -- emp_no, dept_no
SELECT * FROM Dept_Manager;  --dept_no, emp_no
SELECT * FROM Departments;   --dept_no, dept_name
SELECT * FROM Employees;     --emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date

--4. List the department of each employee with employee number,
--   last and first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees AS e
INNER JOIN Dept_Manager AS dm ON
e.emp_no = dm.emp_no
INNER JOIN Departments AS d ON   --Departments table can't be directly connected with Employees 
dm.dept_no = d.dept_no;


SELECT emp_no, COUNT(emp_no)FROM Dept_Emp
GROUP BY emp_no
HAVING COUNT(emp_no) >1;

--5. List first and last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."

SELECT first_name, last_name, sex
FROM Employees
WHERE first_name = 'Hercules' AND last_name LIKE  'B%';

--6. List all employees in the Sales department
--including their employee number, last name, first name, and department name

SELECT * FROM Departments;   --dept_no, dept_name
SELECT * FROM Dept_Emp;      -- emp_no, dept_no

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e
LEFT JOIN Dept_Emp dm ON
e.emp_no = dm.emp_no
LEFT JOIN Departments d ON
d.dept_no = dm.dept_no
WHERE dept_name = 'Sales'

--7. List all employees in the Sales and Development departments
-- including their employee number, last name, first name, and department name

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM Employees e
LEFT JOIN Dept_Emp dm ON
e.emp_no = dm.emp_no
LEFT JOIN Departments d ON
d.dept_no = dm.dept_no
WHERE dept_name IN ('Sales','Development')
-- WHERE dept_name = 'Sales' OR dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names
SELECT last_name, COUNT(last_name) AS "frequency count"  --USE OF AGGREGATE FUNCTION
FROM Employees
GROUP BY last_name
ORDER BY "frequency count" DESC;

