USE scott;

show tables;

DESC EMP;
DESC DEPT;
DESC SALGRADE;
DESC BONUS;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;

-- 사원의 이름, 급여, 커미션, 총액(급여+커미션)을 구하여 총액이 많은 순서로 출력하라. (단, 커미션이 null인 사원도 0으로 해서 포함하여라)

SELECT	ENAME,
		IFNULL(COMM, 0) AS COMM,
        IFNULL(SAL + COMM, 0) AS COMM
  FROM	EMP
 ORDER	BY	SAL+COMM DESC; 
  
-- 10번부서의 모든 사원에게 급여의 13%를 보너스로 지불하기로 하였다. 10번부서 사원들의 이름,급여,보너스 금액,부서번호를 출력하여라.

SELECT	ENAME,
		SAL,
		(SAL * 0.13),
        DEPTNO
  FROM	EMP
 WHERE	DEPTNO = 10; 

-- 이름의 글자수가 6자 이상인 사원의 이름을 소문자로 이름만 출력하시오

SELECT	LOWER(ENAME)
  FROM	EMP
 WHERE	LENGTH(ENAME) >= 6;

-- 평균급여 이상을 받는 모든 사원에 대해 사원의 번호와 이름을 급여가 많은 순서로 추출

SELECT	EMPNO,
		ENAME,
        SAL
  FROM	EMP
 WHERE	SAL > (
	SELECT	FLOOR(AVG(SAL))
      FROM	EMP
 ) 
ORDER	BY	SAL DESC; 

-- 업무별 급여 평균 중 가장 작은 급여평균의 업무와 급여평균 추출

SELECT	JOB,
        AVG(SAL)
  FROM	EMP
 GROUP  BY JOB
HAVING	AVG(SAL) = (
	SELECT	MIN(AVG(SAL))
      FROM	EMP
     GROUP	BY	JOB 
);

-- 30번 부서의 최소급여를 받는 사원보다 많은 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호, 단 30번 부서는 제외하고 추출

SELECT	EMPNO,
		ENAME,
		JOB,
		HIREDATE,
        SAL,
        DEPTNO
  FROM	EMP
 WHERE	SAL >  (SELECT MIN(SAL) FROM EMP WHERE DEPTNO = 30) AND DEPTNO NOT IN (30);
  
  