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
<style>
td {
	text-align: center;
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
	$(document).ready(function(){
		search()
		
		$("#schBtn").click(function(){
			search()
		})
		$("[name=dname],[name=loc]").keyup(function(){
			// enter를 입력시 처리..
			//if(event.keyCode==13)
				search()
		})
	});
	function search(){
		//alert( $("#frm01").serialize() )
		// form안에 있는 name/value key=value형식으로 변경 처리..
		$.ajax({
			url:"${path}/ajax10.do",
			data:$("#frm01").serialize(),
			dataType:"json",
			success:function(data){
				console.log(data)
				var dlist = data.deptList
				var html =""
				// 배열.forEach(function(단위객체, index){})
				$(dlist).each(function(idx, dept){
					html += "<tr>"
					html += "<td>"+dept.deptno+"</td>"
					html += "<td>"+dept.dname+"</td>"
					html += "<td>"+dept.loc+"</td>"
					html += "</tr>"
				})
				$("tbody").html(html)
			},
			error:function(err){
				console.log(err)
			}
		})		
	}
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>DB데이터 로딩</h2>

	</div>
	<%----%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input class="form-control mr-sm-2" placeholder="부서이름" name="dname" />
				<input class="form-control mr-sm-2" placeholder="부서위치" name="loc" />
				<button class="btn btn-info" type="button" id="schBtn">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
		</form>
		<table class="table table-hover table-striped">

			<thead>

				<tr class="table-success text-center">
					<th>부서번호</th>
					<th>부서이름</th>
					<th>부서위치</th>
				</tr>
			</thead>
			<tbody>
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