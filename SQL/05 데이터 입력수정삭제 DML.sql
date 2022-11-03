--데이터 입력 INSERT
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

-- 모든열의 값을 다 넣을때는 테이블이름 다음 괄호생략 가능
INSERT INTO employees
VALUES  (207, '펭수', '김','PENG', '010.123.1234', SYSDATE, 'IT_PROG', 
                    9999, NULL, 205, 300);
                    
--예제1
INSERT INTO departments(department_id, department_name, manager_id, location_id)
values(273, 'Sample Dept 3', 200, 1700);

--데이터 수정 UPDATE
UPDATE departments
SET manager_id = 200, location_id = 1700
WHERE department_name = 'Music';

--예제1     
UPDATE departments
SET manager_id = 100
WHERE department_id BETWEEN 150 AND 200;

SELECT *
FROM departments
ORDER BY department_id DESC;

--데이터 삭제 DELETE
SELECT *
FROM employees
ORDER BY department_id DESC;

DELETE FROM departments
WHERE department_name = 'Music';

--외래키 삭제 에러(펭수 직원의 부서가 게임 부서이기 떄문에 게임부서를 삭제 시 펭수의 부서가 없어짐)
DELETE FROM departments
WHERE department_name = 'Game';
--펭수 삭제
DELETE FROM employees
WHERE first_name = '펭수';

--WHERE절이 없으면 전체 테이블 내용 삭제
DELETE FROM job_history;

SELECT *
FROM job_history;

UPDATE employees
SET salary = '100';

--그전 commit 상태로 되돌아감
ROLLBACK;
--영구저장
COMMIT;

--문자형 데이터 타입 VARCHAR2
DESC test;
INSERT INTO test
VALUES(1, 'abcdefghij1234567890');

--한글 3바이트, 영어, 숫자 1바이트
INSERT INTO test
VALUES(2, '가나다라마바');

INSERT INTO test
VALUES(3, '가나다라마바');

INSERT INTO test
VALUES(4, '현재날짜입력', SYSDATE);

INSERT INTO test
VALUES(5, '문자일로입력', '22/03/07');

INSERT INTO test(id, name)
VALUES(6, '현재날짜입력');

SELECT * FROM test;
