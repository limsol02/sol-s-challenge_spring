
create TABLE filerep(
			no number, 
			fname varchar2(100),
			path varchar2(500),
			regdte date,
			uptdte date,
			etc varchar2(1000)
		);
		
INSERT INTO filerep VALUES (1,'aaa.txt','',sysdate,sysdate,'');
SELECT * FROM filerep ;

CREATE TABLE report(
	NO NUMBER,
	report_name varchar2(50),
	report_regdte DATE
);

SELECT * FROM report;
/*
private int no;
private String report_name;
private date report_regdte;
 * */

SELECT * FROM report;

DROP TABLE report;

SELECT * FROM MEMBER01;

CREATE TABLE MEMBER AS SELECT id,pwd,name,auth,point FROM member01;

SELECT * FROM MEMBER;
SELECT * FROM MEMBER WHERE id='himan' AND pwd='7777';
--SELECT * FROM MEMBER WHERE id='#{id}' AND pwd='#{pwd}' 