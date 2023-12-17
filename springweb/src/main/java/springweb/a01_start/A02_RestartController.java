package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

// springweb.a01_start.A02_RestartController
@Controller
public class A02_RestartController {
	// restart.do로 
	// WEB-INF\views\a02_restart.jsp 호출
	
	/*
	1. 클래스 선언 할 것
		패키지명, @Controller 선언.
	2. 컨테이너 클래스 등록
	3. view(jsp선언) WEB-INF\views\a02_restart.jsp
	4. 메서드 선언
		@RequestMapping("") 
		public String restart(){
			return "";
		}
	 * */
	@RequestMapping("restart.do")
	public String restart() {
		return "WEB-INF\\views\\a02_restart.jsp";
	}
}
