SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN ( SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;


INSERT INTO 수업 VALUES ('01', '데이터베이스');
INSERT INTO 수업 VALUES ('02', '프로그래밍');
INSERT INTO 수업 VALUES ('03', '자바');

SELECT * FROM 수업;

CREATE TABLE 학생(
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);

INSERT INTO 학생 VALUES ('0414', '홍길동', '01');
INSERT INTO 학생 VALUES ('0415', '임꺽정', '02');
INSERT INTO 학생 VALUES ('0416', '이순신', '03');
SELECT * FROM 학생;

--학생, 수업 테이블 제약조건 추가
--기본키 추가
ALTER TABLE 수업
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);

ALTER TABLE 학생
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);

--유니크키 추가
ALTER TABLE 수업
ADD CONSTRAINT class_cname_uk UNIQUE (cname);

--NOT NULL
ALTER TABLE 학생
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;

--학생 테이블에 cno 외래키 추가
ALTER TABLE 학생
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES 수업(cno);

--제약조건 삭제하기
ALTER TABLE 수업
DROP PRIMARY KEY CASCADE; --CASCADE 삭제 시 관계되는 제약조건을 같이 삭제

ALTER TABLE 수업
DROP UNIQUE(cname);

ALTER TABLE 학생
DROP PRIMARY KEY;

ALTER TABLE 학생
DROP CONSTRAINT STUDENT_SNAME_NN;

--CREATE TABLE 테이블 AS SELECT문
--SELECT문의 결과를 새로 만든 테이블에 저장
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees
WHERE 1 != 1; --항상 거짓이므로 직원테이블의 열구조만 복사되어 저장됨

SELECT * FROM EMP_TEMP;


--원하는 열과 행만 복사
CREATE TABLE EMP80
AS 
SELECT employee_id 직원번호, last_name 이름, salary*12 연봉, hire_date 고용일자
FROM employees
WHERE department_id = 80;

SELECT * FROM emp80;

--예제
CREATE TABLE stmans
AS
SELECT employee_id id, job_id job, salary sal
FROM employees
WHERE job_id = 'ST_MAN';

SELECT * FROM stmans;