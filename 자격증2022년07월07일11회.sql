USE scott;

SELECT * FROM EMP;
SELECT * FROM DEPT;

SELECT	DEPTNO
  FROM	EMP
 WHERE	ENAME = "BLAKE"; 
  

SELECT	ENAME,
		HIREDATE
  FROM	EMP
 WHERE 	DEPTNO = (
		SELECT	DEPTNO
		  FROM	EMP
	     WHERE	ENAME = "BLAKE"
 );

SELECT 	DEPTNO
  FROM	EMP
 WHERE	ENAME LIKE "%T%"; 
 
SELECT	EMPNO,
		ENAME,
        SAL
  FROM	EMP
 WHERE	DEPTNO IN (
		SELECT 	DEPTNO
  FROM	EMP
 WHERE	ENAME LIKE "%T%"
 );
   
SELECT	EMPNO
  FROM 	EMP
 WHERE	ENAME = "KING";
   
SELECT	ENAME,
		SAL
  FROM 	EMP
 WHERE	MGR = (
	SELECT	EMPNO
	  FROM 	EMP
      WHERE	ENAME = "KING"
 );
 
select
	empno, ename, job, deptno from emp e
where not exists(select 1 from emp t 
	         where t.mgr=e.empno);

SELECT	AVG(SAL)
  FROM	EMP
 GROUP  BY  JOB; 
 
SELECT	DEPTNO,
		ENAME,
		SAL,
        (
			SELECT	AVG(SAL)
  FROM	EMP
 GROUP  BY  JOB
 HAVING JOB = A.JOB
        ) AS avgSAL
  FROM	EMP		A
 WHERE	SAL  <  (
	SELECT	AVG(SAL)
       FROM	EMP
      GROUP  BY  JOB
       HAVING JOB = A.JOB 
 );
 
 
 
 
-- 옵티마이저 (Optimizer)

-- SQL이 실행될 때! 어떻게 실행할 건지를 계획하는 것.

-- <특징>
-- 

































-- 이름이 ALLEN인 사원과 같은 업무를 하는 사람의 사원번호, 이름, 업무, 급여 추출

SELECT	JOB
  FROM	EMP
 WHERE  ENAME = "ALLEN";

SELECT	EMPNO,
		ENAME,
		JOB,
        SAL
  FROM	EMP 
 WHERE 	JOB = (
		SELECT	JOB
		  FROM	EMP
		 WHERE  ENAME = "ALLEN"
	);

-- 부서별 최소급여가 20번 부서의 최소급여보다 작은 부서의 부서번호, 최소 급여 추출

SELECT	MIN(SAL)
  FROM	EMP
 WHERE	DEPTNO = 20;  

SELECT	DEPTNO,
		MIN(SAL)
  FROM	EMP
 GROUP	BY	DEPTNO
HAVING	MIN(SAL) > (
		SELECT	MIN(SAL)
          FROM	EMP
         WHERE 	DEPTNO = 20
	);

-- 업무별 최대 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호 추출

SELECT	JOB,
		MAX(SAL)
  FROM	EMP
 GROUP	BY	JOB; 

SELECT	EMPNO,
		ENAME,
        JOB,
        HIREDATE,
        SAL,
        DEPTNO
  FROM	EMP
 WHERE	(JOB, SAL) IN (
		SELECT	JOB,
				MAX(SAL)
          FROM	EMP
         GROUP 	BY	JOB 
	);




  
 
 
  
  
  
  