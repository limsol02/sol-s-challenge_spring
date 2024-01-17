CREATE TABLE EMP_DEPT AS SELECT e.*, dname, loc
FROM emp e, dept d WHERE e.DEPTNO = d.DEPTNO ;

SELECT * FROM emp_dept WHERE empno=1000;
--ex) 사원정보 1개 삽입
INSERT INTO emp_dept values(1000,'홍길동','사원',7782,sysdate,3000,100,10,'ACCOUNTING','NEW YORK');

/*
정규화가 되지 않는 테이블에는
1. 새 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야하는 문제가 발생한다.
2. 갱신 이상 : 중복 튜플 중 일부만 변경하여 데이터가 불일치하게 되는 모순의 문제가 발생한다.
3. 삭제 이상 : 튜플을 삭제하면 꼭 필요한 데이터까지 함께 삭제되는 데이터 손실 문제가 발생한다.
 * */
SELECT * FROM emp_dept;
-- 7839의 부서이름을 회계로 변경
UPDATE emp_dept SET dname='회계' WHERE empno=7839;

-- 특정한 사원정보를 삭제
DELETE FROM emp_dept WHERE ename IN ('FORD','SMITH','JONES');
/*
# 정규화를 위한 단계쩍 학습 내용
1. 정규화 과정을 이러한 이상 현상을 효과적으로 처리하기 위한 내용이고, 단계별 과정을 거친다. 
2. 이 과정은 각 단계별로 정규화를 효과적으로 처리하기 위한 내용이고, 이전 과정을 거쳐야 다음 과정을 처리할 수 있다.
3. 개괄적으로
	1] 제1정규화 : 데이터의 원자성
	2] 제2정규화 : 완전함수 종속성
	3] 제3정규화 : 이행적 함수 종속성
	4] BCNF정규화
	5] 제4정규화
	6] 제5정규화
로 구분되는데, 실무적으로는 1~3정규화 ㄲ자ㅣ 많이 활용되고 데이터의 용량과 복잡성에 따라 정규화 과정에 의해서 
무결성은 보장되지만 속도이슈 때문에 역정규화 과정을 거치는 경우도 많다.	

# 제2정규화
1. 이미 제1정규화를 충족하는 테이블을 대상으로 수행된다. 제 2정규화를 달성하기 위해서는
테이블이 1정규화를 만족했다면, 모든 주요속성이 완전 함수 종속 즉 기본키의 전체에 대해서만 종속되어야한다.
즉 복합기본키를 가진 테이블에서 특정 컬럼이 그 기본 키의 일부분에만 종속적이면 안된다. 
	
 * */
/*
# 정규화
1. 이상현상이 발생하지 않도록, 릴레이션을 관련 있는 속성들로만 구성하기 위해 릴레이션을 분해(decomposition)하는 과정을 말한다.
2. 함수의 종속성을 판단하여 정규화를 수행한다.

# 함수의 종속성
1. 속성들 간의 관련성

 * */
/*
사원에 속해있는 부서위치?
empno -> deptno -> loc
사원번호를 알면 emp테이블을 통해서 부서번호를 알 수 있고, 부서번호를 알면 부서위치를 알 수 있다.
이때, 사원번호와 부서위치는 이행적 함수 종속적인 관계에 있다고 할 수 있다.
이행적 함수 종속성이 있는 것을 테이블로 분리시켜야 하고, 이것을 제 3 정규화라고 한다.
 * */

SELECT * FROM dept WHERE dname LIKE '%'||''||'%' AND loc LIKE '%'||''||'%';


SELECT * FROM emp02;

INSERT INTO emp02 values(
1000, '홍길동', '사원', 7902, to_date('2024-01-02','YYYY-MM-DD'), 4000, 1000, 10);

/*
[class Emp]
private String hiredateS;

[interface]
public int insertEmp(EmpDTO insert);

<insert id="insertEmp" parameterType="empDto" resultType="int">  
	insert into emp02(#{empno},#{ename},#{job},#{mgr},to_date(#{hiredateStr},'YYYY-MM-DD'),#{sal},#{comm},#{depetno})
</insert>
 * */
/*
class Depart
private int no;
private String name;
private String location;

getDepartInfo()
 * */

SELECT * FROM member01 WHERE id=? pwd=?

SELECT * FROM regions WHERE region_name LIKE '%' || 'A' || '%';
/* SELECT * FROM regions WHERE region_name LIKE '%' || #{region_name} || '%' */

SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%'||'A'||'%';
/*
SELECT * FROM JOB_HISTORY WHERE JOB_ID LIKE '%'||#{JOB_ID}||'%'

메서드명 getJobHistory


private String employee_id;
private String start_date;
private String end_date;
private String job_id;
private int department_id;

 * */

select level, b.* 
		from board b
		where 1=1
		start with refno=0
		connect by prior no = refno
		order siblings by no DESC;
-- 캘린더 테이블
	create table calendar(
		id number primary key,
		title varchar2(100),
		start1 date,
		end1 date,
		writer varchar2(50),
		content varchar2(2000),
		backgroundcolor varchar2(7),
		textcolor varchar2(7),
		allday number(1),
		url varchar2(500)
	);
	
	create sequence cal_seq;
INSERT INTO calendar values(cal_seq.nextval,'첫일정등록',sysdate,sysdate+1,'홍길동','일정내용','#0099cc','#ccffff',1,'');
SELECT * FROM CALENDAR c ;
/*
class Calendar
	private int id;
	private String title;
	private String start;
	private String end;
	private String writer;
	private String content;
	private String backgroundcolor;
	private String textcolor;
	private boolean allday;
	private String url;
 * */
	select id, title, writer, to_char(start1,'YYYY-MM-DD"T"HH24:MI:SS"+09:00"') start1,
		to_char(start1,'YYYY-MM-DD"T"HH24:MI:SS"+09:00"') end1, content, backgroundcolor, textcolor, allday, url from calendar;
		
	UPDATE CALENDAR SET url=' ';