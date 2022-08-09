USE SCOTT;

SHOW TABLES;

SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM SALGRADE;
SELECT * FROM BONUS;

-- emp 테이블에서 사원이름, 급여, 연봉을 구하고 연봉이 많은 순으로 정렬하시오.
SELECT 	ENAME,
		SAL,
        SAL * 12 "ANNUALSAL"
  FROM	EMP
 ORDER 	BY	ANNUALSAL DESC;
 
-- emp 테이블에서 30번부서의 사원수를 구하시오. 
SELECT	COUNT(*)
  FROM	EMP 
 WHERE	DEPTNO = 30
 GROUP	BY	DEPTNO;
 
-- emp 테이블에서 사원이름 중 A가 포함된 사원이름을 구하고 그 이름 중 앞에서 3자만 추출하여 출력하세요. 
SELECT	SUBSTR(ENAME,1,3)
  FROM	EMP 
 WHERE	ENAME LIKE "%A%"; 






-- LIKE 응용

-- 이름에 "A"가 들어가는 사람의 정보를 조회하세요.
SELECT 	* FROM EMP 
 WHERE	ENAME	LIKE	"%A%";
 
-- 세번째 글자에 A가 들어가는 사람의 정보를 조회하세요.
SELECT	ENAME
  FROM	EMP
 WHERE	ENAME LIKE "__A%";
 

-- 사원의 사원번호, 이름, 부서번호, 부서명을 출력하세요.

-- (1) 자주 사용되지 않는다면 효율적 
SELECT	E.EMPNO,
		E.ENAME,
		E.DEPTNO,
        D.DNAME
  FROM	EMP		E
 INNER	
  JOIN	DEPT	D
    ON	E.DEPTNO = D.DEPTNO;
-- WHERE A.ENAME = "blabla"    

-- 스칼라 쿼리(서브 쿼리) (2) 자주 사용된다면 효율적     
SELECT	A.EMPNO,
		A.ENAME,
        A.DEPTNO,
        (
			SELECT	DNAME
              FROM	DEPT
             WHERE	DEPTNO = A.DEPTNO
        ) AS DNAME
  FROM	EMP		A;
-- WHERE A.ENAME = "blabla"  






-- emp 테이블에서 사원이름, 월급, 월급과 커미션을 더한 값을 컬럼명 실급여라고 해서 출력.
-- 단, NULL값은 나타나지 않게 작성하시오.  
  
SELECT	ENAME,
		SAL,
        SAL + COMM "실급여"
  FROM	EMP
 WHERE	COMM IS NOT NULL
   AND	COMM != 0; 

-- 모든 사원의 급여의 최고액, 최저액, 총액 및 평균액을 표시하시오.
-- 열 레이블을 각각 MAXIMUM, MINIMUM, SUM 및 AVERAGE로 지정하고
-- 결과를 정수로 반올림하고 세자리 단위로 ,를 명시하시오.

SELECT	FORMAT(MAX(SAL), 0) MAXIMUM,
		FORMAT(MIN(SAL), 0) MINIMUM,
        FORMAT(SUM(SAL), 0) SUM,
        FORMAT(ROUND(AVG(SAL)), 0) AVERAGE
  FROM	EMP; 
    
-- emp 테이블에서 부서별 급여평균을 구할 때 소수점 3자리에서 반올림해서 2자리까지 구하고
-- 부서번호, 급여평균을 출력하시오.
  
SELECT	DEPTNO,
		ROUND(AVG(SAL) ,2)
        -- AVG(SAL)
  FROM	EMP
 GROUP	BY	DEPTNO;
  
  
  
  
  
  
  
  
  