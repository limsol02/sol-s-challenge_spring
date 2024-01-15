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

<body>
<div class="jumbotron text-center">
  <h2>게시판</h2>

</div>
<%----%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<input type="hidden" name="curPage" value="${boardSch.curPage}"/>
       <input class="form-control mr-sm-2" placeholder="작성자입력" name="writer" value="${boardSch.writer}"/>
       <input class="form-control mr-sm-2" placeholder="제목입력" name="title" value="${boardSch.title}"/>
       <button class="btn btn-info" type="submit">Search</button>
       <button class="btn btn-success" type="button">등록</button>
    </nav>
    <div class="input-group mb-0 mt-3">	
			<span class="input-group-text">총 데이터 건수 : ${boardSch.count} 건</span>
		<input type="text" class="form-control" style="width:70%;">
			<span class="input-group-text">페이지 수</span>
		<select name="pageSize" class="form-control">
			<option>3</option>
			<option>5</option>
			<option>10</option>
			<option>20</option>
			<option>50</option>
		</select>
	</div>	
	<script type="text/javascript">
		$("[name=pageSize]").val("${boardSch.pageSize}")
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val(1)
			$("form").submit()
		})
	</script>
    
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
    <c:forEach var="blist" items="${boardList}">
       <tr>
       <td>${blist.cnt}</td>
       <td class="text-left">
    			<c:if test="${blist.level>1}">
    				<c:forEach begin="2" end="${blist.level}">
    					&nbsp;&nbsp;&nbsp;
    				</c:forEach>
    				☞
    			</c:if>
       <td>${blist.title}</td>
       <td>${blist.writer}</td>
       <td><fmt:formatDate value="${blist.regdte}" pattern="yyyy.MM.dd"/></td>
       <td>${blist.readcnt}</td>
       </tr>
    </c:forEach>
       
    </tbody>
   </table>    
      <ul class="pagination justify-content-center">
		  <li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.startBlock-1})">Previous</a></li>
		  
		  <c:forEach begin="${boardSch.startBlock}" end="${boardSch.endBlock}" var="pcnt">
		  <li class="page-item ${boardSch.curPage==pcnt?'active':''}">
		  <a class="page-link" href="javascript:goPage(${pcnt})">${pcnt}</a></li>
		  </c:forEach>
		 
		  <li class="page-item"><a class="page-link" href="javascript:goPage(${boardSch.endBlock+1})">Next</a></li>
		</ul>
		<script>
			function goPage(pcnt){
				$("[name=curPage]").val(pcnt)
				$("form").submit();
			}
		</script>
</div>

</body>
</html>