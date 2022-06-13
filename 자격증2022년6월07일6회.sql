-- 6월 07일 
USE scott;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

-- FORD의 업무와 월급이 같은 사원의 모든 정보 추출

SELECT	JOB
  FROM	EMP
 WHERE	ENAME	= "FORD";

SELECT	SAL
  FROM	EMP
 WHERE 	ENAME = "FORD";
 
SELECT 	*
  FROM 	EMP
 WHERE	JOB	= (
				SELECT	JOB
				  FROM	EMP
				 WHERE	ENAME = "FORD"
				)
   AND 	SAL	= (
				SELECT	SAL
                  FROM	EMP
                 WHERE 	ENAME = "FORD"
				);     
                
-- 편균급여 이상을 받는 모든 사원에 대해 사원의 번호와 이름을 급여가 많은 순서로 추출

SELECT	AVG(SAL)
  FROM	EMP;

SELECT 	EMPNO,
		ENAME
  FROM 	EMP
 WHERE	SAL >= (
				SELECT 	AVG(SAL)
                  FROM	EMP
				)
 ORDER 	BY	SAL DESC;               
  
-- BLAKE의 부하직원의 이름, 업무, 상사번호 추출  
  
SELECT	EMPNO
  FROM	EMP 
 WHERE	ENAME = "BLAKE"; 
  
SELECT 	ENAME,
		JOB,
        MGR
  FROM 	EMP
 WHERE	MGR = (
				SELECT 	EMPNO
				  FROM	EMP
                 WHERE	ENAME = "BLAKE"  
				); 
            
-- 이름에 T가 있는 사원의 근무하는 부서에서 근무하는 모든 사원에 대해 사원번호, 이름, 급여를 출력, 사원번호 순서로 추출

SELECT	DISTINCT
		DEPTNO
  FROM	EMP
 WHERE	ENAME LIKE "%T%"; 

SELECT	EMPNO,
		ENAME,
        SAL
  FROM 	EMP
 WHERE	DEPTNO IN (
		SELECT	DISTINCT
				DEPTNO
		  FROM	EMP
		 WHERE	ENAME LIKE "%T%" 
				)
ORDER BY EMPNO ASC; 

-- 업무별 최대 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호 추출

-- 이름이 ALLEN 사원과 같은 업무를 하는 사람의 사원번호, 이름, 업무, 급여 추출            
SELECT	EMPNO,
		ENAME,
        SAL
  FROM	EMP
 WHERE	JOB = (		
		SELECT	JOB
		  FROM	EMP
		 WHERE	ENAME = 'ALLEN' 
			); 








                
  
  