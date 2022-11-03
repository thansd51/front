--������ �Լ�

--�����Լ�
--��ҹ��� ��ȯ�Լ�
SELECT UPPER('SQL Course'),
       LOWER('SQL Course'),
       INITCAP('SQL Course')
FROM DUAL;

--���� ���� �Լ�
SELECT CONCAT('��ο�', '����'),
       SUBSTR('ABCDEFG', 2, 5),
       LENGTH('ABCDEFG'),
       INSTR('ABCDEFG', 'B')
FROM DUAL;

--���� ���ֱ� TRIM
SELECT TRIM('  ��ο�  '), '  ��ο�  '
FROM DUAL;

--������ �Լ� ����
SELECT department_id, last_name, department_id
FROM employees
WHERE LOWER(last_name) = 'higgins'; --��ҹ��� ���� ���� ��� ��ȯ�ؼ� ��ȸ����

--���ڿ� �ٲٱ�
SELECT job_id, REPLACE(job_id, 'ACCOUNT', 'ACCNT') ������
FROM employees; 

--����1
SELECT last_name, LOWER(last_name) LOWER����, UPPER(last_name) UPPER����,
email �̸���, INITCAP(email)INITCAP����
FROM employees;

--����2
SELECT job_id ������, SUBSTR(job_id, 1, 2) ����2��
FROM employees;

--�������Լ�
--ROUND�Լ�-�ݿø�
SELECT ROUND(15.193,1) �Ҽ�ù°, 
       ROUND(15.193,0) ����,
       ROUND(15.193,-1) "10���ڸ�"
FROM dual;

--TRUNC�Լ�-����
SELECT TRUNC(15.79,1) �Ҽ�ù°, 
       TRUNC(15.79,0) ����,
       TRUNC(15.79,-1) "10���ڸ�"
FROM dual;

--MOD�Լ�-���� �� ������
SELECT employee_id ¦��, last_name
FROM employees
WHERE MOD(employee_id, 2) = 0
ORDER BY 1;

--����1
SELECT salary, ROUND(salary/30) ����, ROUND(salary/30, 1) �Ҽ�1, ROUND(salary/30, -1) "10���ڸ�"
FROM employees;

--��¥�Լ�
SELECT sysdate 
FROM dual;

SELECT  ROUND(sysdate, 'DD') ��,
        ROUND(sysdate, 'MM') ��,   
        ROUND(sysdate, 'YYYY') �⵵, 
        MONTHS_BETWEEN('2017/10/10', '2017/07/10') ������,
        ADD_MONTHS('2017/07/10', 3) �ֵ�վ�
FROM dual;

--��¥�� ���� ����
SELECT SYSDATE-1 ����, SYSDATE ����, SYSDATE+1 ����
FROM DUAL;
--90�� �μ� �������� ���ñ����� �ٹ��ϼ�(���� ��¥ - �����)
SELECT last_name, FLOOR(SYSDATE - hire_date) �ٹ��ϼ�
FROM employees
WHERE department_id=90;

--�ٹ������� 200������ �ȵ� ������
SELECT employee_id, hire_date, 
       FLOOR(MONTHS_BETWEEN(SYSDATE,hire_date)) �ٹ�����,
       ADD_MONTHS(hire_date, 6) "6���� �߰�",
       NEXT_DAY(hire_date, '�ݿ���') Next_day, 
       --1(��), 2(��), 3(ȭ), 4(��), 5(��), 6(��), 7(��) 
       LAST_DAY(hire_date) Last_day
       --���� ������ ��
FROM employees
WHERE MONTHS_BETWEEN(SYSDATE,hire_date) < 200;

--����1
SELECT sysdate, hire_date, FLOOR(MONTHS_BETWEEN(sysdate, hire_date)) ������
FROM employees
WHERE department_id=100;

--����2
SELECT hire_date, ADD_MONTHS(hire_date, 3) ���ϱ�_3����, ADD_MONTHS(hire_date, -3) ����_3����
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

--��ȯ�� �Լ�

--���� > ����
-- �޸� ����
SELECT TO_CHAR(12345678,'999,999,999') comma 
FROM DUAL;
 
