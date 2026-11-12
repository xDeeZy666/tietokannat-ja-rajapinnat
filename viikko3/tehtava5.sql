USE employees;
-- a)
SELECT dept_name FROM departments;
-- Customer Service, Development, Finance, Human Resources, Marketing, Production, Quality Management, Research, Sales

-- b)
select DISTINCT title FROM titles;
-- Technique Leader, Staff, Senior Staff, Senior Engineer, ManagerEngineer, Assistant Engineer

-- c)
SELECT MAX(salary), MIN(salary) FROM salaries;
-- MAX 158220, MIN 38623

-- d)
SELECT AVG(salary) FROM salaries;
-- AVG 63810,7448

-- e)
SELECT * FROM employees WHERE last_name = 'Facello';
-- Facelloja on 186

-- f) 
SELECT COUNT(*) FROM employees WHERE birth_date BETWEEN '1950-01-01' AND '1959-12-31';
-- 182886

-- g)
SELECT gender, COUNT(*) FROM employees GROUP BY gender;
-- M 179973, F 120051