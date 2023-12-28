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
		}) // enter키의 기본 동작을 중단 처리
      
		<%--
		$("#regBtn").click(function(){
			${insertEmp}
		})
		--%>
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>사원정보조회</h2>

</div>
<%----%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
     <!-- Model명으로 요청값 처리 객체의 소문자형으로 자동 설정 -->
       <input class="form-control mr-sm-2" placeholder="사원명 입력" name="ename" value="${emp.ename}"/>
       <input class="form-control mr-sm-2" placeholder="직책명 입력" name="job" value="${emp.job}"/>
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      
    <thead>
    
      <tr class="table-success text-center">
        <th>사원번호</th>
        <th>사원명</th>
        <th>직책명</th>
        <th>관리자번호</th>
        <th>입사일</th>
        <th>급여</th>
        <th>보너스</th>
        <th>부서번호</th>
      </tr>
    </thead>   
    <tbody>
    <c:forEach items="${empList}" var="emp">
       <tr>
       <td>${emp.empno}</td>
       <td>${emp.ename}</td>
       <td>${emp.job}</td>
       <td>${emp.mgr}</td>
       <td><fmt:formatDate value="${emp.hiredate}"/> </td>
       <td><fmt:formatNumber value="${emp.sal}" /></td>
       <td><fmt:formatNumber value="${emp.comm}"/></td>
       <td>${emp.deptno}</td>
       </tr>
    </c:forEach>
       
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
           <input type="text" class="form-control" placeholder="사원번호 입력" name="empno">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="직책 입력" name="job">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="관리자 입력" name="mgr">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="입사일 입력" name="hiredate">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="급여 입력" name="sal">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="보너스 입력" name="comm">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="부서번호 입력" name="deptno">
         </div>
        </div>
       </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="regBtn">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>