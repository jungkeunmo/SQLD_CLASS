USE scott;

show tables;

DESC EMP;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;

-- 커미션을 받고 급여가 1,600이상인 사원의 사원이름, 부서명, 근무지를 출력하시오.

SELECT	A.ENAME, 
		B.DNAME,
        B.LOC
  FROM	EMP		A, 
		DEPT	B
 WHERE	A.DEPTNO = B.DEPTNO
   AND	COMM 	IS NOT NULL
   AND 	COMM	<> 		0
   AND	SAL >= 1600;
   
-- 10번 부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름, 월급, 급여등급을 출력하시오.   

SELECT	A.DEPTNO,
		B.DNAME,
        A.SAL,
        C.GRADE
  FROM	EMP			A
 INNER
  JOIN	DEPT		B
 INNER
  JOIN	SALGRADE	C
    ON	A.SAL >=	C.LOSAL
   AND	A.SAL <		C.HISAL; 

SELECT	A.DEPTNO,
		A.DNAME,
        B.ENAME,
        B.SAL,
        C.GRADE
  FROM	DEPT	A, EMP		B, SALGRADE		C
 WHERE	B.DEPTNO = A.DEPTNO
   AND	A.DEPTNO = 10
   AND	SAL BETWEEN C.LOSAL AND C.HISAL;

-- 근무지별로 근무하는 사원의 수가 5명 이하인 경우, 인원이 적은 도시순으로 정렬하시오. (근무 인원이 0명인 곳도 표시)
-- LEFT OUTER , RIGHT OUTER

-- 우리는 지금 카페 사장
-- 아메리카노		23		30		51		31
-- 카페라떼		15		11		23		22
-- 요거트 스무디   	30		22		66		 6
-- 말차			 0		 0		 0		 1	

SELECT	B.DEPTNO,
		COUNT(A.EMPNO)
  FROM	EMP		A
 RIGHT
 OUTER 
  JOIN	DEPT	B
    ON  A.DEPTNO = B.DEPTNO
 GROUP	BY	B.DEPTNO
 ORDER	BY	LOC 	DESC;
 
-- 근무지 별로 사원수가 5명 미만인 경우의 부서번호, 사원수를 출력하시오. (단, 사원수가 0명 인곳도 출력한다.)

SELECT	D.DEPTNO,
		COUNT(E.EMPNO)
  FROM	EMP		E
 RIGHT
 OUTER 
  JOIN	DEPT	D
    ON  E.DEPTNO = D.DEPTNO
 GROUP	BY	D.DEPTNO
HAVING	COUNT(E.EMPNO) <= 5; 
 
-- 부서번호 별로 부서번호 ,합계 금액 ,평균 금액,최대 금액, 최소 금액을 평균금액이 가장 높은 순으로 출하시오 (단, 존재하지 않을 경우 0으로 보여지게한다)

SELECT  D.DEPTNO,
        SUM(IFNULL(E.SAL, 0))                    AS SUM_SAL,
        AVG(IFNULL(E.SAL, 0))                    AS AVG_SAL,
        MIN(IFNULL(E.SAL, 0))                    AS MIN_SAL,
        MAX(IFNULL(E.SAL, 0))                    AS MAX_SAL
  FROM  EMP		E
 RIGHT
 OUTER
  JOIN  DEPT	D                                    
    ON  E.DEPTNO  = D.DEPTNO
 GROUP  BY  D.DEPTNO;  
  
-- 모든 부서번호, 부서이름, 사원이름, 커미션을 출력하세요(단, 존재하지 않을경우 0으로 표시)

SELECT	E.DEPTNO,
		D.DNAME,
        IFNULL(E.ENAME, 0) AS ENAME,
        IFNULL(E.COMM, 0) AS COMM
  FROM	EMP		E  
 RIGHT
  JOIN	DEPT	D
	ON	E.DEPTNO = D.DEPTNO;

-- 사원수가 3명이 넘는 부서의 부서명과 사원수, 사원이름, 부서번호를 출력하세요  

SELECT	D.DNAME,
		COUNT(E.EMPNO),
        D.DEPTNO
  FROM	EMP		E
 INNER
  JOIN	DEPT	D
    ON	E.DEPTNO = D.DEPTNO
 GROUP	BY	E.DEPTNO;  

  
  
  
  
  
  
  
  
  
  