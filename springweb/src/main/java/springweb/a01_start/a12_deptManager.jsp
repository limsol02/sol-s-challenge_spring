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
# 상세화면 로딩과 수정 삭제 처리
1. 부서정보 상세 로딩
	1) 리스크에서 행단위 클릭시, 부서번호를 전달하면서,
		수정가능한 상세 화면 모달창 로딩 처리한다.
		- 클릭시, 모달창이 수정/삭제버튼이 있고, 타이틀로 부서정보상세가 있는 화면로딩
			function detail(deptno){
				$("#regFrmBtn").click()
				$("#modalTitle").text("부서정보상세")
				$("#regBtn").hide();
				$("#uptBtn").show();
				$("#delBtn").show();
				//$.ajax({})
			}
			<tr ondblclick="detail("+dept.deptno+") "
		
		
		- AJAX로 단위 부서정보 처리
		- 가져온 데이터를 상세 화면에 로딩 처리.
		
	2) 삭제처리
		삭제 버튼을 클릭 시 ajax로 요청값을 해당 삭제 jsp에 deptno를 전달하고 해당 삭제.
		jsp에서 dao를 호출하여 삭제메서드를 통해서 삭제가 되게 처리한다.
		그리고, success:function(){} 삭제 갯수를 받아서 삭제가 되었을 때, 창을 닫고 초회를 처리한다.
		
		[처리순서]
			- 삭제 JSP(z16_deptDel.jsp) 
			useBean 으로 dao선언
			dao 삭제 메서드 호출과 매개변수로 deptno를 입력처리
			
			<jsp:useBean id="gson" class="com.google.gson.Gson"/>
			<jsp:useBean id="dao" class="backendweb.d01_dao.PreparedStmtDao"/>
			<jsp:setProperty name="upt" property="*"/>
			-dao 삭제 메서드 호출과 매개변수로 deptno를 입력 처리 
			{"delCnt":${dao.deleteDept(param.deptno)}}
			
		data:"deptno="+$("frm02 [name=deptno]").val(),
		dataType:"json",
		success:function(dept){
			alert(dept.delCnt)
			if(dept.delCnt>0){
				alert("삭제성공");
				$("#clsBtn").click()
			}else{
				alert("삭제실패");
			}
		},
		error:function(err){
			console.log(err)
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
		// enter키 입력시, submit()방지 코드
		$("form").on("keypress",function(e){
			if(e.keyCode==13){   //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})	
		search()
		$("#schBtn").click(function(){
			search()
		})
		$("[name=dname],[name=loc]").keyup(function(){
			if(event.keyCode==13){
				search()
			}
		})
		$("#regFrmBtn").click(function(){
			$("#modalTitle").text("부서정보등록")
			$("#regBtn").show();
			$("#uptBtn").hide();
			$("#delBtn").hide();
		})
		$("#frm02 [name=deptno]").keyup(function(){
			console.log("#부서정보 확인#")
			if(event.keyCode==13){
				console.log("#부서정보 확인(enter)#")
				$.ajax({
					url:"z17_checkDupDetpno.jsp",
					data:"deptno="+$(this).val(),
					dataType:"json",
					success:function(rs){
						console.log("진행결과")
						//alert(rs.checkDeptno)
						if(rs.checkDeptno){
							alert("등록된 부서번호가 있습니다.\n다른 번호로 확인하세요")
							$("#frm02 [name=deptno]").val("").focus()
						}else{
							alert("부서번호 등록 가능합니다!")
							$("[name=ckNo]").val("Y")
							// 부서번호 중복을 체크해서 중복이 안 될때에만 등록이 가능하게 hidden으로 설정 처리..
							// 중복확인이 완료되었을 때, 더 이상 변경하지 못하게 처리..
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		})
		$("#regBtn").click(function(){
			//alert( $("#frm02").serialize() )
			if($("[name=ckNo]").val()!="Y"){
				alert("부서번호 중복 체크 하셔야 등록가능합니다.")
				return;
			}
			if(confirm("등록하시겠습니까?")){
				$.ajax({
					url:"z13_deptInsert.jsp",
					data:$("#frm02").serialize(),
					dataType:"json",
					success:function(rs){
						var rcnt = rs.insDept
						if(rcnt>0){
							alert("등록 성공")
							search() // 등록된 내용 재검색ㄴ
							$("#frm02")[0].reset()
							if(!confirm("계속 등록하시겠습니까?")){
								$("#clsBtn").click() // 창닫기 실행	
							}
						}else{
							alert("등록 실패")
						}
						
					},
					error:function(err){
						console.log(err)
					}
				})				
			}
			
		})  
	
		$("#uptBtn").click(function(){
				alert($("#frm02").serialize())
			if(confirm("수정하시겠습니까?")){
				
				$.ajax({
					url:"z15_deptUpt.jsp",
					data:$("#frm02").serialize(),
					dataType:"json",
					success:function(dept){
					// 
						alert(dept.uptCnt)
						if(dept.uptCnt>0){
							search()
							if(confirm("수정완료!\n창을 닫으시겠습니까?")){
								$("#frm02")[0].reset()
								$("#clsBtn").click()
							}
						}else{
							alert("수정이 되지 않았습니다")
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}
		})
		
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				var delNo = $("#frm02 [name=deptno]").val()
				$.ajax({
					url:"z16_deptDel.jsp",
					data:"deptno="+delNo,
					dataType:"json",
					success:function(dept){
						// {"deptno":10,"danem":"인사","loc":"서울"}
						// ${dao.}
						alert(dept.delCnt)
						if(dept.delCnt>0){
							search()
							alert("삭제되었습니다.")
							if(confirm("삭제완료! 창을 닫으실래여?")){
								$("#frm02")[0].reset()
								$("#clsBtn").click()
							}else{
								alert("ㅇㅋ")
							}
						}
					},
					error:function(err){
						console.log(err)
					}
				})
			}else{
				alert("삭제를 취소하셨습니다.")
			}
		})
		
		
	});
	function search(){
		//alert( $("#frm01").serialize() )
		$.ajax({
			url:"z12_deptList.jsp",
			data:$("#frm01").serialize(),
			dataType:"json", // 문자열 json 데이터 ==> 객체형으로 변환
			success:function(deptList){
				console.log(deptList)
				var deptHTML =""
				$(deptList).each(function(idx, dept){
					
					deptHTML +="<tr ondblclick='detail("+dept.deptno+")' >"
					deptHTML +="<td>"+dept.deptno+"</td>"
					deptHTML +="<td>"+dept.dname+"</td>"
					deptHTML +="<td>"+dept.loc+"</td></tr>"
				})
				console.log(deptHTML)
				$("#deptList").html(deptHTML)
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	function detail(deptno){
		$("#regFrmBtn").click()
		$("#modalTitle").text("부서정보상세")
		$("#frm02 [name=deptno]").attr("readonly",true)
		$("#regBtn").hide();
		$("#uptBtn").show();
		$("#delBtn").show();
		//$.ajax({}) z14_deptDetail.jsp
		$.ajax({
			url:"z14_deptDetail.jsp",
			data:"deptno="+deptno,
			dataType:"json",
			success:function(dept){
				console.log(dept)
				//alert(dept.dname)
				$("#frm02 [name=deptno]").val(dept.deptno)
				$("#frm02 [name=dname]").val(dept.dname)
				$("#frm02 [name=loc]").val(dept.loc)
			},
			error:function(err){
				console.log(err)
			}
		})
	}	
	// ex) a13_empManager.jsp  z21_empList.jsp
	// emp사원상세 ㄱㄱ
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>부서정보관리(ajax)</h2>
	</div>
	<%-- 
# ajax로 부서정보 처리
1. 조회 list부터, 등록, 상세화면(수정/삭제) ajax로 처리..
2. 주요 파일
	1) a12_deptManager.jsp : 부서정보메인 화면
	2) z12_deptList.jsp : 부서정보조회
							html 화면으로 가져오는 처리(ajax)  
							list json데이터(ajax)
	3) z13_deptInsert.jsp : 부서정보등록처리 (ajax)
	4) z14_deptDetail.jsp : 부서정보상세데이터 가져오기 처리(ajax)
	5) z15_deptUpt.jsp : 부서정보 수정처리(ajax)
	6) z16_deptDel.jsp : 부서정보 삭제처리(ajax)
	7) dao 파일 backendweb.d01_dao.PreparedStmtDao
			   backendweb.z01_vo.Dept		   	
	//  List<Dept> getDeptList(String dname, String loc)
	//  int insertDept(Dept ins)
	//  int updateDept(Dept upt)
	//  int deleteDept(int deptno)
	//  Dept getDept(int deptno) 		
# 부서번호 중복 처리 순서
1. 사용자 인터페이스 정리
	부서번호을 입력하고 enter 입력시, 중복여부를 확인해서
	중복이 있으면 지우고 다시 입력하게 하고, 중복이 없으면 등록하는 합니다
	하고, chId도 Y로 처리된다. 이 부분은 최종 입력 후, 등록시, 다시 체크하여
	등록 가능하게 해준다. (유일키 입력 방지)
2. dao 처리 
	select * from dept where deptno=? 로 기능 메서드 추가.
	checkDeptno(int deptno)
	backendweb.d01_dao.PreparedStmtDao
3. z17_checkDupDetpno.jsp
	dao 호출, 기능 메서드 처리
	{"ckDeptno",${dao.checkDeptno(param.deptno)}}
4. 부서번호 입력 후, enter입력시, 해당 기능 ajax 처리..
	유효하면 $("#chiId").val("Y")로 처리 한다.
		




		
    --%>
	<div class="container"> 
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="부서명" name="dname" class="form-control mr-sm-2" /> <input
					placeholder="부서위치" name="loc" class="form-control mr-sm-2" />
				<button class="btn btn-info" id="schBtn" type="button">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" id="regFrmBtn" type="button">등록</button>
			</nav>
		</form>
		<table id="deptTab" class="table table-hover table-striped">
			<col width="33%">
			<col width="34%">
			<col width="33%">
			<thead>
				<tr class="table-success text-center">
					<th>부서번호</th>
					<th>부서명</th>
					<th>부서위치</th>
				</tr>
			</thead>
			<tbody id="deptList">
			</tbody>
		</table>

	</div>
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="modalTitle">부서정보등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="frm02" class="form" method="post">
						<div class="row">
							<div class="col">
								<input type="text" class="form-control" 
									placeholder="부서번호 enter입력시 중복확인"
									name="deptno">
								<input type="hidden" name="ckNo" value="N"/>	
							</div>
						</div>
						<div class="row">	
							<div class="col">
								<input type="text" class="form-control" 
									placeholder="부서명"
									name="dname">
							</div>
						</div>
						<div class="row">		
							<div class="col">
								<input type="text" class="form-control" 
									placeholder="부서위치"
									name="loc">
							</div>							
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<%--
					등록버튼 클릭시, $("#regBtn").show();$("#uptBtn").hide();$("#delBtn").hide();
					상세화면 로딩시, $("#regBtn").hide();$("#uptBtn").show();$("#delBtn").show();
					 --%>

					<button type="button" id="uptBtn" class="btn btn-info">수정</button>
					<button type="button" id="delBtn" class="btn btn-danger">삭제</button>
					<button type="button" id="regBtn" class="btn btn-primary">등록</button>
					<button type="button" id="clsBtn" class="btn btn-secondary"
						data-dismiss="modal">Close</button>					
				</div>
			</div>
		</div>
	</div>
</body>
</html>