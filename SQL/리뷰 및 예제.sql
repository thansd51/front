--1
SELECT d.department_name                 부서명,
       d.manager_id                      매니저번호,
       e.last_name||' '||e.first_name    "매니저이름(직원이름)",
       e.phone_number                    전화번호
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id;
    
--2
SELECT employee_id 사원번호, hire_date 고용일자, e.job_id 직종, job_title 직책
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;

--3
SELECT TO_CHAR(hire_date, 'YYYY') 입사년도, AVG(salary) 평균급여
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
GROUP BY job_title, hire_date
HAVING job_title = 'Sales Manager'
ORDER BY 입사년도;

--4
SELECT city, ROUND(AVG(salary)), COUNT(*)
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN locations l
ON d.location_id = l.location_id
GROUP BY city
HAVING COUNT(*) < 10
ORDER BY ROUND(AVG(salary));

--5
SELECT e.employee_id, e.last_name, e.salary, m.last_name, m.salary
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;