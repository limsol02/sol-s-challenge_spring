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
		var calendarEl = document.getElementById('calendar');
		var today = new Date(); // 날짜형 js 객체
		console.log(today)
		console.log(today.toLocaleString())
		// GMT기준으로 시간별 경도의 날짜/시간표시
		console.log(today.toISOString())
		// 전세계 표준시간(GMT)
		console.log(today.toISOString().split("T"))
		// 시간과 날짜를 배열로 구분해서 출력..
		var todayTitle = today.toISOString().split("T")[0]
		// 날짜만 표현..(기준시간을 지정)
		console.log(todayTitle)
		var calendar = new FullCalendar.Calendar(calendarEl, {
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
				// 등록하기 위해서 모달창을 로딩/모달창에 form name값에
				// 해당 기본데이터를 설정..
				$("#frm01")[0].reset()
				$("#calTitle").text("일정등록")
				$("#start").val(arg.start.toLocaleString())
				$("[name=start]").val(arg.startStr)
				$("#end").val(arg.end.toLocaleString())
				$("[name=end]").val(arg.endStr)
				$("[name=allDay]").val(arg.allDay ? 1 : 0)
				// 강제 클릭..
				$("#calTitle").text("일정등록")
				$("#regBtn").show();  $("#uptBtn").hide(); $("#delBtn").hide();
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
				console.log("#일정 클릭시#")
				console.log(arg.event)
				var evt = arg.event
				//if (confirm('Are you sure you want to delete this event?')) {
					//arg.event.remove()
				//}
				
				// evt.속성 : 기본적으로 fullcalendar에서 사용하는 속성(selecttable에서 확인가능)
				// evt.extendedProps.속성 : 기본속성이 아닌 추가적으로 상세화면에 사용되는 속성
				$("[name=id]").val(evt.id)
				$("[name=title]").val(evt.title)
				$("[name=writer]").val(evt.extendedProps.writer)
				$("[name=content]").val(evt.extendedProps.content)
				$("#start").val(evt.start.toLocaleString())
				$("[name=start]").val(evt.startStr)
				$("#end").val(evt.end.toLocaleString())
				$("[name=end]").val(evt.endStr)
				$("[name=backgroundColor]").val(evt.backgroundColor)
				$("[name=textColor]").val(evt.textColor)
				$("[name=allDay]").val(evt.allDay?1:0)
				$("[name=urlLink]").val(evt.extendedProps.urlLink)
			
				
				$("#calTitle").text("일정상세")
				$("#regBtn").hide();  $("#uptBtn").show(); $("#delBtn").show();
				$("#calModal").click()
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
						// 서버단에서 받은 json 데이터를 
						// calendar api에 할당 처리..
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

		$("#regBtn").click(function() {
			ajaxFun("insertCalendar.do","post")
		})
		$("#uptBtn").click(function(){
			alert($("#frm01").serialize())
			if(confirm("수정하실?")){
				ajaxFun("updateCalendar.do","post")
			}
		})
		
		$("#delBtn").click(function(){
			if(confirm("삭제하실?")){
				ajaxFun("deleteCal.do","post")
			}
		})
		
		$("[name=urlLink]").dblclick(function(){
			if(confirm("페이지로 이동?")){
				window.open($(this).val(),"","")
			}
		})
		
		function ajaxFun(url,type){
			$.ajax({
				type : type,
				url : "${path}/"+url,
				data : $("#frm01").serialize(),
				// 데이터를 입력하고 요청데이터 서버에 전송
				dataType : "json",

				success : function(data) {
					// 해당 controller에서 다시 모델데이터로 넘겨준 데이터
					// d.addAttribute("msg", service.insertCalendar(ins));
					// 등록 후, 전체 데이터 json데이터로 가지고 있음..
					// d.addAttribute("callist", service.getCalList());									
					console.log(data)
					alert(data.msg) // 등록성공/등록실패
					$("#clsBtn").click() // 등록 모달창 닫기..
					// 기존일정 삭제(full api에 등록된 데이터 삭제 js) 
					calendar.removeAllEvents();
					console.log(data.callist)
					// 새로운 일정 추가..(서버에서 controller로 넘겨오 데이터)
					// 다시 추가 처리..
					calendar.addEventSource(data.callist)
				},
				error : function(err) {
					console.log(err)
				}
			})			
		}
		
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
				<!-- 
				$("#calTitle").text("일정등록")
				$("#regBtn").show();  $("#uptBtn").hide(); $("#delBtn").hide();
				$("#calModal").click()
				  -->
					<h5 class="modal-title" id="calTitle">일정등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm01" class="form" method="post">
					<input type="hidden" name="id" value="0"/>
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
							<input type="text" name="urlLink" class="form-control" value="" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
				<!--  $("#regBtn").hide();  $("#uptBtn").show(); $("#delBtn").show(); -->
				<!--  $("#regBtn").show();  $("#uptBtn").hide(); $("#delBtn").hide(); -->
					<button type="button" id="regBtn" class="btn btn-primary">일정등록</button>				
					<button type="button" id="uptBtn" class="btn btn-info">일정수정</button>				
					<button type="button" id="delBtn" class="btn btn-warning">일정삭제</button>				
					<button type="button" id="clsBtn"  class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>