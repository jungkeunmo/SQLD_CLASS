-- 최소 2000문제를 풀어야 합격 간당간당
use scott;

-- 윈도우 함수
-- GROUP BY와 유사 - 데이터를 잃어버리지 않는다.
-- COUNT, AVG, SUM, MIN, MAX, ROUND
-- RANK 함수

SELECT * FROM EMP; -- 14개의 데이터
SELECT * FROM DEPT;

-- emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오.

SELECT 	ENAME,
		SAL,
        COMM
  FROM	EMP
 WHERE	COMM IS NOT NULL;
 
-- 평균급여 이상의 급여를 받는 사람들의 사원번호, 이름, 급여를 출력하세요.
-- 단, 급여가 높은 순으로 정렬하세요.
 
SELECT	EMPNO,
		ENAME,
        ROUND(SAL)
  FROM	EMP;

-- 사원수가 3명이 넘는 부서의 부서명과 사원수를 출력하세요.
-- 단 , 부서번호가 낮은 번호부터 나오도록 정렬하세요.

SELECT	B.DNAME,
		COUNT(A.EMPNO)
  FROM	EMP		A
 INNER	
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 GROUP	BY	A.DEPTNO
HAVING	COUNT(A.EMPNO) > 3; 
	
-- 직속상사가 'KING'인 모든 직원의 직원번호, 이름, 급여, 부서번호를 출력하세요.
 
SELECT	EMPNO
  FROM	EMP 
 WHERE 	ENAME = 'KING';
	
SELECT	EMPNO,
		ENAME,
        SAL,
        DEPTNO
  FROM  EMP
 WHERE	MGR	= (
	SELECT	EMPNO
      FROM	EMP 
     WHERE 	ENAME = 'KING'
 ); 
 
 


 
-- RANK류의 함수 ⭐️⭐️⭐️⭐️⭐️ - 시험에도 많이 나옴
-- RANK() : 값이 같으면 같은 순위를 부여하지만, 다음 순위를 건너 뜀
-- DENSE_RANK() : 값이 같으면 같은 순위를 부여하지만, 다음 순위를 건너뛰지 않는다.
-- ROW_NUMBER() : 고유 순위 = 순위를 정확하게 하는데 적합하지 않음

SELECT 	ENAME,
		SAL,
        RANK() OVER(ORDER BY SAL DESC),
        DENSE_RANK() OVER(ORDER BY SAL DESC),
        ROW_NUMBER() OVER(ORDER BY SAL DESC)
  FROM	EMP;
  
-- 10번 부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름 급여를 출력하세요.
  
SELECT	EMPNO,
		ENAME,
		SAL
  FROM	EMP	
 WHERE 	DEPTNO = '10';
 
-- 업무가 MANAGER인 사원의 사원번호, 이름, 근무지를 출력하세요.
-- 딘, 근무지를 기준으로 오름차순 정렬하세요.

SELECT 	A.EMPNO,
		A.ENAME,
        B.LOC
  FROM 	EMP		A
 INNER	
  JOIN	DEPT	B
	ON	A.DEPTNO = B.DEPTNO
 WHERE	A.JOB = 'MANAGER'
 ORDER	BY		B.LOC		ASC;

  
  
  
  