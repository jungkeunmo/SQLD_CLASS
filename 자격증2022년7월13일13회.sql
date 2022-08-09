USE scott;

show tables;

SELECT * FROM EMP;
SELECT * FROM DEPT;	
SELECT * FROM SALGRADE;	

-- 1. 부서 테이블과 사원 테이블에서 사번, 사원명, 부서코드, 부서명을 검색하시오 (사원명 오름차순 정렬할 것) 

SELECT	E.EMPNO,	
		E.ENAME,
        E.DEPTNO,
        D.DNAME
  FROM	EMP		E
 INNER
  JOIN	DEPT	D
    ON	E.DEPTNO = D.DEPTNO
 ORDER  BY	ENAME	ASC;

-- 2. 사원 조회할때 사번, 사원명, 급여등급을 출력하시오

SELECT	E.EMPNO,
		E.ENAME,
        S.GRADE
  FROM	EMP			E
 INNER
  JOIN	SALGRADE	S;

-- 3. 업무가 MANAGER인 사원의 정보를 이름,업무,부서명,근무지 순으로 출력하시오.

SELECT	E.ENAME,
		E.JOB,
        E.DEPTNO,
        D.LOC
  FROM	EMP		E
 INNER
  JOIN	DEPT	D
    ON	E.DEPTNO = D.DEPTNO
 WHERE  E.JOB = "MANAGER";

-- 4. 근무지가 NEW YORK인 모든 사원의 이름,업무,부서번호 및 부서이름을 표시하시오.

SELECT	E.ENAME,
		E.JOB,
        E.DEPTNO,
        D.DNAME
  FROM	EMP		E
 INNER
  JOIN	DEPT	D
    ON	E.DEPTNO = D.DEPTNO
 WHERE  D.LOC = "NEW YORK";

-- 5. 사원과 해당하는 사원의 상사의 각각 사원이름, 사원 입사일 , 상사이름, 상사 입사일을 출력하시오
-- 단, 레이블을 각각 employee, emp hired, manager, mgr hired로 지정

SELECT	E.ENAME employee,
		E.HIREDATE emphired,
        M.ENAME manager,
        M.HIREDATE mgrhired
  FROM	EMP	E, EMP M
 WHERE 	E.MGR = M.EMPNO;

-- 6. 10번부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하시오.

SELECT	E.DEPTNO,
		E.ENAME,
        E.HIREDATE,
        S.GRADE
  FROM	EMP			E
 INNER
  JOIN	SALGRADE	S
 WHERE	E.DEPTNO = 10;
   
-- 7. 10번 부서와 20번부서에서 근무하고 있는 사원의 이름과 부서번호를 출력하는데  이름을 영문자순 오름차순으로 표시하시오.

SELECT	ENAME,
		DEPTNO
  FROM	EMP
 WHERE	DEPTNO IN (10, 20)
 ORDER	BY	ENAME	ASC;

-- 8. 커미션을 받는 모든 사원의 이름,급여 및  커미션을 커미션을 기준으로 내림차순으로 정렬하여 표시하십시오.

SELECT	ENAME,
		SAL,
		COMM
  FROM	EMP 
 WHERE	COMM IS NOT NULL
 ORDER	BY	COMM	DESC;
  
-- 9. emp 테이블에서 사원번호, 사원이름, 입사일을 출력하는데  입사일이 빠른 사람순으로 정렬하시오.

SELECT	EMPNO,
		ENAME,
        HIREDATE
  FROM	EMP
 ORDER	BY	HIREDATE	ASC;
 

-- 10. emp 테이블에서 사원이름, 급여, 연봉을 구하고  연봉이 많은 순으로 정렬하시오.  (연봉은 급여 * 12 + 상여)

SELECT 	ENAME,
		SAL,
        SAL * 12 + COMM
  FROM	EMP
 WHERE	COMM IS NOT NULL
 ORDER	BY	SAL * 12 + COMM DESC;

-- 11. emp테이블에서 급여가 2,000와 5,000 사이고 부서번호가 10 또는 30인 사원의 이름과 급여,부서번호를 나열하시오.

SELECT	ENAME,
		SAL,
        DEPTNO
  FROM	EMP
 WHERE	(SAL  BETWEEN 2000 AND 5000) AND DEPTNO IN (10, 30); 

-- 12. emp테이블에서 이름에 A와 E가 있는 모든 사원의 이름을 표시하시오.

SELECT	ENAME
  FROM	EMP
 WHERE	ENAME LIKE	'%A%' AND  ENAME LIKE 	'%E%';

-- 13. emp테이블에서 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.

SELECT 	ENAME,
		JOB
  FROM 	EMP
 WHERE 	MGR	IS NULL;

-- 14. 입사일이 81/12/09 보다 먼저 입사한 사람들의 모든 정보를 출력하라.

SELECT 	EMPNO,
		ENAME,
        JOB,
        MGR,
        HIREDATE,
        SAL,
        COMM,
        DEPTNO
  FROM 	EMP
 WHERE 	HIREDATE < "19811209";

-- 15. 직원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하여라. 

SELECT	ENAME,
		SAL,
        NVL(COMM, 0) AS COMM,
        SAL + NVL(COMM, 0) AS TOTAL
  FROM	EMP
 ORDER	BY	 TOTAL  DESC;
  



