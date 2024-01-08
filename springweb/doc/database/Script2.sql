
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
no number, 
fname varchar2(100),
path varchar2(500),
regdte date,
uptdte date,
etc varchar2(1000));

SELECT * FROM report;