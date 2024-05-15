DROP TABLE Salaries;

DROP TABLE Dept_Manager;

DROP TABLE Dept_Emp;

DROP TABLE Departments;

DROP TABLE Titles;

DROP TABLE Employees;

USE SQL_Database_Management_Project;

-- Create, Import, and Show table of Titles 
CREATE TABLE Titles(
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * FROM Titles;

-- Create, Import, and Show table of Employees
CREATE TABLE Employees (
	emp_no INT NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR (35) NOT NULL,
	last_name VARCHAR (30) NOT NULL,
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES Titles(title_id)
);

SELECT * FROM Employees;


-- Create, Import, and Show table of Departments
CREATE TABLE Departments(
	dept_no VARCHAR NOT NULL,
	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * FROM Departments;

-- Create, Import, and Show table of Dept_Emp
CREATE TABLE Dept_Emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Emp;

-- Create, Import, and Show table of Dept_Manager
CREATE TABLE Dept_Manager(
	dept_no VARCHAR NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES Departments(dept_no)
);

SELECT * FROM Dept_Manager;

-- Create, Import, and Show table of Salaries
CREATE TABLE Salaries(
	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES Employees(emp_no)
);

SELECT * FROM Salaries;





