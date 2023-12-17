package springweb.a01_start;

import org.springframework.stereotype.Controller;
// annotation으로 controller(사용자 정의 컨트롤러)
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

// springweb.a01_start.A01_StartController
@Controller
public class A01_StartController {
	// WEB-INF\views\a01_startSpring.jsp
	// 각 메서드마다 url 패턴으로 해당 view를 호출..
	// http://localhost:7080/springweb/start.do
	@RequestMapping("start.do")
	public String start() {
		return "WEB-INF\\views\\a01_startSpring.jsp";
	}
	
	// 요청값 처리
	// http://localhost:7080/springweb/start2.do?name=홍길동
	
	@RequestMapping("start2.do")
	public String start2(@RequestParam("name") String name) {
		System.out.println("요청값이름 : "+name);
		return "WEB-INF\\views\\a03_startSpring.jsp";
	}
	
}
