--View

--단순한 뷰
DROP VIEW EMP_V1;

CREATE VIEW EMP_V1(직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID
FROM EMPLOYEES;

select * from emp_v1;

--뷰에 데이터 입력 시 실제로는 뷰를 만들 때 사용한 테이블에 입력
INSERT INTO emp_v1
VALUES(333, '펭수', '김', 'PENG', SYSDATE,'IT_PROG');

select * from employees
where employee_id = 333;

--복잡한 뷰
--그룹함수를 사용한 뷰는 DRML 불가
CREATE OR REPLACE VIEW  부서별_직원_보고서
AS
SELECT DEPARTMENT_ID 부서번호, COUNT(*) 직원수,
ROUND(AVG(salary)) 평균급여
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT * FROM 부서별_직원_보고서;

--읽기만 가능한 뷰
--90번 부서 직원들의 읽기 전용 뷰
CREATE OR REPLACE VIEW  emp90_read(직원번호, 이름, 성, 이메일, 고용일, 직종)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM EMPLOYEES
WHERE department_id = 90
WITH READ ONLY;

SELECT * FROM emp90_read; --읽기 전용

--인덱스
--인덱스 조회화기(기본키 열은 자동으로 인덱스 생성)
SELECT * FROM all_ind_columns
WHERE table_name = 'MEMBERS';

--인덱스 실습용 테이블
CREATE TABLE members(
    member_id INT,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)
);

--검색
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name = 'Harse';

SELECT
 PLAN_TABLE_OUTPUT
FROM
 TABLE(DBMS_XPLAN.DISPLAY());


--인덱스 만들기
CREATE INDEX members_last_name_i
ON members(last_name);

--삭제
DROP INDEX members_last_name_i;

--멀티 인덱스
CREATE INDEX members_name_i
ON members(last_name, first_name);

--검색
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';

SELECT
 PLAN_TABLE_OUTPUT
FROM
 TABLE(DBMS_XPLAN.DISPLAY());
 

 
--시퀀스
--시퀀스 생성
CREATE SEQUENCE 시퀀스1;
DROP SEQUENCE 시퀀스1; 

--시퀀스 정보 확인
SELECT * FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = '시퀀스1';

--시퀀스 사용법(.NEXTVAL, .CURRVAL)
SELECT 시퀀스1.NEXTVAL FROM DUAL;
SELECT 시퀀스1.CURRVAL FROM DUAL;

CREATE TABLE 직원
( emp_id NUMBER(6) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL
 );

--시퀀스를 이용해서 직원의 id 검색
--100000 시작하는 시퀀스2 생성
CREATE SEQUENCE 시퀀스2
START WITH 100000
INCREMENT BY 10;
--직원 테이블 입력
INSERT INTO 직원 VALUES (시퀀스2.NEXTVAL,'펭수');
INSERT INTO 직원 VALUES (시퀀스2.NEXTVAL,'길동');
INSERT INTO 직원 VALUES (시퀀스2.NEXTVAL,'길수');
INSERT INTO 직원 VALUES (시퀀스2.NEXTVAL,'펭현');
INSERT INTO 직원 VALUES (시퀀스2.NEXTVAL,'펭펭');

select * from 직원;
--시퀀스 업데이트
UPDATE 직원
SET emp_id=시퀀스1.NEXTVAL;

--로우넘
--위에서 n번째까지 출력
SELECT ROWNUM, EMP.* 
FROM EMP 
WHERE ROWNUM <= 5;

--중간 6~10번(서브쿼리로 순서를 RN으로 정하고 메인쿼리에서 RN의 중간값을 출력)
SELECT E.* 
FROM (SELECT ROWNUM AS RN, EMP.* FROM EMP) E 
WHERE RN BETWEEN 6 AND 10;

--순서 정렬한 뒤 중간번호 출력
SELECT ROWNUM, Emp.* 
FROM emp
WHERE ROWNUM <= 5
ORDER BY sal DESC;

SELECT * FROM emp ORDER BY sal DESC;

--서브쿼리에 정렬을 먼저 하고 ROWNUM으로 제한한다
SELECT ROWNUM, A.*
FROM(SELECT empno, ename, sal FROM emp ORDER BY sal DESC)A
WHERE ROWNUM <= 5;

--HR 연습문제 13번
SELECT B.last_name, first_name, salary
FROM
(SELECT ROWNUM AS RN, A.*
FROM(SELECT * FROM employees ORDER BY salary DESC)A
)B
WHERE RN BETWEEN 6 AND 10;