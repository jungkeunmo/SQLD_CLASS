USE scott;

SELECT * FROM EMP;

-- 1. 월급이 2000이상 3500미만인 사원의 모든 정보를 구하시오.

SELECT	EMPNO,
		ENAME,
        JOB,
        MGR,
        HIREDATE,
        SAL,
        COMM,
        DEPTNO
  FROM	EMP
 WHERE	SAL > 2000 AND SAL < 3500; 

-- 2. 81년생 04월 02일과 81년생 09월 28일 사이에 입사한 사원의 모든정보를 출력하시오.

SELECT	EMPNO,
		ENAME,
		JOB,
        MGR,
        HIREDATE,
        SAL,
        COMM,
        DEPTNO
  FROM 	EMP
 WHERE	HIREDATE > 810402 AND HIREDATE < 810928; 

-- 3. emp 테이블에서 사원번호가 7782, 7788, 7934인 사원을 제외한 사람들의 사원번호, 이름, 월급을 출력하세요. 

SELECT	EMPNO,
		ENAME,
        SAL
  FROM 	EMP
 WHERE	EMPNO NOT IN(7782, 7788, 7934);

-- 4. emp 테이블에서 사원이름 중 D가 포함되지 않은 사람들 중 부서번호가 10인 사원들의 이름, 부서번호, 급여 를 출력하시오.

SELECT	ENAME,
		DEPTNO,
        SAL
  FROM	EMP
 WHERE 	ENAME NOT IN('D') AND DEPTNO = 10;

-- 5. 사원에서 사원이름, 사원번호, 커미션, 유형을 조회한다. 단, 커미션을 못받은 유형은 0, 받은 회원은 1로 조회한다.

SELECT	ENAME,
		EMPNO,
        COMM
  FROM	EMP
 WHERE	COMM = 0;

-- 6. 사원에서 사원이름, 사원번호, 입사일을 조회한다. 단, K로 시작하는 사원보다 일찍 입사한 사원 순으로 조회한다.
SELECT	EMPNO,
		ENAME,
        HIREDATE
  FROM	EMP
 WHERE	ENAME NOT IN ("K%"); 

-- 7. 부서이름, 부서번호, 지역, 사람수를 조회한다. 단, 사람수가 높은 순으로 조회한다.

-- 8. 사원에서 사원이름, 사원번호, 부서이름, 부서번호를 조회한다. 단, SCOTT보다 낮은 급여를 받는 사람만 조회하고 겹치지 않는 순서를 매겨준다.

SELECT	A.ENAME,
		B.DNAME,
        A.DEPTNO
  FROM	EMP
 INNER
  JOIN	DEPT
    ON	A.DEPTNO = B.DEPTNO;
	
-- 9. 평균 급여보다 많은 급여를 받는 사원들의 사원번호, 이름, 월급을 출력하세요. (단 월급이 높은순으로 정렬)

SELECT	EMPNO,
		ENAME,
        SAL
  FROM 	EMP;

-- 10. 이름의 첫 글자가 J로 시작하거나 부서번호가 20인 사람의 사원번호, 이름, 부서번호를 출력하세요.

SELECT	EMPNO,
		ENAME,
        DEPTNO
  FROM 	EMP
 WHERE	ENAME LIKE "J%" AND DEPTNO = 20;

-- 11. ADAMS가 속해있는 부서 의 모든 사람의 사원번호, 이름, 입사일, 급여, 부서번호를 출력하세요.

SELECT	*
  FROM	EMP
 WHERE	ENAME = "ADAMS";

SELECT	EMPNO,
		ENAME,
        SAL,
        HIREDATE,
        DEPTNO
  FROM	EMP
 WHERE	DEPTNO = (
		SELECT	DEPTNO
		  FROM	EMP
		 WHERE	ENAME = "ADAMS"
 );
 
-- 12. EMP 테이블에서 10번부서 혹은 20번 부서에 속하는 사람 중 급여가 1000이 넘는 사람을 조회 하세요. (단, 이름 내차순 정렬)

SELECT	*
  FROM 	EMP
 WHERE	DEPTNO IN (10, 20) AND SAL > 1000
 ORDER  BY	ENAME	DESC;

-- 13. 급여가 1000에서 3000 사이에 포함되는 사원의 사원번호, 이름, 업무, 급여를 출력하세요.

SELECT	EMPNO, 
		ENAME,
        JOB,
        SAL
  FROM	EMP
 WHERE	SAL > 1000 AND SAL < 3000;  

-- 14. 81/01/28 부터 81/12/31 사이에 입사한 사람들의 모든 정보를 출력하세요.

SELECT	EMPNO,
		ENAME,
        JOB,
        MGR,
        HIREDATE,
        SAL,
        COMM,
        DEPTNO
  FROM	EMP
 WHERE	HIREDATE > 810128 AND HIREDATE < 811231; 

-- 15. K로 시작하는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호를 출력하세요.

SELECT	EMPNO,
		ENAME,
        JOB,
        HIREDATE,
        SAL,
        DEPTNO
  FROM	EMP
 WHERE	ENAME LIKE "K%"; 

-- 16. 사원 급여를 10으로 나눈 값을 소수점 둘째 자리에서 반올림하여 출력하세요.


