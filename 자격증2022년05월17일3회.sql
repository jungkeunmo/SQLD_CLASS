USE scott;

SHOW tables;

-- * = all
SELECT * FROM bonus;
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;

-- 	emp 테이블에 직원번호, 직원명, 직책, 입사일, 부서번호를 출력하세요.

DESC emp;

SELECT	EMPNO,
		ENAME,
        JOB,
        HIREDATE,
        DEPTNO
  FROM	emp;
  
-- 정렬, 그룹핑
-- 내림차순, 오름차순
-- DESC  ,  ASC  
-- ORDER BY 컬럼명 DESC || ASC
-- 엘레베이터 => 내려갈거야! 	7층 -> 1층 내림차순
--    		  올라갈거야! 	1층 -> 7층 오름차순	

-- emp 테이블에 직원번호, 직원명, 직책, 입사일, 부서번호를 오름차순으로 출력하세요.
SELECT 	EMPNO,
		ENAME,
		JOB,
		HIREDATE,
		DEPTNO
  FROM 	emp
 ORDER	BY 	ENAME	ASC;

-- 부서번호를 기준으로 각 부서별 몇 명이 있는지 조회하세요.!
SELECT	DEPTNO,
		COUNT(EMPNO)
  FROM	emp
 GROUP	BY	DEPTNO;
 
-- 직책 별 각각 몇 명이 있는지 조회하세요.!
SELECT	JOB,
        CONCAT(COUNT(EMPNO), "명")
  FROM	emp
 GROUP	BY JOB;
 
-- DATABASE의 꽃	 ->	  DB(RDB)  -> 조인(JOIN)
SELECT * FROM emp;

SELECT * FROM dept; 

-- emp테이블의 직원 정보를 조회하고 싶은데,
-- 직원번호, 직원명, 직책, 급여, 부서명 을 조회하고싶어요.
--           emp         |	 		dept

SELECT 	A.EMPNO,
		A.ENAME,
        A.JOB,
        B.DNAME
  FROM 	emp		A
 INNER
  JOIN	dept	B
    ON	A.DEPTNO = B.DEPTNO;
	
-- emp 테이블의 직원 정보를 조회하고 싶은데,
-- 직원번호, 직원명, 직책, 급여, 부서명 ,사는곳 을 조회하고싶어요.

SELECT	A.EMPNO,
		A.ENAME,
        A.JOB,
        B.DNAME,
        B.LOC
  FROM	emp		A
 INNER
  JOIN	dept	B
    ON	A.DEPTNO = B.DEPTNO;



 
 
 





  