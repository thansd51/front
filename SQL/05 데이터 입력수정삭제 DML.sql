--������ �Է� INSERT
INSERT INTO departments(department_id, department_name, manager_id, location_id)
VALUES (300, 'Game', 100, 1700);

SELECT *
FROM departments
WHERE department_id = 300;

desc departments;

INSERT INTO departments(department_id, department_name)
VALUES(280, 'Music');

SELECT *
FROM departments
WHERE department_id = 280;

-- ��翭�� ���� �� �������� ���̺��̸� ���� ��ȣ���� ����
INSERT INTO employees
VALUES  (207, '���', '��','PENG', '010.123.1234', SYSDATE, 'IT_PROG', 
                    9999, NULL, 205, 300);
                    
--����1
INSERT INTO departments(department_id, department_name, manager_id, location_id)
values(273, 'Sample Dept 3', 200, 1700);

--������ ���� UPDATE
UPDATE departments
SET manager_id = 200, location_id = 1700
WHERE department_name = 'Music';

--����1     
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;

SELECT *
FROM departments
ORDER BY department_id DESC;

--������ ���� DELETE
SELECT *
FROM employees
ORDER BY department_id DESC;

DELETE FROM departments
WHERE department_name = 'Music';

--�ܷ�Ű ���� ����(��� ������ �μ��� ���� �μ��̱� ������ ���Ӻμ��� ���� �� ����� �μ��� ������)
DELETE FROM departments
WHERE department_name = 'Game';
--��� ����
DELETE FROM employees
WHERE first_name = '���';

--WHERE���� ������ ��ü ���̺� ���� ����
DELETE FROM job_history;

SELECT *
FROM job_history;

UPDATE employees
SET salary = '100';

--���� commit ���·� �ǵ��ư�
ROLLBACK;
--��������
COMMIT;

--������ ������ Ÿ�� VARCHAR2
DESC test;
INSERT INTO test
VALUES(1, 'abcdefghij1234567890');

--�ѱ� 3����Ʈ, ����, ���� 1����Ʈ
INSERT INTO test
VALUES(2, '�����ٶ󸶹�');

INSERT INTO test
VALUES(3, '�����ٶ󸶹�');

INSERT INTO test
VALUES(4, '���糯¥�Է�', SYSDATE);

INSERT INTO test
VALUES(5, '�����Ϸ��Է�', '22/03/07');

INSERT INTO test(id, name)
VALUES(6, '���糯¥�Է�');

SELECT * FROM test;
