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
      
      --%>   
   });
</script>
</head>
<%
String cityStr = request.getParameter("city");
int city = 0;
if(cityStr!=null) city = Integer.parseInt(cityStr);
%>
<body>
<div class="jumbotron text-center">
  <h2>타이틀</h2>

</div>
<%----%>
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
           <input type="text" class="form-control" placeholder="사원명 입력" name="ename">
         </div>
         <div class="col">
           <input type="text" class="form-control" placeholder="직책명 입력" name="job">
         </div>
        </div>
       </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>