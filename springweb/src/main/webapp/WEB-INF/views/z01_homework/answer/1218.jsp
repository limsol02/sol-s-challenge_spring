<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="backendweb.z01_vo.*"
	import="backendweb.d01_dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--
[1단계:개념] 1. 아래의 단계별 요청값 처리의 속성을 기본에제를 통해 설명하세요
		1) 요청값 1개 처리
		2) 요청값이 없을 때를 대비하여 요청값 1개 처리
		3) 요청값 2개이상 처리
		3) 요청배열의 처리
[1단계:개념] 2. 요청객체의 처리시, 일반 요청값과의 차이점을 예제로 설명하세요
[1단계:확인] 3. 아래내용을 화면단에 출력하세요
		1) 사용자가 도시 이름을 입력하면 해당 도시의 날씨 정보(도시3개 날씨3개 조건처리)를 반환하는 API를 만드세요.
		2) 사용자가 이름, 이메일, 비밀번호를 입력하여 회원 가입을 할 수 있는 API를 만드세요.
		3) 여러 개의 투표 항목이 주어지고, 사용자는 투표를 할 수 있는 API를 만드세요. 
		      각 사용자는 한 항목에 대해 한 번만 투표 또는 다른 항목에 대해선 다중 투표를 할 수 있게 만드세요
		4) 사용자가 식당의 ID, 예약 날짜 및 시간, 인원 수를 입력하여 예약을 할 수 있는 API를 만드세요.
		    - 예약 가능한 시간과 인원 수에 제한을 두어, 불가능한 예약 요청에 대해선 거절 메시지를 반환하세요.



 # 조별로 파악사항(아래사항 조별로 취합 전달 17:20까지 전달)
1. 오늘 가장 어려웠던 부분 best3 및 내일 자세한 설명 필요한 부분
2. 오늘 지각(9:00기준)/수업시간 엄수(매시간:00)/과제제출 인원과 사유
3. 수업 시간 긍적적으로 집중하였는가?  

이 질문은 스프링(Spring)과 JSP를 사용하여 웹 애플리케이션을 구축하는 과정에 대한 개념과 실습 예제를 요구하고 있습니다. 아래에서는 각 요청을 어떻게 처리할 수 있는지에 대한 개념적 설명과 기본 예제를 제공하겠습니다.

### 1단계: 개념 - 요청값 처리

#### 1) 단일 요청값 처리
```java
@GetMapping("/example")
public String singleParam(@RequestParam String param) {
    return "Received: " + param;
}
```

#### 2) 요청값이 없을 때의 단일 요청값 처리
```java
@GetMapping("/exampleOptional")
public String optionalParam(@RequestParam(required = false, defaultValue = "Default") String param) {
    return "Received: " + param;
}
```

#### 3) 다중 요청값 처리
```java
@GetMapping("/multiParams")
public String multiParams(@RequestParam String param1, @RequestParam String param2) {
    return "Received params: " + param1 + ", " + param2;
}
```

#### 4) 요청 배열 처리
```java
@GetMapping("/arrayParams")
public String arrayParams(@RequestParam List<String> params) {
    return "Received params: " + params.toString();
}
```

### 1단계: 개념 - 요청 객체 처리와 일반 요청값의 차이점

일반 요청값(`@RequestParam`)은 단일 파라미터를 받는데 사용되고, 요청 객체(`@RequestBody`)는 복잡한 데이터 구조(예: JSON)를 받을 때 사용됩니다.

#### 요청 객체 처리 예제
```java
@PostMapping("/requestBody")
public String handleRequestBody(@RequestBody User user) {
    return "Received user with name: " + user.getName();
}

public class User {
    private String name;
    private String email;
    // getters and setters 생략
}
```

### 1단계: 확인 - 화면단 출력 예제

#### 1) 날씨 정보 API
```java
@GetMapping("/weather")
public String getWeather(@RequestParam String city) {
    // 날씨 정보 조회 로직 구현
    return "Weather for " + city;
}
```

