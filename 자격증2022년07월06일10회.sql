USE scott;

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- 업무가 MANAGER인 사원의 정보를 이름, 업무, 부서명, 근무지 순으로 출력해줄래요?
SELECT	A.ENAME,
		A.JOB,
		B.DNAME,
        B.LOC
  FROM	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	JOB = 'MANAGER';
 
-- 근무지가 CHICAGO인 모든 사원의 이름, 업무, 부서번호 및 부서이름을 표시해주면 좋겠어요. 
SELECT	A.ENAME,
		A.JOB,
		A.DEPTNO,
        B.DNAME
  FROM 	EMP		A
 INNER
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE 	LOC = 'CHICAGO';
  
-- 81년 05월 01일과 81년 12월 03일 사이에 입사한 사원의 이름, 급여, 입사일을 출력해볼까요? 
-- 비교 연산자 < > <= >= == => true false boolean datatype 
-- 데이터 유형이 똑같아야 한다!

DESC emp;

-- hiredate => datetime유형 (날짜형)

-- HIREDATE랑 뭔가 비교를 하려면, 날짜유형의 타입!
-- HIREDATE를 다른 타입으로 바꿔서 (문자열로 바꿔서) 문자열로!

SELECT	DATE_SUB("1981-05-01", "%Y-%m-%d %H:%i:%s"), 
		DATE_SUB("1981-12-03", "%Y-%m-%d %H:%i:%s")
  FROM	dual;

SELECT	ENAME,
		SAL,
        HIREDATE
  FROM	EMP
 WHERE  HIREDATE > '810501' AND HIREDATE < '811203';
 
-- emp테이블에서 사원수가 5명이 넘는 부서의 부서번호와 사원수를 구하시오.

SELECT 	DEPTNO, 
		COUNT(*) 
  FROM 	EMP
 GROUP 	BY 	DEPTNO
HAVING 	COUNT(*) >= 5;

-- 각 사원의 소속된 부서별로 급여합계, 급여평균, 급여 최댓값, 급여 최솟값을 집계해 $ 표시와 함께 출력.
-- 단, 부서에 소속되지 않은 사원에 대한 정보는 제외한다.

SELECT	DEPTNO,
		SUM(SAL),
        AVG(SAL),
        MAX(SAL),
        MIN(SAL)
  FROM	EMP
 GROUP  BY DEPTNO; 
  
-- 부서별(DEPTNO)로 사원의 수와 커미션(COMM)을 받은 사원의 수를 출력하여 보시오. 

SELECT	DEPTNO
  FROM  EMP
 GROUP	BY DEPTNO;
  
  
  
  
  
  
    
 
 
 
 