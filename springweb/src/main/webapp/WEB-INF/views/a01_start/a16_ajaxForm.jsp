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
	var no = 0;
	   $("#schBtn").click(function(){
		   $.ajax({
			   url:"${path}/ajax23.do",
			   dataType:"json",
			   data:$("#frm01").serialize(),
			   success:function(data){
					var member= data.member				  
					var dataHtml = ""
					dataHtml +="<tr><td>"+(++no)+"</td>"
					dataHtml +="<td>"+member.id+"</td>"
					dataHtml +="<td>"+member.name+"</td>"
					dataHtml +="<td>"+member.auth+"</td></tr>"
				   $("tbody").append(dataHtml)
				   $("tfoot").html("<tr><td colspan='3'>현재 회원 등록수</td><td colspan='2'>"+no+"명</td></tr>")
				   $("#frm01")[0].reset()
				   ${"[name=name]"}.focus()
			   },
			   error : function(err){
				   console.log(err)
			   }
		   })
	   })
   });
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>요청값 전달 연습</h2>

</div>
<%----%>
<div class="container">
   <form id="frm01" class="form"  method="post">
     <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <input class="form-control mr-sm-2" placeholder="회원아이디" name="id" />
       <input class="form-control mr-sm-2" placeholder="회원이름" name="name" value=""/>
       <input class="form-control mr-sm-2" placeholder="권한" name="auth" value=""/>
       <button class="btn btn-info" type="button" id="schBtn">등록</button>
       <button class="btn btn-success" 
          data-toggle="modal" data-target="#exampleModalCenter"
           type="button">등록</button>
    </nav>
   </form>
   <table class="table table-hover table-striped">
      
    <thead>
    
      <tr class="table-success text-center">
        <th>번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>권한</th>
      </tr>
    </thead>   
    <tbody>
     
    </tbody>
    <tfoot>
    
    </tfoot>
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