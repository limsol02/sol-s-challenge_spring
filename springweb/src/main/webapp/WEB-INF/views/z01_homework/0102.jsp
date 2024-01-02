<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. mybatis 활용하기 위한 환경 설정 파일과 설정값을 지정하세요
mybatis 접속을 효율적으로 하게 하는 dbcp 객체 설정을 처리해야합니다.
db연동을 위해 트랜잭션을 처리하여야 하는데, 
<bean id="dataSource" class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close"> <!-- 자원해제하는 메서드 선언 -->
	<property name="driverClassName" value="oracle.jdbc.driver.OracleDriver"/>
	<property name="url" value="jdbc:oracle:thin:@localhost:1521:xe"/>
	<property name="username" value="scott"/>
    <property name="password" value="tiger"/>
</bean>
이런식으로 현재 사용하고 있는 오라클 서버의 주소와 유저이름, 비밀번호를 빈에 할당하여 id 값을 설정해줍니다.

그리고 mybatis framework를 컨테이너에서 사용하기 위해 먼저 설정된 id값 dataSource 를
<tx:annotation-driven proxy-target-class="true"/>
      <bean id="transactionManager" class="org.springframework.jdbc.datasource.DataSourceTransactionManager">
      <property name="dataSource" ref="dataSource"/>	
</bean>
의 ref(참조값) 으로 설정해주고

<bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
    <property name="dataSource" ref="dataSource"/>
    <property name="configLocation" value="classpath:/resource/mybatis.Spring.xml"/>
</bean>
를 통해 dataSource를 참조하여 mybatis와 sql의 서버를 연동시켜줍니다. 

마지막으로 
<bean class="org.mybatis.spring.mapper.MapperScannerConfigurer">
    <property name="basePackage" value="springweb.a02_mvc.a03_dao"/>
</bean>
을 통해 해당 패키지 안에 있는 모든 Dao interface를 실제 객체를 상속해 DB연결 처리하게 해 줍니다.

[1단계:개념] 1. dao와 XXXMapper.xml의 sql을 활용한 설정 관계를 조회 내용을 예제로 처리하세요.
우선 XXXmapper.xml에
<mapper namespace="springweb.a02_mvc.a03_dao.A01_Dao">
</mapper> 
로 인터페이스를 사용할 경로를 지정해 주고
만약 sql이 select * from emp02 where deptno=10 이라면
<mapper namespace="springweb.a02_mvc.a03_dao.A01_Dao">

	<select id="메서드명" resultType="emp(ailas설정했다는 가정)" parameterType="int">
		select * from emp02 where deptno=#{deptno}
	</select>

</mapper>
이런식으로 mapper안에 sql을 설정하여 해당 결과를 처리할 수 있습니다. 


[1단계:확인] 2. memeber01 테이블을 id, pwd로 검색해서 데이터 있는 여부 처리를 mybatis로 처리하세요
[1단계:확인] 3. select * from member01 where name like '%'||''||'%'로 mybatis을  List<Member>처리하세요
[1단계:확인] 4. member01 입력 처리하는 예제를 처리하세요.

[xml]
- <typeAlias type="springweb.z01_vo.Member" alias="member"/>

- <select id="login" resultType="int" parameterType="member">
        SELECT COUNT(*) FROM member01 WHERE id = #{id} AND pwd = #{pwd}
    </select>

    <select id="schMember" resultType="member" parameterType="String">
        SELECT * FROM member01 WHERE name LIKE '%'||#{name}||'%'
    </select>

    <insert id="insertMem" parameterType="member">  
        INSERT INTO member01 VALUES (#{mno}, #{name}, #{id}, #{pwd}, #{auth}, #{point})
    </insert>

-[interface]
public int login(Member m);
public List<Member> schMember(String name);
public int insertMem(Member insert);

-[service]
if(dao02.login(new Member("himan","7777"))==1) {			
			System.out.println("로그인 성동" );
		}else {
			System.out.println("로그인 실패");
		}
		
		System.out.println("등록한 데이터 건수 : "+dao02.insertMem(new Member(22,"임솔","dlathf","1515","대표",200)));
		for(Member m01 : dao02.schMember("홍길동")) {
			System.out.println(m01.getId()+"\t");
			System.out.println(m01.getMno()+"\t");
			System.out.println(m01.getAuth()+"\n");
		}


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
	
	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>멤버 로그인(예제)</h2>

</div>


<c:if test="${login}">
    <script type="text/javascript">
    alert("Welcome, user!")
    </script>
</c:if>

<c:if test="${not login}">
   <script type="text/javascript">
    alert("Goaway, man!")
    </script>
</c:if>


<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="아이디입력" name="id"  class="form-control mr-sm-2" />
	    <input placeholder="비밀번호입력" name="pwd"  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">로그인</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
  
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회</th>
      </tr>
    </thead>	
    <tbody>
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
    </tbody>
	</table>    
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post">
	     <div class="row">
	      <div class="col">
	        <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
	      </div>
	      <div class="col">
	        <input type="text" class="form-control" placeholder="직책명 입력" name="job">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>