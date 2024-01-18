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

.jumbotron {
	padding: 2%;
}

body {
	margin: 40px 10px;
	padding: 0;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
.input-group-text{width:100%;background-color:linen;
		color:black;font-weight:bolder;}
.input-group-prepend{width:20%;}
#chatArea{
	width:80%;height:100px;overflow-y:auto;text-align:left;
	border:1px solid green;
}
#calendar {
	max-width: 1100px;
	margin: 0 auto;
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
<script src='${path}/a00_com/dist/index.global.js'></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
	var calendar = {};
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var today = new Date();
		console.log(today)
		console.log(today.toISOString())
		console.log(today.toISOString().split("T"))
		var todayTitle = today.toISOString().split("T")[0]
		console.log(todayTitle)
		calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay'
			},
			initialDate : todayTitle,
			navLinks : true, // can click day/week names to navigate views
			selectable : true,
			selectMirror : true,
			select : function(arg) {
				// 등록시 처리되는 이벤트 핸들러(날짜 클릭, 시간을 스크롤 하면 처리)
				console.log("# 날짜를 등록시 선택했을 때 #")
				console.log("시작일(문자):" + arg.startStr)
				console.log("시작일(Date):" + arg.start)
				console.log("종료일(문자):" + arg.endStr)
				console.log("종료일(Date):" + arg.end)
				console.log("종일여부:" + arg.allDay)
				// 초기화..
				$("#frm01")[0].reset()
				$("#calTitle").text("일정등록")
				$("#start").val(arg.start.toLocaleString())
				$("[name=start]").val(arg.startStr)
				$("#end").val(arg.end.toLocaleString())
				$("[name=end]").val(arg.endStr)
				$("[name=allDay]").val(arg.allDay?1:0)
				// 강제 클릭..
				$("#calModal").click()
				/*
				var title = prompt('Event Title:');
				if (title) {
					calendar.addEvent({
						title : title,
						start : arg.start,
						end : arg.end,
						allDay : arg.allDay
					})
				}
				
				 */
				 calendar.unselect() 
			},
			eventClick : function(arg) {
				if (confirm('Are you sure you want to delete this event?')) {
					arg.event.remove()
				}
			},
			editable : true,
			dayMaxEvents : true, // allow "more" link when too many events
			events : function(info, successCallback, failureCallBack) {
				$.ajax({
					url : "${path}/calList.do",
					dataType : "json",
					success : function(data) {
						console.log(data.callist)
						//alert(data.callist.length+"건!!")
						successCallback(data.callist)
					},
					error : function(err) {
						console.log(err)
						failureCallBack(err)
					}
				})

			}
		});

		calendar.render();
	});
</script>

</head>

<body>
	<div class="jumbotron text-center">
		<h2>캘린더</h2>
	</div>
	<%-- 
		
--%>
	<div class="container">
		<div id='calendar'></div>
	</div>
	<button id="calModal" class="btn btn-success d-none"
		data-toggle="modal" data-target="#exampleModalCenter" type="button">등록</button>

	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="calTitle">일정등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm01" class="form" method="post">
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
							<input type="text" id="start" class="form-control" />
							<input type="hidden" name="start" />
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend ">
								<span class="input-group-text  justify-content-center">
									종료일</span>
							</div>
							<input type="text" id="end" class="form-control" />
							<input type="hidden" name="end" />
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
							<textarea  name="content" id="chatArea"  class="form-control" ></textarea>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend ">
								<span class="input-group-text  justify-content-center">
									배경색상</span>
							</div>
							<input type="color" name="backgroundColor" class="form-control"
								value="#0099cc" />
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend ">
								<span class="input-group-text  justify-content-center">
									글자색상</span>
							</div>
							<input type="color" name="textColor" class="form-control"
								value="#ccffff" />
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend ">
								<span class="input-group-text  justify-content-center">
									종일여부</span>
							</div>

							<select name="allDay" class="form-control">
								<option value="1">종일</option>
								<option value="0">시간</option>
							</select>
						</div>
						<div class="input-group mb-3">
							<div class="input-group-prepend ">
								<span class="input-group-text  justify-content-center">
									참고 link</span>
							</div>
							<input type="text" name="url" class="form-control" value="" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="regBtn" class="btn btn-primary">일정등록</button>				
					<button type="button" id="clsBtn"  class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
				<script type="text/javascript">
					$("#regBtn").click(function(){
						//if(confirm("일정등록하시겠습니까?")){
							//alert( $("#frm01").serialize())
							$.ajax({
								type:"post",
								url:"${path}/insertCalendar.do",
								data:$("#frm01").serialize(),
								dataType:"json",
								success:function(data){
									console.log(data)
									alert( data.msg )
									$("#clsBtn").click()
									// 기존일정 삭제
									calendar.removeAllEvents();
									console.log(data.callist)
									// 새로운 일정 추가..
									calendar.addEventSource(data.callist)				
								},
								error:function(err){
									console.log(err)
								}
							})
						//}
					})
				</script>
			</div>
		</div>
	</div>
</body>
</html>