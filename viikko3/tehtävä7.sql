use employees;

-- a)
SELECT * FROM employees ORDER BY last_name LIMIT 10;
-- 11761	1964-07-17	Bartek	Aamodt	M	1991-06-12
-- 15427	1959-03-06	Aluzio	Aamodt	M	1985-03-03
-- 18182	1963-02-23	Dekang	Aamodt	F	1988-05-25
-- 16572	1956-11-26	Matt	Aamodt	M	1987-06-16
-- 12791	1960-06-16	Mokhtar	Aamodt	M	1994-08-14
-- 12516	1958-06-25	Sreenivas	Aamodt	F	1990-03-06
-- 12982	1952-12-08	Sachem	Aamodt	F	1992-01-11
-- 17400	1962-03-22	Basim	Aamodt	F	1991-09-15
-- 19898	1957-03-09	Vidar	Aamodt	M	1988-08-06
-- 17885	1954-02-01	Takanari	Aamodt	M	1996-08-19

-- b)
SELECT * FROM employees ORDER BY last_name, first_name LIMIT 10;
-- 258641	1961-05-23	Abdelkader	Aamodt	M	1994-12-02
-- 258005	1953-02-17	Adhemar	Aamodt	F	1991-01-21
-- 455773	1960-05-04	Aemilian	Aamodt	M	1988-04-21
-- 436560	1959-03-16	Alagu	Aamodt	F	1991-10-17
-- 266651	1959-05-28	Aleksander	Aamodt	F	1989-03-29
-- 487598	1962-03-03	Alexius	Aamodt	M	1994-12-30
-- 216963	1960-07-16	Alois	Aamodt	M	1995-08-24
-- 15427	1959-03-06	Aluzio	Aamodt	M	1985-03-03
-- 100860	1964-06-20	Amabile	Aamodt	F	1993-02-06
-- 107070	1954-04-24	Anestis	Aamodt	M	1990-10-30

-- c) 
SELECT * FROM employees ORDER BY hire_date DESC LIMIT 5;
-- 463807	1964-06-12	Bikash	Covnot	M	2000-01-28
-- 428377	1957-05-09	Yucai	Gerlach	M	2000-01-23
-- 499553	1954-05-06	Hideyuki	Delgrande	F	2000-01-22
-- 222965	1959-08-07	Volkmar	Perko	F	2000-01-13
-- 47291	1960-09-09	Ulf	Flexer	M	2000-01-12
					
 -- d)
 SELECT first_name, last_name, salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salary DESC LIMIT 1;
-- Tokuyasu	Pesch	158220

-- e)
SELECT first_name, last_name, salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
ORDER BY salary ASC LIMIT 1;
-- Olivera	Baek	38623

-- f) 
SELECT first_name, last_name, salary
FROM employees JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE salary > 150000 AND salaries.to_date = '9999-01-01';
-- Tokuyasu	Pesch	158220
-- 	Junet	150345
-- Xiahua	Whitcomb	155709
-- Lansing	Kambil	150052
-- Willard	Baca	154459
-- Tsutomu	Alameldin	155190
-- Charmane	Griswold	153715
-- Weicheng	Hatcliff	152687
-- Mitsuyuki	Stanfel	152220
-- Sanjai	Luders	155513
-- Honesty	Mukaidono	156286
-- Weijing	Chenoweth	152710
-- Shin	Birdsall	152412
-- Mohammed	Moehrke	150740
-- Lidong	Meriste	154376

-- g) 
SELECT COUNT(*)
FROM dept_emp JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales' AND dept_emp.to_date = '9999-01-01';
-- 37701 työskentelee myynnissä
SELECT COUNT(*)
FROM dept_emp JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Marketing' AND dept_emp.to_date = '9999-01-01';
-- 14842 työskentelee markkinoinnissa

-- h) Nykyiset ja entiset osastonjohtajat
SELECT first_name, last_name, dept_name
FROM dept_manager
JOIN employees ON dept_manager.emp_no = employees.emp_no
JOIN departments ON dept_manager.dept_no = departments.dept_no
ORDER BY dept_name;
-- Tonny	Butterworth	Customer Service
-- Marjo	Giarratana	Customer Service
-- Xiaobin	Spinelli	Customer Service
-- Yuchang	Weedman	Customer Service
-- DeForest	Hagimont	Development
-- Leon	DasSarma	Development
-- Ebru	Alpin	Finance
-- Isamu	Legleitner	Finance
-- Shirish	Ossenbruggen	Human Resources
-- Karsten	Sigstam	Human Resources
-- Margareta	Markovitch	Marketing
-- Vishwani	Minakawa	Marketing
-- Krassimir	Wegerle	Production
-- Rosine	Cools	Production
-- Shem	Kieras	Production
-- Oscar	Ghazalie	Production
-- Peternela	Onuegbe	Quality Management
-- Rutger	Hofmeyr	Quality Management
-- Sanjoy	Quadeer	Quality Management
-- Dung	Pesch	Quality Management
-- Arie	Staelin	Research
-- Hilary	Kambil	Research
-- Przemyslawa	Kaelbling	Sales
-- Hauke	Zhang	Sales

-- i)
SELECT AVG(salary)
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Sales'
  AND salaries.to_date = '9999-01-01'
  AND dept_emp.to_date = '9999-01-01';
-- Myynnin keskipalkka 88852.9695
SELECT AVG(salary)
FROM salaries
JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE dept_name = 'Marketing'
  AND salaries.to_date = '9999-01-01'
  AND dept_emp.to_date = '9999-01-01';
  -- Markkinoinnin  keskipalkka 80058.8488
  