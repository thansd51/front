DESCRIBE employees;
--

SELECT *
from employees
where salary > 14000;
--�̸��� king�� ���
SELECT *
FROM employees
WHERE last_name = 'King'; --���ڿ��� ''�ѵ���ǥ�� �� ���̰� ��ҹ��ڸ� ����
--������ڰ� 2002�� 6�� 10��
SELECT * 
FROM employees
WHERE hire_date < '02/06/10';
--����1
SELECT *
FROM employees
WHERE employee_id=100;

--����2
SELECT *
FROM employees
WHERE first_name ='David';

--����3
SELECT *
FROM employees
WHERE employee_id <= 105;

--����4
SELECT *
FROM job_history
WHERE start_date > '06/03/03';

--����5
SELECT *
FROM departments
WHERE location_id!=1700;


--��������

--80�� �μ��̸鼭 ������ 10000���� ���� ���� �Ǵ� 60�� �μ� ����
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
OR (department_id = 80
AND salary > 10000);

--�μ���ȣ 80�Ǵ� 60�̸鼭 ������ 10000���� ū ����
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id = 60
OR department_id = 80)
AND salary > 10000;

--����1
SELECT last_name, job_id, salary
FROM employees
WHERE salary > 4000
AND job_id ='IT_PROG';


--���� 2
SELECT last_name, job_id, salary
FROM employees
WHERE salary > 4000
AND job_id ='IT_PROG'
or job_id='FI_ACCOUNT';

--IN������
SELECT * 
FROM employees
WHERE salary > 14000;


SELECT * 
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary = 2700 ;

SELECT * 
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );

--����1
SELECT *
FROM employees
WHERE salary IN(10000, 17000, 24000);

--����2
SELECT *
FROM employees
where department_id NOT IN(30, 50, 80, 100, 110);

--BETWEEN ������
SELECT *
FROM employees
WHERE salary >= 9000 AND salary <= 10000; 
?

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--����1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--����2
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

--����3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

--LIKE������
SELECT *
FROM employees
WHERE last_name LIKE 'B%';

SELECT *
FROM employees
WHERE last_name LIKE '%b%';

SELECT *
FROM employees
WHERE last_name LIKE '%y';

SELECT *
FROM employees
WHERE last_name LIKE '___y';

--����1
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

--����2
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

--����3
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

--����4
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

--����5
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

--IS NULL ������
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

--����1

SELECT *
FROM employees
WHERE manager_id IS NULL;

--ORDER BY
SELECT *
FROM employees
ORDER BY salary DESC;

SELECT department_id, employee_id, first_name, last_name 
FROM employees
ORDER BY department_id , employee_id;
-- �μ���ȣ�� ����( sorting ) �� �� �����ȣ�� ����
?

SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY ����;

SELECT department_id, last_name, salary*12 ����
FROM employees
ORDER BY 3 DESC;

--����1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--����2
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

--����3
SELECT employee_id ������ȣ, first_name �����̸�, department_id �μ���ȣ,
salary ����
FROM employees

WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;




