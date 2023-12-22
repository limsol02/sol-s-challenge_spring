package springweb.a02_mvc;

import java.util.Arrays;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
// springweb.a02_mvc.A01_MVC_StartController
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a01_start.vo.Movie;
import springweb.a01_start.vo.Person;
@Controller
public class A01_MVC_StartController {
	// http://234.32.12.105:7080/springweb/call10.do 
	// http://234.32.12.105:7080/springweb/call10.do?name=홍길동
	// 요청값이 없을때도 처리하고, 요청값이 있을때도 처리하려면 
	// ==> Value값을 설정하고 defaultValue=""도 설정해줘야함
	@RequestMapping("call10.do")
	public String call10(@RequestParam(value="name",defaultValue = "") String name, Model d) {
		// Model d => jsp 파일에서 request.setAttribute("gender","남") 
		
		// 요청값에 따른 권한 설정
		String auth = "";
		if(name.equals("홍길동")) {
			auth="관리자";
		}else if(!name.equals("")) {
			auth="일반사용자";
		}else { // "", null 일 때
			auth="";
		} 
		d.addAttribute("auth",auth); // 넘겨줄 모델 데이터 설정 ${auth}
		return "WEB-INF\\views\\a02_modelView\\a03_callAuth.jsp";
	}
	
	@RequestMapping("call12.do")
	public String call11(Model d) {
		d.addAttribute("name","마길동");
		d.addAttribute("age",29);
		d.addAttribute("person",new Person("홍길동",25,"서울"));
		
		d.addAttribute("fname","사과");
		d.addAttribute("price","3000");
		d.addAttribute("m01",new Movie("2023년12월25일","타짜",2));
		
		return "WEB-INF\\views\\a02_modelView\\a05_modelKind.jsp";
		/*
		화면단 호출방법?
		${name}
		${age+10}
		${person.name} ==> person.getName(); = get property 호출
		${person.age} ==> person.getAge();
		${person.loc} ==> person.getLoc();
		
		[ex] fruit과일명 전달 선언과 할당
			price 과일의 가격 선언과 할당
			Moive vo를 이용해 상영일 영화제목 동반자수를 할당하여 화면에 추력
		 * */
	}
	
	@RequestMapping("call13.do")
	public String call13(Model d) {
		// 배열형 데이터
		// 1. 단순배열
		d.addAttribute("fruits", new String [] {"사과","바나나","딸기"});
		
		/*
		[view단]
		fruits[0] fruits[1] fruits[2]
		 * */
		
		// 2. List 형
		d.addAttribute("names", Arrays.asList("홍길동","김길동","신길동"));
		
		/*
		[view단]
		${names.get(0)} ${names.get(1)} ${names.get(2)}
		<c:forEach var="name" items="${names}">
			${name}
		</c:forEach>
		 * */
		
		return "WEB-INF\\views\\a02_modelView\\a06_modelKind.jsp";

	}
	
}
