--1
SELECT department_name, COUNT(*) emp_cnt
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY emp_cnt DESC, department_name;

--2
SELECT department_name, ROUND(AVG(salary), -1) avg_sal
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY AVG(salary) DESC;

--3
SELECT B.*
FROM(SELECT ROWNUM RN, A.*
FROM(SELECT job_title, AVG(salary) avg_sal
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
GROUP BY job_title
ORDER BY avg_sal DESC)A)B
WHERE RN <= 7;

--4
SELECT e.employee_id ,e.last_name, e.salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;

--5
SELECT CONCAT(CONCAT(first_name, ' '), last_name) emp_name, salary
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title = 'Sales Representative'
AND salary BETWEEN 9000 AND 10000
ORDER BY salary DESC;

--6
SELECT job_title, SUM(salary) tot
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
GROUP BY job_title
HAVING SUM(salary) >= 30000
ORDER BY TOT DESC;

--7
SELECT B.city, avg_salary
FROM
(SELECT ROWNUM RN, A.*
FROM
(SELECT city, ROUND(AVG(salary)) avg_salary
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
GROUP BY city
ORDER BY avg_salary DESC)A)B
WHERE RN <= 3;

--8
SELECT TO_CHAR(hire_date, 'YYYY') hire_year, AVG(salary) avg_sal
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
WHERE job_title = 'Sales Manager'
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY hire_year;

--9
SELECT city, ROUND(AVG(salary)) avg_salary, COUNT(*) emp_cnt
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
GROUP BY city
HAVING COUNT(*) < 10
ORDER BY avg_salary;

--10

employee_id, first_name, last_name, NVL(department_name, '<Not Assigned>') hire_date
--11
SELECT employee_id, first_name, last_name, NVL(department_name, '<Not Assigned>') hire_date
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id;

SELECT *
FROM employees;


WHERE employee_id = 178









--13
SELECT B.last_name, first_name, salary
FROM(
 SELECT ROWNUM AS RN, A.*
 FROM(SELECT * FROM employees ORDER BY salary DESC)A
 )B
WHERE RN BETWEEN 6 AND 10; 

