 use productdb;
 CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    is_active BIT NOT NULL DEFAULT 1
);
CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100),
    country VARCHAR(100) NOT NULL
);
CREATE TABLE roles (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL UNIQUE
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),

    dept_id INT NULL,
    role_id INT NOT NULL,
    location_id INT NOT NULL,

    manager_id INT NULL,     
    mentor_id INT NULL,     

    CONSTRAINT fk_emp_dept
        FOREIGN KEY (dept_id) REFERENCES departments(dept_id),

    CONSTRAINT fk_emp_role
        FOREIGN KEY (role_id) REFERENCES roles(role_id),

    CONSTRAINT fk_emp_location
        FOREIGN KEY (location_id) REFERENCES locations(location_id),

    CONSTRAINT fk_emp_manager
        FOREIGN KEY (manager_id) REFERENCES employees(emp_id),

    CONSTRAINT fk_emp_mentor
        FOREIGN KEY (mentor_id) REFERENCES employees(emp_id)
);
ALTER TABLE employees DROP CONSTRAINT fk_emp_dept;
ALTER TABLE employees DROP CONSTRAINT fk_emp_role;
ALTER TABLE employees DROP CONSTRAINT fk_emp_location;
ALTER TABLE employees DROP CONSTRAINT fk_emp_manager;
ALTER TABLE employees DROP CONSTRAINT fk_emp_mentor;



ALTER TABLE employees
ADD CONSTRAINT fk_emp_dept
FOREIGN KEY (dept_id)
REFERENCES departments(dept_id)
ON DELETE CASCADE;

ALTER TABLE employees
ADD CONSTRAINT fk_emp_role
FOREIGN KEY (role_id)
REFERENCES roles(role_id)
ON DELETE CASCADE;

ALTER TABLE employees
ADD CONSTRAINT fk_emp_location
FOREIGN KEY (location_id)
REFERENCES locations(location_id)
ON DELETE CASCADE;




SELECT * FROM departments;
SELECT * FROM roles;
SELECT * FROM locations;
SELECT * FROM employees;



INSERT INTO departments (dept_id, dept_name, is_active) VALUES
(1001, 'HR', 1),
(1002, 'IT', 1),
(1003, 'Finance', 1),
(1004, 'Sales', 0),
(1005, 'Operations', 1);
INSERT INTO locations (location_id, city, state, country) VALUES
(10201, 'Hyderabad', 'Telangana', 'India'),
(10202, 'Bengaluru', 'Karnataka', 'India'),
(10203, 'Chennai', 'Tamil Nadu', 'India'),
(10204, 'Pune', 'Maharashtra', 'India');
INSERT INTO roles (role_id, role_name) VALUES
(10231, 'Manager'),
(10232, 'Team Lead'),
(10233, 'Developer'),
(10234, 'Analyst'),
(10235, 'HR Executive');
INSERT INTO employees
(emp_id, emp_name, salary, dept_id, role_id, location_id, manager_id, mentor_id)
VALUES
(10401, 'Sushanth Reddy', 120000, 1002, 10231, 10201, NULL, NULL),
(10402, 'Rishanth Reddy', 115000, 1001, 10231, 10201, NULL, NULL);
INSERT INTO employees VALUES
(10403, 'Uma', 90000, 1002, 10232, 10202, 10401, 10402),
(10404, 'Thirupathi Reddy', 85000, 1001, 10232, 10201, 10402, 10401);
INSERT INTO employees VALUES
(10405, 'Nanda Reddy', 60000, 1002, 10233, 10202, 10403, 10404),
(10406, 'Akshanth', 65000, 1002, 10233, 10203, 10403, 10401),
(10407, 'Jayanth', 58000, 1001, 10235, 10201, 10404, 10403),
(10408, 'Komara Reddy', 62000, 1003, 10234, 10203, 10401, 10402);


---Employees with departments
SELECT * FROM employees e JOIN departments d ON e.dept_id=d.dept_id;

--All departments with employees
SELECT * FROM departments d LEFT JOIN employees e ON d.dept_id=e.dept_id WHERE e.emp_id IS NOT NULL;

--Departments without employees
SELECT * FROM departments d LEFT JOIN employees e ON d.dept_id=e.dept_id WHERE e.emp_id IS NULL;

---All departments even if empty
SELECT * FROM employees e RIGHT JOIN departments d ON d.dept_id=e.dept_id;

---Employees + departments full list
SELECT * FROM employees e FULL OUTER JOIN departments d ON e.dept_id=d.dept_id;

--Employee with manager name
SELECT e.emp_id,e.emp_name,m.emp_name as manage_name FROM employees e LEFT JOIN employees m ON e.manager_id=m.emp_id;

---Employees under same manager
SELECT m.emp_name as manager_name,e.emp_id,e.emp_name FROM employees e JOIN employees m ON e.manager_id=m.emp_id GROUP BY m.emp_name,e.emp_id,e.emp_name;

---List only managers
SELECT DISTINCT m.emp_name as manager_name FROM employees e JOIN employees m ON e.manager_id=m.emp_id

---Employee–mentor mapping
SELECT e.emp_id,e.emp_name,m.emp_name as mentor_name FROM employees e JOIN employees m ON e.mentor_id=m.emp_id;

--All employee–role combinations
SELECT *  FROM employees CROSS JOIN roles;

---employees + departments + locations
SELECT * FROM departments d JOIN employees e ON d.dept_id=e.dept_id JOIN locations l ON e.location_id=l.location_id; 

---Employee count per department
SELECT e.dept_id,d.dept_name ,COUNT(*) as emp_per_dept FROM employees e JOIN departments d ON e.dept_id=d.dept_id GROUP BY e.dept_id,d.dept_name;

---Department salary total
SELECT e.dept_id,d.dept_name ,SUM(e.salary) as dep_tot_sal FROM employees e JOIN departments d ON e.dept_id=d.dept_id GROUP BY e.dept_id,d.dept_name;

---Departments with more than 3 employees
SELECT e.dept_id,d.dept_name ,COUNT(*) as no_of_emp FROM employees e JOIN departments d ON e.dept_id=d.dept_id GROUP BY e.dept_id,d.dept_name HAVING COUNT(*) >3;

---Count employees per department
SELECT d.dept_name,COUNT(*) as no_OF_EMP FROM employees e JOIN departments d ON e.dept_id=d.dept_id GROUP BY d.dept_name;

---Employees in specific department
SELECT d.dept_name,COUNT(*) FROM employees e JOIN departments d ON e.dept_id=d.dept_id GROUP BY d.dept_name HAVING d.dept_name='IT';

--Employees name LIKE pattern + department
SELECT e.emp_name,d.dept_name FROM employees e JOIN departments d ON e.dept_id=d.dept_id WHERE e.emp_name LIKE '%s%';

--Employees NOT IN departments table
SELECT e.emp_id,e.emp_name FROM employees e JOIN departments d ON e.dept_id=d.dept_id WHERE e.dept_id IS NULL;

---Employees earning more than department average (subquery + join)
SELECT * FROM employees e JOIN (SELECT dept_id, AVG(salary) AS avg_salary FROM employees GROUP BY dept_id) d ON e.dept_id = d.dept_id WHERE e.salary > d.avg_salary;

--Departments IN list of active departments (subquery)
SELECT *  FROM employees e JOIN departments d ON e.dept_id=d.dept_id WHERE d.is_active IN (SELECT d.is_active FROM departments d WHERE d.is_active=1);