--단일행 함수

--문자함수
--대소문자 변환함수
SELECT UPPER('SQL Course'),
       LOWER('SQL Course'),
       INITCAP('SQL Course')
FROM DUAL;

--문자 조작 함수
SELECT CONCAT('헬로우', '월드'),
       SUBSTR('ABCDEFG', 2, 5),
       LENGTH('ABCDEFG'),
       INSTR('ABCDEFG', 'B')
FROM DUAL;

--공백 없애기 TRIM
SELECT TRIM('  헬로우  '), '  헬로우  '
FROM DUAL;

--문자형 함수 예제
SELECT department_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins'; --대소문자 섞여 있을 경우 변환해서 조회가능

--문자열 바꾸기
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') 적용결과
FROM employees; 

--예제1
SELECT last_name, LOWER(last_name) LOWER적용, UPPER(last_name) UPPER적용,
email 이메일, INITCAP(email)INITCAP적용
FROM employees;

--예제2
SELECT job_id 직업명, SUBSTR(job_id, 1, 2) 앞의2개
FROM employees;

--숫자형함수
--ROUND함수-반올림
SELECT ROUND(15.193,1) 소수첫째, 
       ROUND(15.193,0) 정수,
       ROUND(15.193,-1) "10의자리"
FROM dual;

--TRUNC함수-버림
SELECT TRUNC(15.79,1) 소수첫째, 
       TRUNC(15.79,0) 정수,
       TRUNC(15.79,-1) "10의자리"
FROM dual;

--MOD함수-나눈 후 나머지
SELECT employee_id 짝수, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY 1;

--예제1
SELECT salary, ROUND(salary/30) 정수, ROUND(salary/30, 1) 소수1, ROUND(salary/30, -1) "10의자리"
FROM employees;

--날짜함수
SELECT sysdate 
FROM dual;

SELECT  ROUND(sysdate, 'DD') 일,
        ROUND(sysdate, 'MM') 월,   
        ROUND(sysdate, 'YYYY') 년도, 
        MONTHS_BETWEEN('2017/10/10', '2017/07/10') 월차이,
        ADD_MONTHS('2017/07/10', 3) 애드먼쓰
FROM dual;

--날짜와 숫자 계산법
SELECT SYSDATE-1 어제, SYSDATE 오늘, SYSDATE+1 내일
FROM DUAL;
--90번 부서 직원들의 오늘까지의 근무일수(현재 날짜 - 고용일)
SELECT last_name, FLOOR(SYSDATE - hire_date) 근무일수
FROM employees
WHERE department_id=90;

--근무월수가 200개월이 안된 직원들
SELECT employee_id, hire_date, 
       FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)) 근무월수,
       ADD_MONTHS(hire_date, 6) "6개월 추가",
       NEXT_DAY(hire_date, '금요일') Next_day, 
       --1(일), 2(월), 3(화), 4(수), 5(목), 6(금), 7(토) 
       LAST_DAY(hire_date) Last_day
       --달의 마지막 날
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE,hire_date) < 200;

--예제1
SELECT sysdate, hire_date, FLOOR(MONTHS_BETWEEN(sysdate, hire_date)) 적용결과
FROM employees
WHERE department_id=100;

--예제2
SELECT hire_date, ADD_MONTHS(hire_date, 3) 더하기_3개월, ADD_MONTHS(hire_date, -3) 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

--변환형 함수

--숫자 > 문자
-- 콤마 예제
SELECT TO_CHAR(12345678,'999,999,999') comma 
FROM DUAL;
 
-- 소숫점 예제  
SELECT TO_CHAR(123.45678,'999,999,999.99') period 
FROM DUAL; 
 
-- $ 표시 예제
SELECT TO_CHAR(12345678,'$999,999,999') dollar  
FROM DUAL;
 
-- Local 화폐 표시 예제 (한국의 경우 ￦로 자동 변환 됨)
SELECT TO_CHAR(12345678,'L999,999,999') local  
FROM DUAL;
 
-- 왼쪽에 0을 삽입
SELECT TO_CHAR(123,'09999') zero 
FROM DUAL;  
 
-- 16진수로 변환
SELECT TO_CHAR(123,'XXXX') hexadecimal  
FROM DUAL;

--날짜 > 문자
-- 년,월,일,시,분,초 예제
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS') "sysdate"
FROM DUAL;
 
-- 365일 중 몇 일째인지 조회
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" 
FROM DUAL;
 
-- 53주 중 몇 주차 인지 조회
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" 
FROM DUAL;
 
-- 해당 월의 이름 조회
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" 
FROM DUAL;

--예제1
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') 입사월
FROM employees
WHERE department_id = 100;

--예제2
SELECT last_name 이름, TO_CHAR(salary, '$99,999.99') 월급
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

--TO_DATE 문자열 > 날짜

-- DATE 타입으로 변환하는 예제
SELECT TO_DATE('2011-01-01','YYYY-MM-DD') 
FROM DUAL;

-- 문자를 숫자로 변환하는 간단한 예제이다.
SELECT TO_NUMBER('01210616')
FROM DUAL; 

--NULL 관련 함수

-- 매니저가 없는 값을 0으로 바꾸어서 출력하는 예제.
SELECT last_name, NVL(manager_id, 0) 매니저
FROM employees
WHERE last_name = 'King';
-- NVL(expr, expr1, expr2) expr의 값이 null이 아닐 경우 expr1, 맞을 경우 expr2
SELECT last_name, NVL2(manager_id, 1, 0) 매니저
FROM employees
WHERE last_name = 'King';

--예제1
SELECT last_name 이름, salary 월급,  NVL(commission_pct, 0) 커미션, (salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉  
FROM employees
ORDER BY 연봉 DESC;

--예제2
SELECT last_name 이름, salary 월급,  NVL(commission_pct, 0) 커미션, (salary*12)+(salary*12*NVL(commission_pct, 0)) 연봉, NVL2(commission_pct, 'SAL+COMM', 'SAL') 연봉계산  
FROM employees
ORDER BY 연봉 DESC;

--DECODE함수
SELECT last_name 이름, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary)  "수정월급"
FROM employees;

--예제1
SELECT last_name 이름, job_id 직무, salary 월급,
DECODE(TRUNC(salary/2000), 0, 0,
                           1, 0.09,
                           2, 0.2,
                           3, 0.3,
                           4, 0.4,
                           5, 0.42,
                           6, 0.44,
                              0.45) "세율"
FROM employees;

--CASE함수
SELECT last_name 이름, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "급여 수준"
FROM employees;

--예제1
SELECT employee_id, first_name, last_name, salary,
CASE WHEN salary >= 9000 THEN '상위급여'
   WHEN 6000 <= salary THEN '중위급여'
     ELSE '하위급여'
     END "급여 수준"
FROM employees;