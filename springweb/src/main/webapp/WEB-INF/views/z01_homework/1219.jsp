<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. 스프링의 요청값 VO 처리시, 404가 나는 경우를 수업의 예제를 들어 설명하세요
객체 선언시 따로 설정하지 않은 변수들은 default값으로 객체의 경우 null, 숫자형은 0으로 값을 가집니다. 
int age = 이십오 또는 age = 공백 
위와같은 형식으로 올바른 타입이 아닌 방식으로 설정하거나 완전 공백값으로 설정해주는 경우 404 에러가 발생합니다. 

[1단계:확인] 2. 스프링의 로그인화면을 구성하여 Member로 요청값을 받아서 처리하되, login.do로 초기화면과 결과가 처리되는 코드를 처리해보세요.
		himan/7777일때만 로그인 성공
		
[기본셋팅]
public String homelogin(Member m) {
		return "WEB-INF\\views\\z01_homework\\1219.jsp";
	}
[vo]
public boolean success(String id, String pwd) {
		boolean isLog = false;
		if(id.equals("himan")&&pwd.equals("7777")) {
			isLog=true;			
		}
		return isLog;
	}


[요청값 처리]		
if(${member.success(param.id,param.pwd)}){
		alert("로그인 성공")
	}else{
		alert("로그인 실패")
	}	
	});		


[1단계:개념] 3. 스프링에서 DI, IOC, DL개념을 찾아서 정리를 해보고, 오늘 코드한 소스에 연결하여 설명하세요.
1. DI(Dependency Injection) : 의존성 주입, 객체 간 의존성을 외부에서 주입하는 방식
<bean id="p01" class="a01_diexp.z01_vo.Person">
      	<property name="name" value="홍길동"/>
      	<property name="age" value="25"/>
      	<property name="loc" value="서울"/>
</bean>
의 방식으로 @@@.xml에 의존성을 주입합니다. 

2. IOC(Inversion of Control) : 제어의 역전, 컴포넌트 생명주기 관리 방법
String path = "a01_diexp\\di11.xml";
AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
의 방식으로 스프링 컨테이너를 생성하고, 컨테이너가 빈 객체들을 관리하며 주입을 담당합니다.

3. DL(Dependency Lookup) : 의존성 조회는 스프링 컨테이너를 통해 빈을 검색하는 것을 의미합니다. 스프링에서는 주로 ApplicationContext를 이용하여 빈을 조회합니다.
Person p01 = ctx.getBean("p01",Person.class);
		System.out.println("컨테이너의 객체 호출 : "+p01);
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
방식으로 객체를 찾습니다. 		
		
[1단계:확인] 4. 아래 DIHome10.java/dih10.xml을 만들어 처리하세요
		1) Car 클래스를 만들고, 이 클래스에 color, brand, year 세 개의 속성을 추가하세요. 그 후, 이 클래스의 객체를 생성하고 각 속성을 출력해보세요.
		2) Account 클래스를 만들고, balance(잔액), deposit(입금), withdraw(출금) 속성을 만들어 할당 처리해보세요.
[할당 : di10.xml]
<bean id="car01" class="springweb.z01_homework.vo.Car">
      	<property name="color" value="흰색"/>
      	<property name="brand" value="현대"/>
      	<property name="year" value="2020년식"/>
</bean>
<bean id="account01" class="springweb.z01_homework.vo.Account">
      	<property name="balance" value="20000"/>
      	<property name="deposit" value="5000"/>
      	<property name="withdraw" value="10000"/>
</bean>

[출력]
public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "springweb\\z01_homework\\di10.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Car car01= ctx.getBean("car01",Car.class);
		System.out.println(car01.getColor());
		System.out.println(car01.getBrand());
		System.out.println(car01.getYear());
	
		
		Account account01= ctx.getBean("account01",Account.class);
		System.out.println(account01.getBalance());
		System.out.println(account01.getDeposit());
		System.out.println(account01.getWithdraw());
		
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}


[1단계:개념] 5. 데이터베이스의 엔티티, 속성, 엔티티타입, 개체인스턴스를 구분하여 설명하세요.
- 엔티티 : 데이터베이스에서 관리하는 실제 객체, 테이블명아닌가요..?(emp)
- 속성 : emp 속 empno, ename 처럼 엔티티가 가지는 특성이나 데이터를 말합니다.
- 엔티티타입 : emp와 dept처럼 동일한 속성을 가지고 있는 범주를 나타냅니다.
- 객체 인스턴스 : empno의 값이 7369 인것처럼 속성의 실제 데이터를 말하는것 같습니다. 

[1단계:확인] 6. 도서대출관리시스템에서 사용자, 대출, 도서의 erd를 속성을 도출하고 erd를 그려서 제출시 캡쳐하세요

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
		
	var id = "${member.id}"
	var pwd = "${member.pwd}"
		
	if(id!="" && pwd!=""){ // 초기화면이 아닐때
			if(id=="himan"&&pwd="7777"){
				alert("로그인성공")
			}else{
				alert("로그인실패")
			}
		}
	});
	
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>로그인</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="아이디 입력" name="id" class="form-control mr-sm-2" /> 
				<input placeholder="비밀번호 입력" name="pwd" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">로그인</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">타이틀</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" placeholder="사원명 입력"
									name="ename">
							</div>
							<div class="col">
								<input type="text" class="form-control" placeholder="직책명 입력"
									name="job">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>