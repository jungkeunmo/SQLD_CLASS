SELECT * FROM dept;
SELECT * FROM emp;

DESC emp;
DESC dept;      

-- emp 테이블에서 사원번호, 사원이름, 입사일을 출력하는데 입사일이 빠른 사람순으로 정렬하시오.
SELECT	EMPNO,
		ENAME,
        HIREDATE
  FROM	emp
 ORDER  BY 	HIREDATE  ASC;  
  
-- 업무가 동일한 사원 수를 표시하는 질의를 작성하시오.  
SELECT JOB,
	   CONCAT(COUNT(EMPNO), "명")
  FROM emp
 GROUP BY 	JOB; 

-- emp테이블에서 사원수가 5명이 넘는 부서의 부서번호와 사원수를 구하시오.
SELECT DEPTNO,
	   COUNT(EMPNO)	
  FROM emp 
 GROUP BY DEPTNO
HAVING	COUNT(EMPNO) >= 5;  

-- emp 테이블에서 30번부서의 사원수를 구하시오.
SELECT DEPTNO,
	   COUNT(EMPNO)
  FROM emp 
 WHERE DEPTNO = "30"
 GROUP BY DEPTNO; 

-- 월급과 커미션을 합친 금액이 2,000이상인 급여를 받는 사원의 이름,업무,월급,커미션,코용날짜를 출력하시오.
SELECT ENAME,
	   JOB,
       SAL,
       COMM,
       HIREDATE
  FROM emp
 WHERE SAL + IFNULL(COMM, 0) >=2000; 

-- emp 테이블에서 이름, 업무, 근무연차를 출력하시오.
SELECT ENAME,
	   JOB,
       DATE_FORMAT(NOW(), "%Y") - DATE_FORMAT(HIREDATE, "%Y")
  FROM emp;

-- DATE_FORMAT(colum, format)
-- %Y  :  년도 _ 4자리 
-- %m  :  워 _ 2자리
-- %d  :  일 _ 2자리

-- 오늘날짜를 "YYYY년 mm월 DD일" 이렇게 표현해보세요
SELECT NOW()
  FROM DUAL;
  
SELECT DATE_FORMAT(NOW(), "%Y년 %m월 %d일")
  FROM DUAL;
  
-- 날짜 더하기, 날짜 뺴기 
-- DATE TYPE + INTEGER TYPE = 이상한 값을 가져와요

-- 넷플릭스 - 한 달 한달 정기결제! 결제한 날 로부터 1개월 후를 알아야 돼alter
-- DATE_ADD(column INTERVAL [n] DAY)  날짜 더하기
-- DATE_ADD(column INTERVAL [n] MONTH)  개월 더하기
-- DATE_ADD(column INTERVAL [n] WEEK) 주 더하기

SELECT	DATE_ADD(NOW(), INTERVAL 10 DAY)
  FROM 	DUAL;

SELECT	DATE_ADD(NOW(), INTERVAL 10 WEEK)
  FROM 	DUAL;

SELECT	DATE_ADD(NOW(), INTERVAL 10 MONTH)
  FROM 	DUAL;

-- 오늘 날짜로 부터 3개월 후의 날짜를 "YYYY/MM/DD" 형식으로 출력하세요.
  
SELECT  DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 3 MONTH), "%Y/%m/%d")
  FROM 	DUAL;
  
-- 오늘 날짜로 부터 6주 후의 날짜를 "Y년M월D일" 형식으로 출력하세요.
SELECT DATE_FORMAT(DATE_ADD(NOW(), INTERVAL 6 WEEK), "%Y년%m월%d일")
  FROM DUAL;  
  
  












