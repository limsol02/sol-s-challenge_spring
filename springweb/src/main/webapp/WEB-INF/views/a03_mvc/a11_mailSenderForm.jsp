<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
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
	.jumbotron{padding:2%;}
	.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
	.input-group-prepend{width:20%;}
	#chatArea{
		width:80%;height:200px;overflow-y:auto;text-align:left;
		border:1px solid green;
	}		
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
  <h2>메일 발송</h2>

</div>
<%-- 
		
--%>
<div class="container">
	<form method="post" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
			수신자</span>
		</div>
		<input type="text" name="receiver" placeholder="수신자 메일 주소 입력" 
			class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				발신자</span>
		</div>
		<!-- 차용 메일서버의 경우 변경되지 않음.. -->
		<input readonly class="form-control" 
			value="ghdwjdgh89@gmail.com" />	
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				제목</span>
		</div>
		<input name="title"  placeholder="메일 제목 입력"  class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				메일내용</span>
		</div>
		<textarea id="chatArea" name="content"
			 class="form-control"   placeholder="메일 내용 입력"  ></textarea>	
	</div>			
	<div style="text-align:right;">
		<input type="submit" class="btn btn-info" 
			value="메일발송" id="regBtn"/>
	</div>	
		<script type="text/javascript">
			var msg = "${msg}"
			if(msg!=""){
				alert(msg);
			}
		</script>
	</form>	
</div>

</body>
</html>