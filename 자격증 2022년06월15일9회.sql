show tables;

SELECT * FROM DEPT;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

-- 부서 테이블과 사원테이블에서 사변, 사원명, 부서코드, 부서명을 검색하시오. ( 사원명 오름차순 정렬할 것 )

SELECT	A.EMPNO,
		A.ENAME,
		A.DEPTNO,
        B.DNAME
  FROM	EMP		A
 INNER	
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 ORDER 	BY	ENAME ASC;
 
-- 부서 테이블과 사원테이블에서 사번, 사원명, 급여, 부서명을 검색하시오. 단, 급여가 2000 이상인 사원에 대하여 급여기준으로 내림차순 정렬할 것. 
 
SELECT	A.EMPNO,
		A.ENAME,
        A.SAL,
        B.DNAME
  FROM	EMP		A
 INNER	
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	A.SAL > '2000'   
 ORDER 	BY	SAL DESC;
 
-- 부서 테이블과 사원 테이블에서 사번, 서원명, 업무, 급여, 부서명을 검색하시오. 단, 업무가 Manager이며 급여가 2500 이상인 사원에 대하여 사번을 기준으로 오름차순 정렬할 것. 
 
SELECT	A.EMPNO,
		A.ENAME,
        A.JOB,
        A.SAL,
		B.DNAME
  FROM	EMP		A
 INNER	
  JOIN	DEPT	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE  A.JOB = 'MANAGER' 
   AND	A.SAL > '2500' 
 ORDER 	BY	EMPNO ASC;
 
-- 사원 테이블에서 사원명과 해당 사원의 관리자명을 검색하시오  

SELECT	A.EMPNO,
		A.ENAME,
		A.SAL,
        B.GRADE
  FROM	EMP			A
 INNER	
  JOIN	SALGRADE	B
 ORDER	BY	SAL		DESC; 
 
-- 사원 테이블에서 사원명과 해당 사원의 관리자명을 검색하시오. 
 
SELECT	A.ENAME,
		A.MGR,
        B.ENAME
  FROM	EMP		A
 INNER	
  JOIN	EMP 	B
    ON	A.MGR = B.EMPNO;      
  
-- 사원 테이블에서 사원명, 해당 사원의 관리자명, 해당 사원의 관리자의 관리자명을 검색하시오.
  
SELECT 	ENAME,
		(
			SELECT	DNAME
              FROM	DEPT
             WHERE	DEPTNO = 20 
        )	AS DNAME
  FROM	EMP		
 WHERE  DEPTNO = 20;
 
-- 커미션을 받는 사원의 이름, 커미션, 부서이름을 출력하시오.
 
SELECT	A.ENAME,
		A.COMM,
        B.DNAME
  FROM	EMP 	A
 INNER	
  JOIN	DEPT 	B
    ON	A.DEPTNO = B.DEPTNO
 WHERE	COMM IS NOT NULL;
  
  
  
  
-- 부서 별 평균월급을 출력하세요.  
  
SELECT	DEPTNO,
		AVG(SAL)
  FROM	EMP
 GROUP	BY	DEPTNO; 
 
-- 각 부서별(모든 부서에 대해) 부서번호, 부서이름, 위치, 사원수를 출력하세요.
 
SELECT 	Z.DEPTNO,
		Z.COUNT,
        X.DNAME,
        X.LOC
  FROM	(
		SELECT	DEPTNO,
				COUNT(EMPNO)	AS COUNT
		  FROM	EMP 
		 GROUP	BY 	DEPTNO
		) Z
  INNER	
   JOIN	 DEPT	X
    ON	 Z.DEPTNO = X.DEPTNO;
  
-- 모든 사원들의 평균급여보다 높은 급여를 받는 사원의 사원번호, 사원명, 부서명, 급여, 커미션을 출력하세요.
-- 단, 커미션이 없을 경우 0으로 출력하세요.  
  
SELECT	A.EMPNO,
		A.ENAME,
        B.DNAME,
        A.SAL,
        A.COMM,
        ROUND(A.SAL)
  FROM	EMP		A
 INNER	
  JOIN	DEPT	B
 WHERE	COMM IS NOT NULL;
  
-- 이름이 "E"로 시작하는 사원의 사원번호, 사원명, 입사일, 부서명, 근무위치를 출력하세요.
-- 이름을 기준으로 내림차순 정렬 하세요.
  
SELECT	A.EMPNO,
		A.ENAME,
        A.HIREDATE,
		A.DEPTNO,
        B.LOC
  FROM	EMP		A
 INNER
  JOIN	DEPT 	B
    ON	A.DEPTNO = B.DEPTNO 
 WHERE	ENAME LIKE "E%"
 ORDER	BY	ENAME DESC;

-- 모든 사원의 급여를 기준으로 순위를 출력하세요. 1위 부터 먼저 출력되게 하세요.
-- 단, 급여가 같은 경우 동일한 순위를 가져야 하며 다음 순위는 없어지지 않습니다.

SELECT	ENAME,
		SAL,
        DENSE_RANK() OVER(ORDER BY SAL DESC)
  FROM	EMP; 




















 
 