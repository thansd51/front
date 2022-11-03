--View

--�ܼ��� ��
DROP VIEW EMP_V1;

CREATE VIEW EMP_V1(������ȣ, �̸�, ��, �̸���, �����, ����)
AS
SELECT EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,HIRE_DATE,JOB_ID
FROM EMPLOYEES;

select * from emp_v1;

--�信 ������ �Է� �� �����δ� �並 ���� �� ����� ���̺� �Է�
INSERT INTO emp_v1
VALUES(333, '���', '��', 'PENG', SYSDATE,'IT_PROG');

select * from employees
where employee_id = 333;

--������ ��
--�׷��Լ��� ����� ��� DRML �Ұ�
CREATE OR REPLACE VIEW  �μ���_����_����
AS
SELECT DEPARTMENT_ID �μ���ȣ, COUNT(*) ������,
ROUND(AVG(salary)) ��ձ޿�
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

SELECT * FROM �μ���_����_����;

--�б⸸ ������ ��
--90�� �μ� �������� �б� ���� ��
CREATE OR REPLACE VIEW  emp90_read(������ȣ, �̸�, ��, �̸���, �����, ����)
AS
SELECT employee_id, first_name, last_name, email, hire_date, job_id
FROM EMPLOYEES
WHERE department_id = 90
WITH READ ONLY;

SELECT * FROM emp90_read; --�б� ����

--�ε���
--�ε��� ��ȸȭ��(�⺻Ű ���� �ڵ����� �ε��� ����)
SELECT * FROM all_ind_columns
WHERE table_name = 'MEMBERS';

--�ε��� �ǽ��� ���̺�
CREATE TABLE members(
    member_id INT,
    first_name VARCHAR2(100) NOT NULL,
    last_name VARCHAR2(100) NOT NULL,
    gender CHAR(1) NOT NULL,
    dob DATE NOT NULL,
    email VARCHAR2(255) NOT NULL,
    PRIMARY KEY(member_id)
);

--�˻�
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name = 'Harse';

SELECT
 PLAN_TABLE_OUTPUT
FROM
 TABLE(DBMS_XPLAN.DISPLAY());


--�ε��� �����
CREATE INDEX members_last_name_i
ON members(last_name);

--����
DROP INDEX members_last_name_i;

--��Ƽ �ε���
CREATE INDEX members_name_i
ON members(last_name, first_name);

--�˻�
EXPLAIN PLAN FOR
SELECT * FROM members
WHERE last_name LIKE 'A%' AND first_name LIKE 'M%';

SELECT
 PLAN_TABLE_OUTPUT
FROM
 TABLE(DBMS_XPLAN.DISPLAY());
 

 
--������
--������ ����
CREATE SEQUENCE ������1;
DROP SEQUENCE ������1; 

--������ ���� Ȯ��
SELECT * FROM USER_SEQUENCES
WHERE SEQUENCE_NAME = '������1';

--������ ����(.NEXTVAL, .CURRVAL)
SELECT ������1.NEXTVAL FROM DUAL;
SELECT ������1.CURRVAL FROM DUAL;

CREATE TABLE ����
( emp_id NUMBER(6) PRIMARY KEY,
  name VARCHAR2(50) NOT NULL
 );

--�������� �̿��ؼ� ������ id �˻�
--100000 �����ϴ� ������2 ����
CREATE SEQUENCE ������2
START WITH 100000
INCREMENT BY 10;
--���� ���̺� �Է�
INSERT INTO ���� VALUES (������2.NEXTVAL,'���');
INSERT INTO ���� VALUES (������2.NEXTVAL,'�浿');
INSERT INTO ���� VALUES (������2.NEXTVAL,'���');
INSERT INTO ���� VALUES (������2.NEXTVAL,'����');
INSERT INTO ���� VALUES (������2.NEXTVAL,'����');

select * from ����;
--������ ������Ʈ
UPDATE ����
SET emp_id=������1.NEXTVAL;

--�ο��
--������ n��°���� ���
SELECT ROWNUM, EMP.* 
FROM EMP 
WHERE ROWNUM <= 5;

--�߰� 6~10��(���������� ������ RN���� ���ϰ� ������������ RN�� �߰����� ���)
SELECT E.* 
FROM (SELECT ROWNUM AS RN, EMP.* FROM EMP) E 
WHERE RN BETWEEN 6 AND 10;

--���� ������ �� �߰���ȣ ���
SELECT ROWNUM, Emp.* 
FROM emp
WHERE ROWNUM <= 5
ORDER BY sal DESC;

SELECT * FROM emp ORDER BY sal DESC;

--���������� ������ ���� �ϰ� ROWNUM���� �����Ѵ�
SELECT ROWNUM, A.*
FROM(SELECT empno, ename, sal FROM emp ORDER BY sal DESC)A
WHERE ROWNUM <= 5;

--HR �������� 13��
SELECT B.last_name, first_name, salary
FROM
(SELECT ROWNUM AS RN, A.*
FROM(SELECT * FROM employees ORDER BY salary DESC)A
)B
WHERE RN BETWEEN 6 AND 10;