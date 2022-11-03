DESCRIBE employees;
--

SELECT *
from employees
where salary > 14000;
--이름이 king인 사람
SELECT *
FROM employees
WHERE last_name = 'King'; --문자열은 ''한따옴표를 꼭 붙이고 대소문자를 가림
--고용일자가 2002년 6월 10일
SELECT * 
FROM employees
WHERE hire_date < '02/06/10';
--예제1
SELECT *
FROM employees
WHERE employee_id=100;

--예제2
SELECT *
FROM employees
WHERE first_name ='David';

--예제3
SELECT *
FROM employees
WHERE employee_id <= 105;

--예제4
SELECT *
FROM job_history
WHERE start_date > '06/03/03';

--예제5
SELECT *
FROM departments
WHERE location_id!=1700;


--논리연산자

--80번 부서이면서 월급이 10000보다 많은 직원 또는 60번 부서 직원
SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
OR (department_id = 80
AND salary > 10000);

--부서번호 80또는 60이면서 월급이 10000보다 큰 직원
SELECT last_name, department_id, salary
FROM employees
WHERE (department_id = 60
OR department_id = 80)
AND salary > 10000;

--예제1
SELECT last_name, job_id, salary
FROM employees
WHERE salary > 4000
AND job_id ='IT_PROG';


--예제 2
SELECT last_name, job_id, salary
FROM employees
WHERE salary > 4000
AND job_id ='IT_PROG'
or job_id='FI_ACCOUNT';

--IN연산자
SELECT * 
FROM employees
WHERE salary > 14000;


SELECT * 
FROM employees
WHERE salary = 4000 OR salary = 3000 OR salary = 2700 ;

SELECT * 
FROM employees
WHERE salary IN ( 4000, 3000, 2700 );

--예제1
SELECT *
FROM employees
WHERE salary IN(10000, 17000, 24000);

--예제2
SELECT *
FROM employees
where department_id NOT IN(30, 50, 80, 100, 110);

--BETWEEN 연산자
SELECT *
FROM employees
WHERE salary >= 9000 AND salary <= 10000; 
?

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--예제1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--예제2
SELECT *
FROM employees
WHERE hire_date BETWEEN '04/01/01' AND '04/12/30';

--예제3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;

--LIKE연산자
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

--예제1
SELECT *
FROM employees
WHERE job_id LIKE '%AD%';

--예제2
SELECT *
FROM employees
WHERE job_id LIKE '%AD___';

--예제3
SELECT *
FROM employees
WHERE phone_number LIKE '%1234';

--예제4
SELECT *
FROM employees
WHERE phone_number NOT LIKE '%3%' AND phone_number LIKE '%9';

--예제5
SELECT *
FROM employees
WHERE job_id LIKE '%MGR%' OR job_id LIKE '%ASST%';

--IS NULL 연산자
SELECT *
FROM employees
WHERE commission_pct IS NULL;

SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;

--예제1

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
-- 부서번호로 정렬( sorting ) 한 후 사원번호로 정렬
?

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 연봉;

SELECT department_id, last_name, salary*12 연봉
FROM employees
ORDER BY 3 DESC;

--예제1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--예제2
SELECT *
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY salary DESC;

--예제3
SELECT employee_id 직원번호, first_name 직원이름, department_id 부서번호,
salary 월급
FROM employees

WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;




