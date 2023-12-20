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
[1단계:개념] 1. 정규화는 어떤 필요성 때문하는 하지는 예를 들어 기술하세요
1. 새로운 데이터를 삽입하기 위해 불필요한 데이터도 함께 삽입해야합니다. 
emp_dept처럼 컬럼이 나뉘지않고 그러면 데이터 하나를 입력할때 모든 컬럼값에 데이터를 넣어야합니다.
2. 공통된 데이터 전체가 아닌 일부만 변경되어 데이터가 불일치하게 됩니다.
3. 사람들을 지운것 뿐인데 어쩌다보니 동일한 부서번호만 삭제한 경우
그 부서번호까지 다 삭제되어버리는 손실문제가 발생합니다. 

그렇기에 정규화를 하여아합니다. 

[1단계:개념] 2. 정규화의 5단계와 핵심 내용을 기술하세요
제 1 정규형(1NF):
각 컬럼은 원자 값(Atomic value)을 가지며, 중복된 데이터가 없어야 합니다.
모든 레코드에 대해 각 컬럼이 하나의 값만을 가지도록 구성합니다.

제 2 정규형(2NF):
제 1 정규형을 만족하면서, 부분 함수적 종속을 제거합니다.
기본키가 모든 컬럼에 대해 완전 함수 종속(Primary Key에 대해 다른 컬럼이 의존하지 않음)해야 합니다.

제 3 정규형(3NF):
제 2 정규형을 만족하면서, 이행적 종속(Transitive Dependency)을 제거합니다.
기본키에 대해 이행적으로 종속되는 컬럼을 다른 테이블로 이동시켜 구조를 최적화합니다.

Boyce-Codd 정규형(BCNF):
제 3 정규형을 만족하면서, 결정자가 후보키인 경우입니다.
각 결정자가 다른 모든 속성에 대해 완전 함수 종속되도록 합니다.

제 4 정규형(4NF):
다치 종속(Multivalued Dependency)을 제거합니다.
하나의 테이블에 대해 다중 값 종속이 없도록 구조를 조정합니다.

[1단계:확인] 3. 아래 제1정규화 대상테이블을 제1정규화 처리하여, 출력하세요
1) 다음 표는 학생의 수업 성적에 관한 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 학생번호 | 학생이름 | 과목1 | 과목2 | 과목3 |
|---------|---------|-------|-------|-------|
| 1       | Alice   | 90    | 85    | 78    |
| 2       | Bob     | 76    | 88    | 92    |
| 3       | Carol   | 95    | 91    | 87    |
2) 다음 표는 학생의 과제 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 학생이름 | 과제1       | 과제2        | 과제3       |
|---------|------------|-------------|------------|
| Alice   | 95         | 88          | 76         |
| Bob     | 85         | 92          | 78         |
| Carol   | 91         | 87          | 90         |
3. 다음 표는 강의 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 강의번호 | 강의이름          | 담당교수        | 수강생1     | 수강생2      |
|---------|------------------|---------------|------------|-------------|
| 1       | Introduction to DB | Prof. Smith | Alice      | Bob         |
| 2       | Data Structures    | Prof. Johnson | Carol      | David       |
| 3       | Algorithms         | Prof. Lee    | Eve        | Frank       |
4. 다음 표는 주문 정보를 담고 있습니다. 이 표를 제1정규화에 따라 정리하세요.
| 주문번호 | 고객이름 | 주문상세                                       |
|---------|---------|-----------------------------------------------|
| 1       | Alice   | 상품: iPhone, 수량: 2, 가격: 1000원     |
| 2       | Bob     | 상품: iPad, 수량: 1, 가격: 800원        |
| 3       | Carol   | 상품: MacBook, 수량: 3, 가격: 1200원 |

[1단계:확인] 4. 아래 제2정규화 대상테이블을 제2정규화 처리하여, 출력하세요
문제 1: 직원 근무 시간 테이블
| 직원ID | 프로젝트코드 | 직원이름 | 프로젝트명 | 근무시간 |
|--------|-------------|----------|------------|--------|
| 1001   | PRJ1        | John Doe | Alpha      | 30     |
| 1001   | PRJ2        | John Doe | Beta       | 20     |
| 1002   | PRJ1        | Jane Doe | Alpha      | 25     |
문제 2: 학생 취미 테이블
| 학생번호 | 학생이름 | 학생 전공 | 취미        |
|---------|----------|-----------|-------------|
| 001     | Alice    | 컴퓨터 과학 | 프로그래밍   |
| 001     | Alice    | 컴퓨터 과학 | 산악 자전거 |
| 002     | Bob      | 수학       | 체스        |
문제 3: 도서 대여 기록 테이블
| 대여번호 | 회원ID | 회원이름 | 책 제목 | 대여일자 |
|---------|-------|---------|---------|---------|
| 01      | A123  | John    | 해리 포터 | 2023-01-01 |
| 02      | B456  | Jane    | 지킬 박사와 하이드 | 2023-01-02 |
| 03      | A123  | John    | 호빗      | 2023-01-03 |
문제 4: 학생 시험 성적 테이블
| 학생번호 | 학생이름 | 과목코드 | 과목명 | 성적 |
|---------|----------|---------|--------|------|
| 1001    | Alice    | MAT101  | 수학    | 95   |
| 1001    | Alice    | PHY102  | 물리학  | 89   |
| 1002    | Bob      | MAT101  | 수학    | 78   |
문제 5: 직원 임금 테이블
| 직원ID | 부서코드 | 직원이름 | 부서명       | 시간당 임금 |
|--------|---------|----------|-------------|------------|
| E01    | D01     | John     | 개발         | 40         |
| E02    | D02     | Jane     | 마케팅       | 35         |
| E01    | D01     | John     | 개발         | 40         |
| E03    | D03     | Bob      | 인사         | 30         |
 

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
		})		
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>타이틀</h2>

	</div>
	<%-- 
		
    --%>
	<div class="container">
		<form id="frm01" class="form" method="post">
			<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
				<input placeholder="제목" name="" class="form-control mr-sm-2" /> <input
					placeholder="내용" name="" class="form-control mr-sm-2" />
				<button class="btn btn-info" type="submit">Search</button>
				<button class="btn btn-success" data-toggle="modal"
					data-target="#exampleModalCenter" type="button">등록</button>
			</nav>
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
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
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