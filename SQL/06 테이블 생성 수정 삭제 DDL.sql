SELECT department_id, employee_id, last_name
FROM employees
WHERE salary IN ( SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id;


INSERT INTO ���� VALUES ('01', '�����ͺ��̽�');
INSERT INTO ���� VALUES ('02', '���α׷���');
INSERT INTO ���� VALUES ('03', '�ڹ�');

SELECT * FROM ����;

CREATE TABLE �л�(
    sno VARCHAR2(4),
    sname VARCHAR2(50),
    cno VARCHAR2(2)
);

INSERT INTO �л� VALUES ('0414', 'ȫ�浿', '01');
INSERT INTO �л� VALUES ('0415', '�Ӳ���', '02');
INSERT INTO �л� VALUES ('0416', '�̼���', '03');
SELECT * FROM �л�;

--�л�, ���� ���̺� �������� �߰�
--�⺻Ű �߰�
ALTER TABLE ����
ADD CONSTRAINT class_cno_pk PRIMARY KEY(cno);

ALTER TABLE �л�
ADD CONSTRAINT student_sno_pk PRIMARY KEY(sno);

--����ũŰ �߰�
ALTER TABLE ����
ADD CONSTRAINT class_cname_uk UNIQUE (cname);

--NOT NULL
ALTER TABLE �л�
MODIFY sname CONSTRAINT student_sname_nn NOT NULL;

--�л� ���̺� cno �ܷ�Ű �߰�
ALTER TABLE �л�
ADD CONSTRAINT student_cno_fk FOREIGN KEY (cno) REFERENCES ����(cno);

--�������� �����ϱ�
ALTER TABLE ����
DROP PRIMARY KEY CASCADE; --CASCADE ���� �� ����Ǵ� ���������� ���� ����

ALTER TABLE ����
DROP UNIQUE(cname);

ALTER TABLE �л�
DROP PRIMARY KEY;

ALTER TABLE �л�
DROP CONSTRAINT STUDENT_SNAME_NN;

--CREATE TABLE ���̺� AS SELECT��
--SELECT���� ����� ���� ���� ���̺� ����
CREATE TABLE EMP_TEMP
AS
SELECT * FROM employees
WHERE 1 != 1; --�׻� �����̹Ƿ� �������̺��� �������� ����Ǿ� �����

SELECT * FROM EMP_TEMP;


--���ϴ� ���� �ุ ����
CREATE TABLE EMP80
AS 
SELECT employee_id ������ȣ, last_name �̸�, salary*12 ����, hire_date �������
FROM employees
WHERE department_id = 80;

SELECT * FROM emp80;

--����
CREATE TABLE stmans
AS
SELECT employee_id id, job_id job, salary sal
FROM employees
WHERE job_id = 'ST_MAN';

SELECT * FROM stmans;