<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--


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
  <h2>타이틀</h2>

</div>
<%-- 
[1단계:개념] 1. autowiring이란 무엇인가?
	오토와이어링이란 스프링이 빈의 요구사항과 매칭되는 애플리케이션 컨텍스트상에서 다른 빈을 찾아
	빈 간의 의존성을 자동으로 만족시키도록 하는 수단을 말합니다. 
	Autowiring은 스프링 프레임워크에서 빈(Bean)을 자동으로 연결하는 메커니즘입니다.
	스프링에서는 컨테이너를 사용하여 객체 간의 의존성을 관리하고 빈을 관리합니다.
	Autowiring은 이러한 의존성을 자동으로 처리하는 방법 중 하나입니다.
	Autowiring을 사용하면 스프링은 자동으로 빈 간의 의존성을 맺어줍니다. 
	이를 통해 XML 설정 파일이나 Java 설정 클래스에서 빈 간의 관계를 명시적으로 정의하지 않아도 됩니다.

[1단계:개념] 2. autowire 옵션의 속성별로 내용을 기본 예제로 설명하세요.
	1. no는 default 설정으로, 자동 주입이 되지 않는 설정입니다.
	<bean id="car" class="XXXX.car"/>
	<bean id="carDriver" class="XXXX.carDriver"/> 로 아무 설정없으면 자동주입이 따로 되지않아서
	개별적으로 객체를 할당해주어야 합니다.
	
	2. byType 옵션은 객체와 set property 기준으로 해당 객체를 자동으로 주입하는 방식을 말합니다.
	<bean id="car" class="XXXX.Car"/>
	<bean id="carDriver" class="XXX.CarDriver" autowire="byType"/> 식으로 설정하고
	자바 클래스에서 
	CarDriver carDri01 = ctx.getBean("carDri01",CarDriver.class);
	System.out.println("컨테이너의 객체 호출 : "+carDri01);
	carDri01.driving();
	로 객체 할당없이 바로 설정할 수 있습니다.
	
	3. byName 옵션은 여러 개 같은 type으로 선언이 되어 있다면 bean의 id 명과 set property 가 같을 때
	자동주입되는 옵션입니다. 
	<bean id="car1" class="XXX.Car"/>
	<bean id="car2" class="XXX.Car"/>
    <bean id="car3" class="XXX.Car"/>
    <bean id="carDriver" class="XXX.CarDriver" autowire="byName"/>
    으로 설정하면 CarDriver.java에서 SetCar2()로 void 메서드명을 id값과 동일하게
    설정하면 자동주입 가능합니다. 


[1단계:확인] 3. 컨테이너에 1:1연관관계 객체 Note와 Pen을 만들어서, autowire 옵션중 byName으로 설정하여 호출하세요.
	[xml]
 	  <bean id="pen01" class="springweb.z01_homework.vo.Pen" c:color="검정" c:type="볼펜" c:mm="0.5mm"/>
      <bean id="pen02" class="springweb.z01_homework.vo.Pen" c:color="빨강" c:type="매직" c:mm="3.0mm"/>
      <bean id="pen03" class="springweb.z01_homework.vo.Pen" c:color="파랑" c:type="네임펜" c:mm="1.0mm"/>
      <bean id="note01" class="springweb.z01_homework.vo.Note" c:page="35page" autowire="byName"/>	
	
	[java]
		public static void main(String[] args) {
			// TODO Auto-generated method stub
			// 1. 컨테이너 경로설정 
			String path = "springweb\\z01_homework\\di11.xml";
			AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
			
			// 2. DL(Dependency Lookup) 객체를 찾는 처리
			Note note01 = ctx.getBean("note01",Note.class);
			System.out.println("컨테이너의 객체 호출 : "+note01);
			note01.writeNote();
			
			
			
			// 3. 자원해체
			ctx.close();
			System.out.println("종료!");	

[1단계:확인] 4. 컨테이너에 특정 package(z04_vo)에 객체를 설정(@Component)하고, 해당 객체를 호출하여 처리하세요.
		[xml]
		<context:component-scan base-package="a01_diexp.z04_vo"/>
		
		[java]
		package a01_diexp.z04_vo;

		import org.springframework.stereotype.Component;
		
		@Component
		public class Food {
			private String fname;
			private int price;
			private int cnt;
		
		
		Food food = ctx.getBean("food",Food.class);
		food.setFname("청포도 사탕");
		System.out.println(food.getFname());


[1단계:확인] 5. 컨테이너에 특정 package(z05_vo)에 객체를 설정(@Controller,@Service)하고, 자동 autowiring해당 객체를 호출하여 처리하세요.

@Controller
public class Note {
	private String page;
	@Autowired(required = false)
	private Pen pen;
	
@Service
public class Pen {
	private String color;
	private String type;
	private String mm;
	public Pen() {
		// TODO Auto-generated constructor stub
	}




			Pen pen = ctx.getBean("pen",Pen.class);
			pen.setColor("빨간색");
			pen.setMm("3mm");
			pen.setType("유성매직");
			System.out.println(pen.getColor());
			
			Note note = ctx.getBean("note",Note.class);
			note.setPage("52page");
			note.writeNote();

  		
--%>
<div class="container">
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input placeholder="제목" name=""  class="form-control mr-sm-2" />
	    <input placeholder="내용" name=""  class="form-control mr-sm-2"/>
	    <button class="btn btn-info" type="submit">Search</button>
	    <button class="btn btn-success" 
	    	data-toggle="modal" data-target="#exampleModalCenter"
	        type="button">등록</button>
 	</nav>
	</form>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="50%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
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
    	<tr><td></td><td></td><td></td><td></td><td></td></tr>
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