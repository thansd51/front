--그룹함수(다중행 함수, 집계함수)
SELECT AVG(salary), MAX(salary),
       MIN(salary), SUM(salary)
FROM employees
WHERE job_id LIKE '%REP%';
--COUNT: 행의 갯수 카운트, (*)일 때 null값 포함
SELECT COUNT(commission_pct)
FROM employees
WHERE department_id = 80;
--중복빼고 카운트
SELECT COUNT(DISTINCT department_id)
FROM employees;
--null값 제외
SELECT AVG(commission_pct)
FROM employees;
-- null값 0으로 계산
SELECT AVG(NVL(commission_pct, 0))
FROM employees;
--
SELECT department_id 부서명, ROUND(AVG(salary)) 평균급여 
FROM employees
GROUP BY department_id
ORDER BY 부서명;
--그룹이 여럿
SELECT department_id 부서명, job_id 직종, ROUND(AVG(salary), 1) 평균월급
FROM employees
GROUP BY department_id, job_id
ORDER BY 부서명;

--예제1
SELECT department_id 부서명,COUNT(*) 사원수, MAX(salary) 최고급여, MIN(salary) 최소급여, SUM(salary) 급여합계, ROUND(AVG(salary)) 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

--예제2
SELECT department_id 부서명, job_id 직종,  SUM(salary), COUNT(*) 직원수
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

--예제3
SELECT ROUND(AVG(MAX(salary))) 부서별최고월급평균, ROUND(AVG(MIN(salary))) 부서별최저월급평균
FROM employees
GROUP BY department_id;

--사원수가 5명이 넘는 부서와 사원수 조회
SELECT department_id 부서명, COUNT(*) 사원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5;

--예제1
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id != 'AC_MGR'
GROUP BY job_id
HAVING SUM(salary) > 10000
ORDER BY 월급여합계 DESC;

--예제2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id != 40
GROUP BY department_id
HAVING AVG(salary) <= 7000;

--예제3
SELECT job_id, SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary)>=13000
ORDER BY 급여총액 DESC;

--JOIN
SELECT e.employee_id 직원번호, e.last_name 직원이름, e.department_id 부서번호,
       d.department_name 부서명
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id;
--3개의 테이블 JOIN
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

--예제1
SELECT department_name 부서명, city 도시명, country_name 국가명
FROM departments d
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id
WHERE city IN('Seattle', 'London')
AND country_name LIKE 'United%';

--자체 조인
SELECT e.last_name 직원, m.last_name 매니저
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;
--외부 조인
--LEFT
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e 
LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id
ORDER BY 부서번호 DESC;
--RIGHT
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e 
RIGHT OUTER JOIN departments d
    ON e.department_id = d.department_id;
--FULL
select e.last_name 직원, e.department_id 부서번호, d.department_name 부서명
FROM employees e 
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;
--예제1
SELECT country_name 국가, l.country_id 국가번호, location_id 지역번호, city 도시
FROM countries c
LEFT OUTER JOIN locations l
ON c.country_id = l.country_id
ORDER BY 지역번호 DESC;

--교차조인
SELECT country_name 국가, region_name 지역이름
FROM countries
CROSS JOIN regions;

 