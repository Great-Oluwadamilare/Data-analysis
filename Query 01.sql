CREATE TABLE employee(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR (50),
	last_name VARCHA(50),
	gender VARCHAR(6),
	Date_of_birth DATE,
	Job_title VARCHAR(50),
	Date_resume DATE,
	Deptmart VARCHAR(50)
);

INSERT INTO employee VALUES (101, 'Joseph', 'Maxwell', 'Male', '1987-09-12', 'Accountant',  '2022-04-19', 'Human Resources')


INSERT INTO employee VALUES (102, 'Mathew', 'Martins', 'Male', '1975-02-06', 'Civil Engineer', '2022-01-05', 'Engineering')

INSERT INTO employee VALUES (103, 'Damilola', 'Adeyemi', 'Male', '1990-02-07', 'Civil Engineer', '2020-04-19', 'Engineering')

INSERT INTO employee VALUES (104, 'Semilore', 'Oladipupo', 'Female', '1967-07-03', 'Business Development', '2021-04-19', 'Administration')


INSERT INTO employee VALUES (105, 'Damola', 'Adeyemi', 'Male', '1967-10-12', 'Data Analyst',  '2020-04-19', 'IT')

INSERT INTO employee VALUES (106, 'Feranmi', 'Adeyemi', 'Female', '1962-15-13', 'Journalist', '2024-04-19', 'Communication')

INSERT INTO employee VALUES (107, 'Dapo', 'Adeyemi', 'Male', '1966-23-12', 'ENTERPRENUER', '2025-04-19', 'Business')


INSERT INTO employee VALUES (108, 'Dolapo', 'Adeyemi', 'Male', '1971-15-12', 'Doctor',  '2027-04-19', 'Medicine')


INSERT INTO employee VALUES (109, 'Dotun', 'Adeyemi', 'Male', '1975-17-12', 'Enterprenuer',  '2030-04-19', 'Business')


INSERT INTO employee VALUES (110, 'Dunmomi', 'Adeyemi', 'Male', '1977-02-12', 'ENTERPRENUER', 'Business')



INSERT INTO employee VALUES (111, 'Mary', 'Daniels', 'Female', '1956-10-12', 'Nurse', '2020-04-19', 'Medicine')


INSERT INTO employee VALUES (112, 'Adebola', 'Banuso', 'Male', '1968-18-16', 'Realtor', '2020-04-19', 'Management')


INSERT INTO employee VALUES (113, 'Samuel', 'Mathias', 'Male', '1966-20-14', 'Chemical Engineer', '2023-04-09', 'Engineer')


INSERT INTO employee VALUES (114, 'Dapo', 'Adekola', 'Male', '1946-13-13', 'ENTERPRENUER',  '2015-04-19', 'Business')


INSERT INTO employee VALUES (115, 'Tope', 'Salami', 'Female', '1966-10-12', 'Agricultural Economist', '2020-14-17', 'Agriculture')


INSERT INTO employee VALUES (116, 'Adesope', 'Akinkunmi', 'Female', '1988-11-12', 'Lecturer',  '2020-04-19', 'Education')


INSERT INTO employee VALUES (117, 'Eseosa', 'Ameh', 'Female', '1945-16-17', 'Fashion Designer', '2023-04-14', 'Fashion')


INSERT INTO employee VALUES (118, 'Makinde', 'Stephen', 'Male', '1966-10-12', 'Lecturer', '2020-04-19', 'Education')


INSERT INTO employee VALUES (119, 'Ebube', 'Okoli', 'Male', '1945-16-16', 'Scientist',  '2020-04-19', 'Science')


INSERT INTO employee VALUES (120, 'Damisa', 'Deborah', 'Female', '1956-16-12', 'Food Scientist', '2010-04-24', 'Health')

--Looking to table to work with

SELECT * FROM PortfolioProject..employee

--Joining this table with salary table

SELECT * FROM employee
INNER JOIN salary
ON employee.employee_id = salary.employee_id

SELECT employee.employee_id,first_name, last_name, salary.job_title, department, salary 
FROM employee
INNER JOIN salary
ON employee.employee_id = salary.employee_id




--Count the number of employees based on genders using group by

SELECT employee_id, first_name, last_name, gender, count(gender) 
FROM PortfolioProject..employee
GROUP BY employee_id, first_name, last_name, gender

--Count the number of employees based on genders using partion by

SELECT employee_id, first_name, last_name, gender, count(gender) OVER (PARTITION BY gender) 
FROM PortfolioProject..employee
GROUP BY employee_id, first_name, last_name, gender

--Looking into the the number of employees in a department using group by
SELECT employee_id, first_name, last_name, deptmart, count(deptmart) 
FROM PortfolioProject..employee
GROUP BY employee_id, first_name, last_name, deptmart

--Looking into the the number of employees in a department using partition by
SELECT employee_id, first_name, last_name, deptmart, count(deptmart) 
OVER (PARTITION BY deptmart)
FROM PortfolioProject..employee

--Looking into the the number of employees sharing date of birth with date resume
SELECT employee_id, first_name, last_name, deptmart, date_of_birth, date_resume
FROM PortfolioProject..employee
WHERE date_of_birth = Date_resume

--Looking into the the number of employees NOT sharing date of birth with date resume
SELECT employee_id, first_name, last_name, deptmart, date_of_birth, date_resume
FROM PortfolioProject..employee
WHERE date_of_birth != Date_resume
