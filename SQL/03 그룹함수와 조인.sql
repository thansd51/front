--�׷��Լ�(������ �Լ�, �����Լ�)
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';
--COUNT: ���� ���� ī��Ʈ, (*)�� �� null�� ����
SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;
--�ߺ����� ī��Ʈ
SELECT COUNT(DISTINCT department_id)
FROM employees;
--null�� ����
SELECT AVG(commission_pct)
FROM employees;
-- null�� 0���� ���
SELECT AVG(NVL(commission_pct, 0))
FROM employees;
--
SELECT department_id �μ���, ROUND(AVG(salary)) ��ձ޿� 
FROM employees
GROUP BY department_id
ORDER BY �μ���;
--�׷��� ����
SELECT department_id �μ���, job_id ����, ROUND(AVG(salary), 1) ��տ���
FROM employees
GROUP BY department_id, job_id
ORDER BY �μ���;

--����1
SELECT department_id �μ���,COUNT(*) �����, MAX(salary) �ְ�޿�, MIN(salary) �ּұ޿�, SUM(salary) �޿��հ�, ROUND(AVG(salary)) ��ձ޿�
FROM employees
GROUP BY department_id
ORDER BY �޿��հ� DESC;

--����2
SELECT department_id �μ���, job_id ����,  SUM(salary), COUNT(*) ������
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

--����3
SELECT ROUND(AVG(MAX(salary))) �μ����ְ�������, ROUND(AVG(MIN(salary))) �μ��������������
FROM employees
GROUP BY department_id;

--������� 5���� �Ѵ� �μ��� ����� ��ȸ
SELECT department_id �μ���, COUNT(*) �����
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--����1
SELECT job_id ����, SUM(salary) ���޿��հ�
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY ���޿��հ� DESC;

--����2
SELECT department_id �μ���ȣ, ROUND(AVG(salary)) ��ձ޿�
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

--����3
SELECT job_id, SUM(salary) �޿��Ѿ�
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000
ORDER BY �޿��Ѿ� DESC;

--JOIN
SELECT e.employee_id ������ȣ, e.last_name �����̸�, e.department_id �μ���ȣ,
       d.department_name �μ���
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id;
--3���� ���̺� JOIN
SELECT employee_id, city, department_name
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
JOIN locations l
    ON d.location_id = l.location_id;
    
    SELECT *
    FROM departments;
--WHERE
SELECT e.employee_id, e.last_name,
       d.department_id, d.location_id
FROM employees e
JOIN departments d 
    ON e.department_id = d.department_id
WHERE d.department_id = 50;

--����1
SELECT department_name �μ���, city ���ø�, country_name ������
FROM departments d
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
WHERE city IN('Seattle', 'London')
AND country_name LIKE 'United%';

--��ü ����
SELECT e.last_name ����, m.last_name �Ŵ���
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
--�ܺ� ����
--LEFT
select e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e 
LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
ORDER BY �μ���ȣ DESC;
--RIGHT
select e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e 
RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
--FULL
select e.last_name ����, e.department_id �μ���ȣ, d.department_name �μ���
FROM employees e 
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
--����1
SELECT country_name ����, l.country_id ������ȣ, location_id ������ȣ, city ����
FROM countries c
LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY ������ȣ DESC;

--��������
SELECT country_name ����, region_name �����̸�
FROM countries
CROSS JOIN regions;

 