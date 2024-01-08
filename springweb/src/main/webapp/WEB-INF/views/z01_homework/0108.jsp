<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<%--
[1단계:개념] 1. 스프링에서 파일을 업로드 하기위해 설정할 환경 처리를 위한 주요 속성을 기술하세요.
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver"/>
스프링 프레임워크에서 파일 업로드를 처리하기 위한 MultipartResolver를 설정하는 XML 구성입니다.

[1단계:개념] 2. 받은 요청값을 실제 파일로 처리하는 과정을 기술하세요.
1] RequestMapping 설정 : @PostMapping("fileUpload.do")
2] 파일 업로드 메소드 : public String fileUpload(@RequestParam("report") MultipartFile report, Model d) {
3] 파일 이름 및 경로 설정 : String fname = report.getOriginalFilename();
//String path = "C:\\b01_javaexp\\workspace\\sol-s-challenge_spring\\springweb\\src\\main\\webapp\\z02_upload\\";
4] 파일 저장 및 처리 : 
try {
    report.transferTo(new File(path + fname));
    if (fname != null && !fname.equals("")) {
        d.addAttribute("msg", "파일 업로드 성공");
    } else {
        d.addAttribute("msg", "파일 업로드 실패");
    }
} catch (IllegalStateException e) {
    // 예외 처리
} catch (IOException e) {
    // 예외 처리

5] 에러 처리 : 
} catch (IllegalStateException e) {
    System.out.println("에러1 : " + e.getMessage());
    d.addAttribute("msg", "파일 업로드 실패");
    e.printStackTrace();
} catch (IOException e) {
    System.out.println("에러2 : " + e.getMessage());
    e.printStackTrace();
    d.addAttribute("msg", "파일 업로드 실패");
}
6] 뷰반환 : return "WEB-INF\\views\\a03_mvc\\a05_fileUploadFrm.jsp";


[1단계:개념] 3. 공통설정 파일을 설정 방법과 호출방법(컨테이너,java)을 기술하세요 ??


[1단계:확인] 4. springweb에서 fileuploadExp01.do로 과제명과 첨부할과제파일을 서버의 z03_upload위치에 파일을 첨부 처리하세요.
[1단계:확인] 6. 위 4번에서 DB처리시 테이블 report를 만들고 파일업로드된 정보를 등록 처리하세요.
[dao]
@Insert("insert into report values(#{no}, #{fname}, #{path}, sysdate, sysdate, #{etc})")
	int uploadFile(report ins);

[service]
public int uploadFile(report ins) {
		return dao.uploadFile(ins);
	}

[controller]
@GetMapping("fileuploadExp01.do")
	public String fileuploadExp01Frm() {
		return "WEB-INF\\views\\z01_homework\\0108.jsp";
	}
	
	@Value("${file.upload02}")
	String path;	 
	// 다중파일등록
	   @PostMapping("fileuploadExp01.do")
	   public String fileuploadExp01(@RequestParam("reports")
	         MultipartFile[] reports, Model d) {
	     // String path = "C:\\b01_javaexp\\workspace\\board\\src\\main\\webapp\\z01_upload\\";
	      if(reports != null && reports.length > 0) {
	         try {
	            for(MultipartFile mf:reports) {
	               String fname = mf.getOriginalFilename();
	               if(fname!=null&&!fname.equals("")) {
	                  mf.transferTo(new File(path+fname));
	                  d.addAttribute("msg", "파일등록 성공");
	               }else {
	                  d.addAttribute("msg", "파일등록 실패");
	               }
	            }
	         } catch (IllegalStateException e) {
	            d.addAttribute("msg", "파일등록 실패");                  
	         } catch (IOException e) {
	            d.addAttribute("msg", "파일등록 실패");
	         }
	      }else {
	         d.addAttribute("msg", "파일등록 실패");
	      }
	      return "WEB-INF\\views\\z01_homework\\0108.jsp";
	   }

[0108.jsp]
<div class="container">
		<form method="post" enctype="multipart/form-data">

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">과제번호</span>
				</div>
				<input name="no" class="form-control" value="" type="number" />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">과제이름</span>
				</div>
				<input name="fname" class="form-control" value=""  />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">첨부파일</span>
				</div>
				<input type="file" name="reports" class="form-control" value="" multiple="multiple"/>
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">기타정보(파일관련)</span>
				</div>
				<textarea name="etc" class="form-control" id="chatArea">
				
				</textarea>
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

[1단계:개념] 5. 파일을 첨부시 DB처리 목적을 기술하세요
1. 데이터 저장 및 관리 / 2. 데이터 백업 및 복원 / 3. 보안 강화 / 
4. 트랜잭션 일관성 유지 / 5. 효율적인 데이터 관리 


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

<
style type ="text /css ">.input-group-text {
	width: 100%;
	background-color: linen;
	color: black;
	font-weight: bolder;
}

.input-group-prepend {
	width: 20%;
}

#chatArea {
	width: 80%;
	height: 200px;
	overflow-y: auto;
	text-align: left;
	border: 1px solid green;
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
		var msg = "${msg}" // controller단에서 온 결과 모델 처리..
		if(msg!="") alert(msg)
	});
</script>
</head>

<body>
	<div class="jumbotron text-center">
		<h2>예제 과제올리기</h2>

	</div>
	<%-- 
		
--%>
	<div class="container">
		<form method="post" enctype="multipart/form-data">

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">과제번호</span>
				</div>
				<input name="no" class="form-control" value="" type="number" />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>
			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">과제이름</span>
				</div>
				<input name="report_name" class="form-control" value=""  />
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">첨부파일</span>
				</div>
				<input type="file" name="reports" class="form-control" value="" multiple="multiple"/>
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>

			<div class="input-group mb-3">
				<div class="input-group-prepend ">
					<span class="input-group-text  justify-content-center">기타정보(파일관련)</span>
				</div>
				<textarea name="etc" class="form-control" id="chatArea">
				
				</textarea>
				<div class="input-group-append">
					<div id=""></div>
				</div>
			</div>




			<div style="text-align: right;">
				<input type="submit" class="btn btn-success" value="등록" id="regBtn" />
				<input type="button" class="btn btn-info" value="부서리스트" id="mainBtn"
					onclick="location.href='getDeptList02.do'" />
			</div>
		</form>
	</div>
</body>
</html>