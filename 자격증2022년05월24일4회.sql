USE scott;

SELECT * FROM dept;
SELECT * FROM emp;
    

-- 모든 사원의 이름 , 부서번호, 부서이름을 표시하시오.(emp,dept)
DESC emp;
DESC dept;

SELECT 	A.ENAME,
		A.DEPTNO,
        B.DNAME
  FROM	emp		A
 INNER	
  JOIN	dept	B
    ON	A.DEPTNO = B.DEPTNO;
    
-- 커미션을 받고 급여가 1,600이상인 사원의 사원이름,부서명, 근무자를 출력하시오.
-- COMM이 NULL일 경우 0으로 계산하고 싶어요! 
-- IFNULL(데이터, 대치값)
-- 다른 말로는 NVL 이라고 한다.

	SELECT	A.ENAME,
            B.DNAME,
            B.LOC
      FROM	emp		A
     INNER 
	  JOIN	dept	B
        ON	A.DEPTNO = B.DEPTNO
     WHERE  A.SAL + IFNULL(A.COMM, 0) >= 1600;
      
-- 근무자가 CHICAGO 인 모든 사원의 이름, 업무, 부서번호 및 부서이름을 표시하시오.
	SELECT	A.ENAME,
			A.JOB,
            A.DEPTNO,
            B.DNAME
      FROM 	emp		A
     INNER
      JOIN	dept	B
		ON	A.DEPTNO = B.DEPTNO
     WHERE	B.LOC = "CHICAGO";
     
-- 업무가 MANAGER인 사원의 정보를 이름, 업무, 부서명, 근무자 순으로 출력하시오. (emp, dept)       
	SELECT A.ENAME, 
		   A.JOB,
           B.DNAME,
           B.LOC
	  FROM 	emp		A
     INNER
      JOIN	dept	B
        ON	A.DEPTNO = B.DEPTNO
 WHERE A.JOB = 'MANAGER';  
 
 
-- 서브쿼리 (SUBQUERY) 
-- 쿼리 안에서, 다른 쿼리를 작성하는 쿼리방식
-- 실행 프로세스
-- functionA( functionB( functionC() ) )
-- >> (	(	()))
-- 가장 안 쪽에 있는 함수가 제일 먼저 실행된다.

SELECT	MAX(SAL) 
  FROM	emp;

-- 테스트
SELECT 	"Hello"
  FROM	DUAL;
    
-- 쿼리안에서는 하나만 붙음    

SELECT EMPNO,
	   ENAME,
       JOB,
       SAL,
       (
			SELECT "Hello"
			  FROM DUAL
       )
  FROM emp; 
    
SELECT EMPNO,
	   ENAME,
       JOB,
       SAL,
       (
			SELECT MAX(SAL)
			  FROM emp
       )
  FROM emp; 
  
-- 가장 높은 급여를 받고 있는 사람의 이름과 직무는 무엇인가요?(안쪽에서 바깥으로)

SELECT	ENAME,
		JOB
  FROM	emp
 WHERE	SAL = (
				SELECT	MAX(SAL)
                  FROM	emp
			);
            
-- 모든 사원의 이름과 급여 그리고, 가장 높은 급여와의 차액은 얼마인지 구하세요.
-- 차액의 컬럼이름은 "ing" 이라고 설정하세요.

SELECT	ENAME,
		SAL,
        (
			SELECT MAX(SAL)
			  FROM	emp
		) - SAL		AS "ing"
  FROM  emp; 
            
-- FORD와 업무가 같은 사원의 사원명, 업무, 급여, 부서번호, 부서명을 출력하세요.

SELECT A.ENAME,
	   A.JOB,
	   A.SAL,
       A.DEPTNO,
       B.DNAME
  FROM emp		A
 INNER
  JOIN dept		B
    ON A.DEPTNO = B.DEPTNO
 WHERE A.JOB = (
				SELECT	JOB
				  FROM	emp
				 WHERE	ENAME = "FORD"
				);

-- CHICAGO에서 근무중인 직원들의 평균 급여를 구하세요.
SELECT	EMPNO	
  FROM 	emp 	A
 INNER
  JOIN	dept	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE B.LOC = "CHICAGO";
 
SELECT	AVG(SAL)
  FROM	emp
 WHERE 	EMPNO IN (
				SELECT	EMPNO	
				  FROM 	emp 	A
			     INNER
                  JOIN	dept	B
					ON	A.DEPTNO = B.DEPTNO
				 WHERE B.LOC = "CHICAGO"
				);
                
-- NEW YOUK에서 근무중인 직원들의 편균 급여를 구하세요.
SELECT 	EMPNO
  FROM	emp		A
 INNER
  JOIN	dept	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE  B.LOC = "NEW YORK"; 
  
SELECT AVG(SAL)
  FROM emp
 WHERE EMPNO IN (
					SELECT 	EMPNO
					  FROM	emp		A
					 INNER
					  JOIN	dept	B
						ON	A.DEPTNO = B.DEPTNO
					 WHERE  B.LOC = "NEW YORK"
				);
    
   

-- 서브쿼리
-- 스칼라쿼리
-- 윈도우 함수
-- 롤업
-- 케이스
--   
                
            
