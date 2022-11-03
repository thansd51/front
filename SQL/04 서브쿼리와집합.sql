--Popp보다 고용일이 최근에 고용한 사람
SELECT last_name 이름, hire_date 고용일자
FROM employees
WHERE hire_date > ( SELECT hire_date
                    FROM   employees
                    WHERE last_name = 'Popp');
                                 
--집계함수        
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE salary =    ( SELECT min(salary)
                    FROM employees);
--HAVING
SELECT department_id 부서번호, MIN(salary) 최저급여
FROM employees
GROUP BY department_id
HAVING  MIN(salary) >    
                        ( SELECT min(salary)
                          FROM employees
                          WHERE department_id = 50;
                          
--예제1
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Abel');
        
--예제2
SELECT employee_id, last_name, department_id, salary 
FROM employees
WHERE department_id = (SELECT department_id
                       FROM employees
                       WHERE last_name = 'Bull')
AND   salary > (SELECT salary
                FROM employees
                WHERE last_name = 'Bull');

--예제3
SELECT last_name, salary, manager_id
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE last_name = 'Russell');
                    
--예제4
SELECT *
FROM employees
WHERE job_id = (SELECT job_id
                FROM jobs
                WHERE job_title = 'Stock Manager');
                
--다중행      

--IN연산
SELECT MIN(salary)
FROM employees
GROUP BY department_id;

SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN ( SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;

--ANY연산
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ANY
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG'
ORDER BY salary DESC;

--ALL연산
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary  < ALL
                    ( SELECT salary
                      FROM employees
                      WHERE job_id = 'IT_PROG')
AND job_id <> 'IT_PROG';

--예제1
SELECT employee_id, first_name, job_id 직종, salary 급여
FROM employees
WHERE manager_id IN(SELECT manager_id FROM employees WHERE department_id = 20)
AND department_id != 20;

--예제2
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 'ST_MAN');

--예제3
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ALL (SELECT salary FROM employees WHERE job_id = 'IT_PROG');

--다중열
SELECT employee_id, first_name, job_id, salary, manager_id
FROM employees
WHERE (manager_id, job_id) IN  (SELECT manager_id, job_id
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name <> 'Bruce';

--각 부서별 최소 급여를 받은 사원의 부서번호, 사원번호, 이름, 급여
select department_id 부서번호, employee_id 사원번호, first_name 이름, salary 급여
from employees
where (department_id, salary) in  (select department_id, min(salary)
                                   from employees
                                   group by department_id)
order by department_id;

--예제1
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, min(salary) FROM employees GROUP BY job_id)
ORDER BY salary DESC;

--집합연산자

-- UNION을 이용한 합집합
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

--INTERSECT를 이용한 교집합
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history;

 --MINUS를 이용한 차집합
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

--예제1
SELECT department_id 
FROM employees
UNION
SELECT department_id
FROM departments
ORDER BY department_id;

--예제2
SELECT department_id 
FROM employees
UNION ALL
SELECT department_id
FROM departments
ORDER BY department_id;

--예제3
SELECT department_id 
FROM employees
INTERSECT
SELECT department_id
FROM departments;

--예제4
SELECT department_id 
FROM departments
MINUS
SELECT department_id
FROM employees;