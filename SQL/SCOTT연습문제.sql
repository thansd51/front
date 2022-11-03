--문제1
SELECT empno, ename, sal
FROM  emp
WHERE deptno = 10;

--문제2
SELECT ename, hiredate, deptno
FROM emp
WHERE empno = 7369;

--문제3
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename = 'ALLEN';

--문제4
SELECT ename, deptno, sal
FROM emp
WHERE hiredate = '81/02/20';

--문제5
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE job != 'MANAGER';

--문제6
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate >= '81/04/02';

--문제7
SELECT ename, sal, deptno
FROM emp
WHERE sal >= 800;

--문제8
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE deptno >= 20;

--문제9
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename > 'L';

--문제10
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate < '81/12/09';

--문제11
SELECT empno, ename
FROM emp
WHERE empno <= 7698;

--문제12
SELECT ename, sal, deptno
FROM emp
WHERE hiredate BETWEEN '81/04/02' AND '82/12/09';

--문제13
SELECT empno, job, sal
FROM emp
WHERE sal BETWEEN 1601 AND 2999;

SELECT empno, job, sal
FROM emp
WHERE sal > 1600
AND sal < 3000;


--문제14
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE empno NOT BETWEEN 7654 AND 7782;

--문제15
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

--문제16
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE NOT (hiredate > '81/01/01'
AND hiredate < '81/12/31');

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate NOT BETWEEN '81/01/01' AND '81/12/31';

--문제17
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE job = 'MANAGER'
OR job = 'SALESMAN';

--문제18
SELECT ename, empno, deptno
FROM emp
WHERE deptno NOT IN(20, 30);

--문제19
SELECT empno, ename, hiredate, deptno
FROM emp
WHERE ename LIKE 'S%';

--문제20
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE hiredate BETWEEN '81/01/01' AND '81/12/31';

--문제21
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '%S%';

--문제22
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE 'M%'
AND ename LIKE '%N';

SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE 'M____N';

--문제23
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE ename LIKE '_A%';

--문제24
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS NULL;

--문제25
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE comm IS NOT NULL;

--문제26
SELECT ename, deptno, sal
FROM emp
WHERE deptno = 30
AND sal >= 1500;

--문제27
SELECT empno, ename, deptno
FROM emp
WHERE ename LIKE 'K%'
OR deptno = 30;

--문제28
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE sal >= 1500
AND deptno = 30
AND job = 'MANAGER';

--문제29
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
WHERE deptno = 30
ORDER BY empno ASC;

--문제30
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
ORDER BY sal DESC;

--문제31
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp
ORDER BY deptno, sal DESC;

--문제32
SELECT deptno, ename, sal
FROM emp
ORDER BY deptno DESC, ename, sal DESC;

--문제33
SELECT ename, sal, round(sal*0.13) 보너스, deptno
FROM emp
WHERE deptno = 10;

--문제34
SELECT ename, sal, NVL(comm, 0), sal+NVL(comm, 0) total
FROM emp
ORDER BY total DESC;

--문제35
SELECT ename, sal, TO_CHAR(round(sal*0.15, 1), '$999.9') 회비
FROM emp
WHERE sal BETWEEN 1500 AND 3000;

--문제36
SELECT dname, COUNT(e.empno)
FROM emp e
JOIN dept d
ON e.deptno=d.deptno
GROUP BY dname
HAVING COUNT(*) > 5;

--문제37
SELECT job, SUM(sal) 급여합계
FROM emp
WHERE job != 'SALESMAN'
GROUP by job
HAVING SUM(sal) > 5000;

--문제38
SELECT empno, ename, sal, grade
FROM emp
JOIN salgrade
ON sal BETWEEN losal AND hisal
ORDER BY sal;

--문제39
SELECT deptno, COUNT(deptno) 사원수, COUNT(comm) "커미션 받은 사원수"
FROM emp
GROUP BY deptno;

--문제40
SELECT ename, deptno, DECODE(deptno, 10, '총무부',
                                     20, '개발부',
                                         '영업부') 부서명
FROM emp;

SELECT ename, deptno, CASE deptno WHEN 10 THEN '총무부'
                                  WHEN 20 THEN '개발부'
                                  ELSE         '영업부'
                      END 부서명
FROM emp;