-- �Ҽ��� ����  
SELECT TO_CHAR(123.45678,'999,999,999.99') period 
FROM DUAL; 
 
-- $ ǥ�� ����
SELECT TO_CHAR(12345678,'$999,999,999') dollar  
FROM DUAL;
 
-- Local ȭ�� ǥ�� ���� (�ѱ��� ��� �ܷ� �ڵ� ��ȯ ��)
SELECT TO_CHAR(12345678,'L999,999,999') local  
FROM DUAL;
 
-- ���ʿ� 0�� ����
SELECT TO_CHAR(123,'09999') zero 
FROM DUAL;  
 
-- 16������ ��ȯ
SELECT TO_CHAR(123,'XXXX') hexadecimal  
FROM DUAL;

--��¥ > ����
-- ��,��,��,��,��,�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD AM HH:MI:SS') "sysdate"
FROM DUAL;
 
-- 365�� �� �� ��°���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'DDD') "Day of year" 
FROM DUAL;
 
-- 53�� �� �� ���� ���� ��ȸ
SELECT TO_CHAR(SYSDATE, 'IW') "Week of year" 
FROM DUAL;
 
-- �ش� ���� �̸� ��ȸ
SELECT TO_CHAR(SYSDATE, 'MONTH') "Name of month" 
FROM DUAL;

--����1
SELECT employee_id, TO_CHAR(hire_date, 'MM/YY') �Ի��
FROM employees
WHERE department_id = 100;

--����2
SELECT last_name �̸�, TO_CHAR(salary, '$99,999.99') ����
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

--TO_DATE ���ڿ� > ��¥

-- DATE Ÿ������ ��ȯ�ϴ� ����
SELECT TO_DATE('2011-01-01','YYYY-MM-DD') 
FROM DUAL;

-- ���ڸ� ���ڷ� ��ȯ�ϴ� ������ �����̴�.
SELECT TO_NUMBER('01210616')
FROM DUAL; 

--NULL ���� �Լ�

-- �Ŵ����� ���� ���� 0���� �ٲپ ����ϴ� ����.
SELECT last_name, NVL(manager_id, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';
-- NVL(expr, expr1, expr2) expr�� ���� null�� �ƴ� ��� expr1, ���� ��� expr2
SELECT last_name, NVL2(manager_id, 1, 0) �Ŵ���
FROM employees
WHERE last_name = 'King';

--����1
SELECT last_name �̸�, salary ����,  NVL(commission_pct, 0) Ŀ�̼�, (salary*12)+(salary*12*NVL(commission_pct, 0)) ����  
FROM employees
ORDER BY ���� DESC;

--����2
SELECT last_name �̸�, salary ����,  NVL(commission_pct, 0) Ŀ�̼�, (salary*12)+(salary*12*NVL(commission_pct, 0)) ����, NVL2(commission_pct, 'SAL+COMM', 'SAL') �������  
FROM employees
ORDER BY ���� DESC;

--DECODE�Լ�
SELECT last_name �̸�, job_id, salary,
    DECODE(job_id, 'IT_PROG',  salary * 1.10,
                   'ST_CLERK', salary * 1.15,
                   'SA_REP',   salary * 1.20,
                               salary)  "��������"
FROM employees;

--����1
SELECT last_name �̸�, job_id ����, salary ����,
DECODE(TRUNC(salary/2000), 0, 0,
                           1, 0.09,
                           2, 0.2,
                           3, 0.3,
                           4, 0.4,
                           5, 0.42,
                           6, 0.44,
                              0.45) "����"
FROM employees;

--CASE�Լ�
SELECT last_name �̸�, job_id, salary,
    CASE  WHEN salary<5000   THEN 'Low'
          WHEN salary<10000  THEN 'Medium'
          WHEN salary<20000  THEN 'Good'
          ELSE                    'Excellent'  
    END "�޿� ����"
FROM employees;

--����1
SELECT employee_id, first_name, last_name, salary,
CASE WHEN salary >= 9000 THEN '�����޿�'
   WHEN 6000 <= salary THEN '�����޿�'
     ELSE '�����޿�'
     END "�޿� ����"
FROM employees;