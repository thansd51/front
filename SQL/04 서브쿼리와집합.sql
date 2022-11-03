--Popp���� ������� �ֱٿ� ����� ���
SELECT last_name �̸�, hire_date �������
FROM employees
WHERE hire_date > ( SELECT hire_date
                    FROM   employees
                    WHERE last_name = 'Popp');
                                 
--�����Լ�        
SELECT last_name �̸�, job_id ����, salary �޿�
FROM employees
WHERE salary =    ( SELECT min(salary)
                    FROM employees);
--HAVING
SELECT department_id �μ���ȣ, MIN(salary) �����޿�
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50;
                          
--����1
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');
        
--����2
SELECT employee_id, last_name, department_id, salary 
FROM employees
WHERE department_id = (SELECT department_id
                       FROM employees
                       WHERE last_name = 'Bull')
AND   salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Bull');

--����3
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE last_name = 'Russell');
                    
--����4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id
                FROM jobs
                WHERE job_title = 'Stock Manager');
                
--������      

--IN����
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN ( SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

--ANY����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

--ALL����
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--����1
SELECT employee_id, first_name, job_id ����, salary �޿�
FROM employees
WHERE manager_id IN(SELECT manager_id FROM employees WHERE department_id = 20)
AND department_id != 20;

--����2
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'ST_MAN');

--����3
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--���߿�
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--�� �μ��� �ּ� �޿��� ���� ����� �μ���ȣ, �����ȣ, �̸�, �޿�
select department_id �μ���ȣ, employee_id �����ȣ, first_name �̸�, salary �޿�
from employees
where (department_id, salary) in  (select department_id, min(salary)
                                   from employees
                                   group by department_id)
order by department_id;

--����1
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, min(salary) FROM employees GROUP BY job_id)
ORDER BY salary DESC;

--���տ�����

-- UNION�� �̿��� ������
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

--INTERSECT�� �̿��� ������
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

 --MINUS�� �̿��� ������
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

--����1
SELECT department_id 
FROM employees
UNION
SELECT department_id
FROM departments
ORDER BY department_id;

--����2
SELECT department_id 
FROM employees
UNION ALL
SELECT department_id
FROM departments
ORDER BY department_id;

--����3
SELECT department_id 
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--����4
SELECT department_id 
FROM departments
MINUS
SELECT department_id
FROM employees;