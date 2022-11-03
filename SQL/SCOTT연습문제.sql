--����1
SELECT empno, ename, sal
FROM  emp
WHERE deptno = 10;

--����2
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

--����3
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename = 'ALLEN';

--����4
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';

--����5
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE job != 'MANAGER';

--����6
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate >= '81/04/02';

--����7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

--����8
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE deptno >= 20;

--����9
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename > 'L';

--����10
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate < '81/12/09';

--����11
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

--����12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--����13
SELECT empno, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

SELECT empno, job, sal
FROM emp
WHERE sal > 1600
AND sal < 3000;


--����14
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--����15
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

--����16
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE NOT (hiredate > '81/01/01'
AND hiredate < '81/12/31');

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

--����17
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE job = 'MANAGER'
OR job = 'SALESMAN';

--����18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN(20, 30);

--����19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--����20
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';

--����21
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '%S%';

--����22
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE 'M%'
AND ename LIKE '%N';

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE 'M____N';

--����23
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '_A%';

--����24
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS NULL;

--����25
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS NOT NULL;

--����26
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30
AND sal >= 1500;

--����27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%'
OR deptno = 30;

--����28
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE sal >= 1500
AND deptno = 30
AND job = 'MANAGER';

--����29
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

--����30
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
ORDER BY sal DESC;

--����31
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
ORDER BY deptno, sal DESC;

--����32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

--����33
SELECT ename, sal, round(sal*0.13) ���ʽ�, deptno
FROM emp
WHERE deptno = 10;

--����34
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) total
FROM emp
ORDER BY total DESC;

--����35
SELECT ename, sal, TO_CHAR(round(sal*0.15, 1), '$999.9') ȸ��
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

--����36
SELECT dname, COUNT(e.empno)
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY dname
HAVING COUNT(*) > 5;

--����37
SELECT job, SUM(sal) �޿��հ�
FROM emp
WHERE job != 'SALESMAN'
GROUP by job
HAVING SUM(sal) > 5000;

--����38
SELECT empno, ename, sal, grade
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal
ORDER BY sal;

--����39
SELECT deptno, COUNT(deptno) �����, COUNT(comm) "Ŀ�̼� ���� �����"
FROM emp
GROUP BY deptno;

--����40
SELECT ename, deptno, DECODE(deptno, 10, '�ѹ���',
                                     20, '���ߺ�',
                                         '������') �μ���
FROM emp;

SELECT ename, deptno, CASE deptno WHEN 10 THEN '�ѹ���'
                                  WHEN 20 THEN '���ߺ�'
                                  ELSE         '������'
                      END �μ���
FROM emp;






