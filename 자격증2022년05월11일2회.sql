-- SLELCT문 사용을 해봤는데,
-- 얘를 왜 사용하느냐?
-- CRUD - R 에 해당

-- 10%의 CUD와 90%의 R로 활용

-- 데이버베이스의 주 목적 : 합리적인 의사결정을 하기 위한 데이터
-- 하나의 테이블에 컬럼이 50개가 있다.
-- 우린 이 중에서 5개의 컬럼데이터만 필요.
-- 50개를 다 조회하면, 가독성이 떨어지고 속도가 저하된다.

-- row가 10000개 있다고 가정을 해보자.
-- 50개를 다 조회하면 -> 500,00개를 조회  => 4초
-- 필요한 5개만 조회하면 -> 50,000개     => 0.4초 

-- 속도, 가독성, 편리함, 합리적 의사결정 등을 잘 ~ 하기위해.

-- 카카오 데이터 베이스에 접근
USE kakao;

-- 카카오 데이터베이스에 어떤 테이블이 있는지 조회한다.
SHOW tables;

-- friend라는 테이블의 정보를 확인한다.
DESC friend;

-- 그러면, friend의 데이터를 조회한다.
SELECT	id,
		nick,
        gender
  FROM	friend;
  
-- 오늘 발렌타인데이, 우리는 카카오프렌즈 중 누가 초콜릿을 받아야 하는지 알고싶어요.
-- friend 테이블 안에, gender가 "남성"인 데이터만 조회하고싶어요.  
SELECT	id,
		nick,
        gender
  FROM  friend
 WHERE  gender = "남성"; 

-- firend테이블 안에, gender가 "여성"인 데이터의 id와 닉네임을 알고싶어요.
SELECT	id,
		nick
  FROM  friend
 WHERE  gender = "여성";
 
-- 이제 friend 테이블에 컬럼을 하나 추가하고싶어요.
ALTER TABLE friend ADD COLUMN loc VARCHAR(30);

SELECT 	id,
	 	nick,
        gender,
        loc
  FROM	friend;
  
DESC friend;

-- 새로생긴 loc에 데이터를 하나씩 넣어주자! 업데이트 해야해요!
UPDATE	friend
   SET	loc = "공주"
 WHERE	id = 7;

-- friend테이블에서 대전에 거주하는 캐릭터의 아이디, 이름, 성별, 지역을 조회하세요.
SELECT 	id,
		nick,
		gender,
		loc 
  FROM 	friend
 WHERE  loc = "대전";

-- friend테이블에서 서울에 거주하고, 여성인 캐릭터의 아이디, 이름을 조회하세요. (AND)
SELECT 	id,
		nick
  FROM 	friend
 WHERE  loc = "서울"
   AND	gender = "여성";

-- 그룹핑
-- GROUP FUNCTION
-- COUNT() : 그룹핑 되어진 데이터의 개수를 카운트 한다.
SELECT  loc,
		COUNT(id)
  FROM  friend
 GROUP 	BY	loc;
 
-- gender별 캐릭터는 각각 몇명인지 카운트 하세요.!
SELECT  gender,
		COUNT(id)
  FROM  friend
 GROUP 	BY	gender;
 
-- 생년월일을 넣어보자!
ALTER TABLE friend ADD COLUMN birth DATE;

DESC friend;

UPDATE	friend
   SET	birth = "2010/02/15"
 WHERE	id = 5; 
 
SELECT	id,
		nick,
        gender,
        loc,
        birth
  FROM	friend;
  
-- 캐릭터 별 나이를 구할거예요!
-- SUBSTR(str, pos, len)
-- str : 원본 문자열
-- pos : 시작 위치값
-- len : 길이

SELECT	SUBSTR("모두가함께만든로스트아크", 1, 3)
  FROM  DUAL;
  
-- friend테이블에서 모든 캐릭터의 아이디, 닉네임, 자역 그리고 나이를 출력하세요.!
SELECT	id,
		nick,
        gender,
        loc,
        birth,
        SUBSTR(birth, 1, 4),
        SUBSTR(NOW(), 1, 4)  
  FROM  friend;
  
SELECT	id
		nick,
        loc,
        birth,
        SUBSTR(NOW(), 1, 4) - SUBSTR(birth, 1, 4)	AS	age
  FROM  friend;
  
-- friend테이블에서 모든 캐릭터의 아이디, 닉네임, 성별, 지역 그리고 나이를 출력하세요.!
SELECT	id,
		nick,
        gender,
        loc,
        birth,
        SUBSTR(NOW(), 1, 4) - SUBSTR(birth, 1, 4)	AS age
  FROM  friend;



 
  
  
  
  
  
  
  
  
  
  
  
