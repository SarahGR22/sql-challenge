CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "dept_manager" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

--Viewing and uploading tables 
Select * from titles 
Select * from employees
Select * from departments
Select * from dept_emp
Select * from salaries
Select * from dept_manager


--1.List the employee number, last name, first name, sex, and salary of each employee
SELECT 
employees.emp_no,
employees.last_name, 
employees.first_name, 
employees.sex, 
salaries.salary 
FROM employees
Join Salaries
On employees.emp_no = salaries.emp_no


-- Tables viewing for 1 and Column names in table 
Select * from salaries
Select * from employees

--2.List the first name, last name, and hire date for the employees who were hired in 1986.
Select 
first_name, last_name, hire_date
From employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--Table viewing for 2 employee
Select * from employees;

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT 
departments.dept_no,
departments.dept_name, 
dept_manager.emp_no, 
employees.last_name,
employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
dept_emp.emp_no,
employees.last_name,
employees.first_name,
departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
Select 
first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';
