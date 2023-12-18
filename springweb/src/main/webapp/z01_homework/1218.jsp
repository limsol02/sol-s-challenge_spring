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
[1단계:개념] 1. 아래의 단계별 요청값 처리의 속성을 기본에제를 통해 설명하세요

1) 요청값 1개 처리 : @RequestMapping 설정, @RequestParam으로 보낼 요청처리와 타입 설정, return 으로 보낼 url 입력
@RequestMapping("start.do")
public String start(@RequestParam("name") String name) {
	System.out.println("요청값이름 : "+name);
	return "WEB-INF\\views\\a01_start\\a01_startSpring.jsp";
}
		
2) 요청값이 없을 때를 대비하여 요청값 1개 처리 :
@RequestMapping 설정, @RequestParam으로 보낼 요청처리(기본 value값과 보내지 않으면 처리할 defaultValue 설정) 타입 설정, return 으로 보낼 url 입력

@RequestMapping("start2.do")
public String start2(@RequestParam(value="name", defaultValue = "♥") String name) {
	System.out.println("요청값이름 : "+name);
	return "WEB-INF\\views\\a01_start\\a01_startSpring.jsp";
}		

3) 요청값 2개이상 처리
: @RequestMapping 설정, @RequestParam으로 보낼 요청처리(기본 value값과 보내지 않으면 처리할 defaultValue 설정) 타입 설정, return 으로 보낼 url 입력

@RequestMapping("start3.do")
public String start3(@RequestParam(value="name", defaultValue = "♥") String name,
 @RequestParam(value="gender", defaultValue = "★") String gender) {
	System.out.println("요청값이름 : "+name);
	System.out.println("요청값성별 : "+gender);
	return "WEB-INF\\views\\a01_start\\a01_startSpring.jsp";
}		

3) 요청배열의 처리
[1단계:개념] 2. 요청객체의 처리시, 일반 요청값과의 차이점을 예제로 설명하세요

[일반 요청값] : 일반 요청값을 보낼때에는 보낼 요청값의 변수, 타입등을 하나하나 설정해야 한다. 
@RequestMapping("start.do")
public String start(@RequestParam("name") String name) {
	System.out.println("요청값이름 : "+name);
	return "WEB-INF\\views\\a01_start\\a01_startSpring.jsp";
}

[요청객체 처리시] : VO를 생성하였다면, vo 안에있는 필드값을 @RequestParam로 하나하나 설정하지 않더라도 요청값으로 바로 보낼 수 있다. 
@RequestMapping("Obj01.do")
	public String Obj01(Person p) {
		return "WEB-INF/views/a01_start/a01_startSpring.jsp";
	}

[1단계:확인] 3. 아래내용을 화면단에 출력하세요

1) 사용자가 도시 이름을 입력하면 해당 도시의 날씨 정보(도시3개 날씨3개 조건처리)를 반환하는 API를 만드세요.
[요청값 보내기]
@RequestMapping("start01.do")
public String start01(Model d) {
	d.addAttribute("city",new String[] {"서울","오사카","시드니"});
	d.addAttribute("weather",new String[] {"드럽게추움","좀 들추움","더움"});
	return "WEB-INF\\z01_homework\\1218\\1218_01.jsp";
}

[요청값 처리]
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
     <select name="city">
     <option value="0">서울</option>
     <option value="1">오사카</option>
     <option value="2">시드니</option>
     </select>
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
    <thead>
      <tr class="table-success text-center">
        <th>도시</th>
        <th>날씨</th>
       
      </tr>
    </thead>   
    <tbody>
            <tr>
                <td>${city[param.city]}</td>
                <td>
                    <c:choose>
                        <c:when test="${param.city == 0}">
                            ${weather[param.city]}
                        </c:when>
                        <c:when test="${param.city == 1}">
                            ${weather[param.city]}
                        </c:when>
                        <c:when test="${param.city == 2}">
                            ${weather[param.city]}
                        </c:when>
                        <c:otherwise>
                            기타 처리 (선택사항)
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </tbody>

2) 사용자가 이름, 이메일, 비밀번호를 입력하여 회원 가입을 할 수 있는 API를 만드세요.
[요청값 보내기]
@RequestMapping("home01.do")
public String home01(@RequestParam(value="name", defaultValue = "") String name,@RequestParam(value="email", defaultValue = "") String email,
							@RequestParam(value="pwd", defaultValue = "") String pwd) {
	return "WEB-INF\\z01_homework\\1218\\1218_02.jsp";
}

[요청값 처리]
<div class="container">
   <form id="frm01" class="form" method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="이름 입력" name="name" />
       <input class="form-control mr-sm-2" placeholder="이메일 입력" name="email"/>
       <input class="form-control mr-sm-2" placeholder="비밀번호 입력" name="pwd" />
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
</div>

<script>
    <c:choose>
        <c:when test="${not empty param.name and not empty param.email and not empty param.pwd}">
            alert('회원가입 성공');
        </c:when>
        <c:otherwise>
            alert('공백을 채워주세요!');
        </c:otherwise>
    </c:choose>
</script>  

3) 여러 개의 투표 항목이 주어지고, 사용자는 투표를 할 수 있는 API를 만드세요. 
각 사용자는 한 항목에 대해 한 번만 투표 또는 다중 투표를 할 수 있게 만드세요
[요청값 보내기]
@RequestMapping("home02.do")
public String home02(Model d) {
	d.addAttribute("dinner",new String[] {"백반","피자","수제비","김치전"});
	return "WEB-INF\\z01_homework\\1218\\1218_03.jsp";
}

[요청값 처리]
<div class="container" >
   <form id="frm01" class="form"  method="post">

     <label>
    <input type="checkbox" value="${dinner[0]}" name="din"> ${dinner[0]}
	</label>
	<label>
	    <input type="checkbox" value="${dinner[1]}" name="din"> ${dinner[1]}
	</label>
	<label>
	    <input type="checkbox" value="${dinner[2]}" name="din"> ${dinner[2]}
	</label>
	<label>
	    <input type="checkbox" value="${dinner[3]}" name="din"> ${dinner[3]}
	</label>
 
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
   </form>
   <table class="table table-hover table-striped">
      
    <thead>
    
      <tr class="table-success text-center">
        <th>선택된 저녁메뉴</th>
        
      </tr>
    </thead>   
    <tbody>
    <c:forEach var="selectedDinner" items="${paramValues.din}">
        <tr>
            <td>${selectedDinner}</td>
        </tr>
    </c:forEach>
</tbody>

4) 사용자가 식당의 ID, 예약 날짜 및 시간, 인원 수를 입력하여 예약을 할 수 있는 API를 만드세요.
- 예약 가능한 시간과 인원 수에 제한을 두어, 불가능한 예약 요청에 대해선 거절 메시지를 반환하세요.
 포기
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
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>타이틀</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="제목" name="" class="form-control mr-sm-2" /> <input
					placeholder="내용" name="" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">Search</button>
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