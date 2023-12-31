<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<style type="text/css">
.input-group-text {
	width: 100%;
	background-color: linen;
	color: black;
	font-weight: bolder;
}

.input-group-prepend {
	width: 20%;
}

#chatArea {
	width: 80%;
	height: 200px;
	overflow-y: auto;
	text-align: left;
	border: 1px solid green;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
	src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
	type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var msg = "${msg}" // controller단에서 온 결과 모델 처리..
		if(msg!=""){
			if(!confirm(msg+"\n계속 등록 ㄱ?")){
				location.href="${path}/getDeptList02.do"
			}
			$("form")[0].reset(); // 모델데이터 입력된 내용 으로 초기화처리
		}
		
		$("#regBtn").click(function(){
			
			if(("[name=dname]").val()==""){
			alert("부서명을 입력하세요")
			return;
			}
			if(("[name=loc]").val()==""){
			alert("지역을 입력하세요")
			return;
			}
			if(("[name=deptno]").val()==""){
			alert("부서번호를 입력하세요")
			return;
			}

			if(confirm("등록하실?")){
				alert("부서정보를 등록합니다.")
				$("form").submit();
			}
		})
		
		$("#mainBtn").click(function(){
			if(confirm("메인화면 ㄱ?")){
				location.href="${path}/getDeptList02.do"
			}
		})
		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>부서정보등록</h2>

	</div>
	<%-- 
		
--%>
	<div class="container">
		<form method="post" action="${path}/insertDept.do">

		<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">부서번호</span>
				</div>
				<input name="deptno" class="form-control" value="" type="number" />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">부서명</span>
				</div>
				<input name="dname" class="form-control" value="" />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">지역</span>
				</div>
				<input name="loc" class="form-control" value="" />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			


			<div style="text-align: right;">
				<input type="submit" class="btn btn-success" value="등록" id="regBtn" />
				<input type="button" class="btn btn-info" value="부서리스트" id="mainBtn"
					onclick="location.href='getDeptList02.do'" />
			</div>
		</form>
	</div>
</body>
</html>