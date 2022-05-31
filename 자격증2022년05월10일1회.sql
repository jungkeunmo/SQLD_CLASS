-- 데이터베이스를 생성한다.
CREATE DATABASE kakao;

-- 방금 만든 kakao라는 데이터베이스에 접근한다.
USE kakao;

-- 방금 만들었지만, 혹시 kakao라는 데이터베이스에 table이 있는지 보고싶어!
SHOW tables;

-- 테이블이 하나도 없으니, 카카오프렌즈 친구들을 저장할 수 있는 테이블을 만들거야!
-- 정수 : INT
-- 문자 : VARCHAR
-- 날짜 : DATE, DATETIME

CREATE TABLE friend (
	id		INT			  	NOT NULL		AUTO_INCREMENT		PRIMARY KEY,
    nick	VARCHAR(20)		NOT NULL,
	gender  VARCHAR(10)   	NOT NULL	
);

SHOW tables;

-- 내가 만든 friend라는 테이블의 정보를 보여주세요! CRUD -> R
SELECT	id,
		nick,
        gender
  FROM	friend;
  
-- friend라는 테이블에 data를 넣을꺼예요! CRUD -> C
-- 어떤 컬럼을 넣을지 판단을 해보자!
DESC friend;

INSERT	INTO  friend
(nick, gender)
VALUES
("라이언", "남성");  
  
INSERT	INTO  friend
(nick, gender)
VALUES
("어피치", "여성"),
("제이지", "남성"),
("콘", "남성"),
("무지", "남성"),
("춘식이", "남성"),
("튜브", "남성");  

-- 이제 나는 여러새의 데이터를 넣었어요.
-- 자 그러면, 조회하고 싶은데?
SELECT	id,
		nick,
        gender
  FROM	friend;
  
    
  
  
  
  
  
  