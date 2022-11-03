--새로운 사용자 만들기
CREATE USER john IDENTIFIED BY 1234;

--접속 권한 주기 GRANT
GRANT CREATE SESSION TO john;

--권한들의 묶음 ROLE CONNET, RESOURCE, DBA 중에 CONNECT, RESOURCE를 신규 유저에게 주기
GRANT CONNECT, RESOURCE TO john;

--테이블 생성 권한
GRANT CREATE TABLE TO john;

--뷰 생성 권한
GRANT CREATE VIEW TO john;

--권한 회수
--REVOKE 권한명 FROM 계정;
REVOKE CREATE VIEW FROM john;

--테이블 생성 권한 회수
REVOKE CREATE TABLE FROM john;

--객체 생성, 수정, 삭제 권한 회수
REVOKE RESOURCE FROM john;

--계정 삭제(관련된 모든 내용 삭제)
DROP USER john CASCADE;

--PL/SQL
--익명 블록
--출력을 위한 옵션
SET SERVEROUTPUT ON; 

BEGIN
    DBMS_OUTPUT.PUT_LINE('헬로우월드!');
END;
/

--PL/SQL 옆에 주석 X

DECLARE
  message VARCHAR2( 100 ) := '변수에 입력';
BEGIN
    DBMS_OUTPUT.PUT_LINE(message);
END;
/
DECLARE
  v_name emp.ename%TYPE;
BEGIN
  v_name := '홍길동';
  DBMS_OUTPUT.PUT_LINE(v_name);
END;
/

--프로시저
CREATE OR REPLACE PROCEDURE update_sal 
 (in_empno IN NUMBER)      
 IS 
 BEGIN 
   UPDATE emp 
   SET sal = sal  * 1.1 
   WHERE empno = in_empno; 
--   commit;
 END update_sal; 
/
EXECUTE update_sal(7369);

-- adjust_salary(직원번호, 임금인상률%)
CREATE OR REPLACE PROCEDURE adjust_salary(
    in_empno IN emp.empno%TYPE,
    in_percent IN NUMBER
) IS
BEGIN
   -- 직원번호의 임금을 in_percent% 만큼 올림
   UPDATE emp
   SET sal = sal + sal * in_percent / 100
   WHERE empno = in_empno;
--   commit;
END;
/
EXEC adjust_salary(7839, 50);

UPDATE emp
SET sal = 800
WHERE empno = 7369;

--테스트 테이블에 100개의 데이터 입력
DECLARE
    v_cnt NUMBER := 1;
BEGIN

    LOOP
        INSERT INTO TEST(id, name)
        VALUES(v_cnt, '테스트'||to_char(v_cnt));
    
        v_cnt := v_cnt+1;
    
        EXIT WHEN v_cnt > 100;
        --변수 v_cnt가 100이 넘으면 종료
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE('데이터 입력 완료');
    DBMS_OUTPUT.PUT_LINE(v_cnt-1 || '개의 데이터가 입력되었습니다');

END; 
/
select * from TEST;