#### 2) 회원 가입 API
```java
@PostMapping("/register")
public String registerUser(@RequestBody User user) {
    // 회원 가입 처리 로직 구현
    return "Registered user: " + user.getName();
}
```

#### 3) 투표 API
```java
@PostMapping("/vote")
public String vote(@RequestParam String userId, @RequestParam String pollItem) {
    // 투표 로직 구현
    return "User " + userId + " voted for " + pollItem;
}
```

#### 4) 식당 예약 API
```java
@PostMapping("/reserveRestaurant")
public String reserveRestaurant(@RequestBody Reservation reservation) {
    // 예약 로직 구현
    return "Reservation for " + reservation.getRestaurantId();
}

public class Reservation {
    private String restaurantId;
    private LocalDate date;
    private int people;
    // getters and setters 생략
}
```

### JSP를 이용한 화면 구성

위의 각 API는 스프링 컨트롤러에서 처리하고, 결과를 JSP 페이지에 전달하여 사용자에게 보여줄 수 있습니다. 각 API 처리 후 `ModelAndView` 객체를 사용하여 데이터와 함께 JSP 페이지를 반환할 수 있습니다.

예시:
```java
@GetMapping("/example")
public ModelAndView showPage() {
    ModelAndView mav = new ModelAndView("examplePage");
    mav.addObject("message", "Hello World");
    return mav;
}
```


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
	$(document).ready(function() {
		$("form").on("keypress", function(e) {
			if (e.keyCode == 13) { //  enter키의 keycode는 13
				e.preventDefault() // enter키의 기본 동작을 중단 처리
			}
		})
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>투표!!</h2>

	</div>
	<%-- 
	private int choice1;
	private String choice2;
	private String[] choice3;
    --%>
	<div class="container">
<form id="frm02" class="form" method="post">
    <div class="container">
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="choice1" class="form-label">시도지사</label>
                <select name="choice1" class="form-select">
                    <option value="0">선택하세요</option>
                    <option value="1">갑당 김주립</option>
                    <option value="2">을당 강정책</option>
                    <option value="3">병당 백최고</option>
                </select> 
            </div>
            <div class="col-md-4">
                <label class="form-label">교육감</label>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="choice2" value="김주립" id="kimJurip">
                    <label class="form-check-label" for="kimJurip">김주립</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="choice2" value="강정책" id="kangJungChak">
                    <label class="form-check-label" for="kangJungChak">강정책</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="choice2" value="송세라" id="songSera">
                    <label class="form-check-label" for="songSera">송세라</label>
                </div>
                <div class="form-check">
                    <input type="radio" class="form-check-input" name="choice2" value="이슬기" id="leeSeulGi">
                    <label class="form-check-label" for="leeSeulGi">이슬기</label>
                </div>
            </div>
            <div class="col-md-4">
                <label class="form-label">시도의원</label>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="choice3" value="갑당 김영철" id="kimYoungChul">
                    <label class="form-check-label" for="kimYoungChul">갑당 김영철</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="choice3" value="을당 이소라" id="leeSoRa">
                    <label class="form-check-label" for="leeSoRa">을당 이소라</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="choice3" value="병당 이진실" id="leeJinShil">
                    <label class="form-check-label" for="leeJinShil">병당 이진실</label>
                </div>
                <div class="form-check">
                    <input type="checkbox" class="form-check-input" name="choice3" value="정당 오세라" id="ohSeRa">
                    <label class="form-check-label" for="ohSeRa">정당 오세라</label>
                </div>
            </div>                
        </div>
        <div class="row">
            <div class="col">
                <button class="btn btn-primary" type="submit">선택</button>
            </div>
        </div>
    </div>
</form>

		<table class="table table-hover table-striped">
			<col width="33%">
			<col width="34%">
			<col width="33%">
			<thead>

				<tr class="table-success text-center">
					<th>시도지사</th>
					<th>교육감</th>
					<th>시도의원</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${vote.choice1Str}</td>
					<%--get property의 확실한 증거 --%>
					<td>${vote.choice2}</td>
					<td><c:forEach var="cho" items="${vote.choice3}">
							${cho}<br>
						</c:forEach>
					</td>
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