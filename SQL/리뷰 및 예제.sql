--1
SELECT d.department_name                 �μ���,
       d.manager_id                      �Ŵ�����ȣ,
       e.last_name||' '||e.first_name    "�Ŵ����̸�(�����̸�)",
       e.phone_number                    ��ȭ��ȣ
FROM departments d
JOIN employees e
    ON d.manager_id = e.employee_id;
    
--2
SELECT employee_id �����ȣ, hire_date �������, e.job_id ����, job_title ��å
FROM employees e
JOIN jobs j
    ON e.job_id = j.job_id;

--3
SELECT TO_CHAR(hire_date, 'YYYY') �Ի�⵵, AVG(salary) ��ձ޿�
FROM employees e
JOIN jobs j
ON e.job_id = j.job_id
GROUP BY job_title, hire_date
HAVING job_title = 'Sales Manager'
ORDER BY �Ի�⵵;

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