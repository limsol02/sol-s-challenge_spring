-- 하나의 속성에 여러개의 데이터가 입력될 경우 처리 방법
CREATE TABLE customer(
	cu_id varchar2(50) PRIMARY KEY,
	name varchar2(20),
	address varchar2(100),
	phone varchar2(200)
);


CREATE TABLE customer2(
	cu_id varchar2(50) PRIMARY KEY,
	name varchar2(20),
	address varchar2(100)
);

INSERT INTO customer values('himan','홍길동','서울시..','010-8888-8888;010-5555-5555;010-6666-6666;')

INSERT INTO customer2 values('himan','홍길동','서울시..')


SELECT * FROM customer;

CREATE TABLE phoneInfo01(
	cu_id varchar2(50),
	phone varchar2(100),
	etc varchar2(100)
);

INSERT INTO phoneInfo01 values('himan','010-5555-5555','개인용');
INSERT INTO phoneInfo01 values('himan','010-8888-8888','회사용');
INSERT INTO phoneInfo01 values('himan','010-4444-7777','취미용');

-- 속성에 다중데이터가 들어갈 때, entity를 분리 시키는 경우가 있는데, 
-- 1. 해당 다중 데이터가 수정할 가능이 높고, 
-- 2. 다중데이터 뿐만 아니라 연계된 속성도 포함되어 있을 때..
SELECT * FROM CUSTOMER2 a, PHONEINFO01 p 
WHERE a.cu_id = p.CU_ID ;
