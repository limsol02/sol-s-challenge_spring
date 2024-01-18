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
	td{text-align:center;}
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
  <h2>캘린더입력테스트용폼</h2>

</div>
<%-- 
			cal_seq.nextval,#{title},
			to_date(#{start},'YYYY-MM-DD"T"HH24:MI:SS"+09:00"'), 
			to_date(#{end},'YYYY-MM-DD"T"HH24:MI:SS"+09:00"'), 
			#{writer},#{content}, #{backgroundColor},
			#{textColor},#{allDay},#{url})			
--%>
<div class="container">
	<form id="frm01" class="form"  method="post" >
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
			제목</span>
		</div>
		<input type="text" name="title" class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				시작일</span>
		</div>
		<input name="start" placeholder="YYYY-MM-DDTHH24:MI:SS+09:00" type="date"
			value="2024-01-10T00:00:00+09:00" class="form-control" />	
	</div>
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				종료일</span>
		</div>
		<input name="end" placeholder="YYYY-MM-DDTHH24:MI:SS+09:00" type="date"
			value="2024-01-11T00:00:00+09:00" class="form-control"/>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				작성자</span>
		</div>
		<input name="writer" class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				내용</span>
		</div>
		<input name="content" class="form-control" value="" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				배경색상</span>
		</div>
		<input type="color" name="backgroundColor" class="form-control" value="#ffff00" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				글자색상</span>
		</div>
		<input type="color" name="textColor" class="form-control" value="#333300" />	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				종일여부</span>
		</div>
		
		<select name="allDay" class="form-control" >
			<option value="true">종일</option>
			<option value="false">시간</option>
		</select>	
	</div>	
	<div class="input-group mb-3">	
		<div class="input-group-prepend ">
			<span class="input-group-text  justify-content-center">
				참고 link</span>
		</div>
		<input type="text" name="url" class="form-control" value="" />	
	</div>							
	<div style="text-align:right;">
		<input type="button" class="btn btn-info" value="등록" id="regBtn"/>
		<input type="button" class="btn btn-success" value="조회리스트" id="mainBtn"/>
	</div>	
		<script type="text/javascript">
			$("#regBtn").click(function(){
				if(confirm("등록하시겠습니까?")){
					$("form").submit()
				}
				
			})
			var msg = "${msg}"
			if(msg!=""){
			 	alert(msg)
			}

		</script>
	</form>	
	
	
	</form>
    
</div>

</body>
</html>