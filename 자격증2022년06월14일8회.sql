use scott;

SELECT * FROM EMP;

-- emp 테이블에서 사원이름과 월급을 출력하는데 컬럼명은 이름, 월급으로 변경하여 출력하세요.

SELECT	ENAME, 
		SAL "월급"
  FROM	EMP;
  
-- 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름, 업무, 급여를 출력하시오.
  
SELECT 	ENAME,
		JOB,
		SAL
  FROM 	EMP
 WHERE 	SAL NOT BETWEEN 2000 AND 3000;
 
SELECT	ENAME,
		JOB,
        SAL
  FROM	EMP
 WHERE	SAL < 2000 
 UNION	ALL
SELECT	ENAME,
		JOB,
        SAL
  FROM	EMP
 WHERE	SAL > 3000; 
 
-- emp테이블에서 급여가 2,000와 5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여, 부서번호를 나열사히오.

SELECT	ENAME,
		SAL,
        DEPTNO
  FROM 	EMP
 WHERE  (SAL BETWEEN 2000 AND 5000) AND DEPTNO IN (10, 30); 
 
-- emp테이블에서 커미션 항목이 입력된 사원들의 이름과 급여, 커미션을 구하시오. 

SELECT	ENAME,
		SAL,
		COMM
  FROM	EMP 
 WHERE	COMM IS NOT NULL; 
  
-- 모델링 , 모델링의 단계!  

-- 총 3단계
-- 개념적 모델링 [업무 중심적이고 포괄적]
-- 논리적 모델링 [관꼐, 재사용성]
-- 물리적 모델링 [데이터베이스와 직접적인, 데이터베이스 이식]

-- 부서번호가 10번인 부서의 사람 중 사원번호, 이름, 월급을 출력하라.

SELECT	EMPNO,
		ENAME,
        SAL
  FROM	EMP
 WHERE	DEPTNO = '10'; 
 
-- 직업이 MANAGER가 아닌 사람의 모든 정보를 출력하라. 
 
SELECT 	*
  FROM 	EMP	
 WHERE	JOB != 'MANAGER';

-- 입사일 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라 

SELECT	*
  FROM	EMP
 WHERE 	HIREDATE < '81/12/09';

-- S로 시작하는 사원의 사원번호, 이름, 

SELECT	EMPNO,
		ENAME,
        HIREDATE,
		DEPTNO
  FROM	EMP
 WHERE	UPPER(ENAME) LIKE "S%"; 

  











 
