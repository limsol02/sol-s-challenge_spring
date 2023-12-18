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
		return "WEB-INF\\views\\a01_start\\a01_startSpring.jsp";
	}
	
	// 요청값 처리
	// http://localhost:7080/springweb/start2.do?name=홍길동
	
	@RequestMapping("start2.do")
	public String start2(@RequestParam("name") String name) {
		System.out.println("요청값이름 : "+name);
		return "WEB-INF\\views\\a01_start\\a03_startSpring.jsp";
	}
	
	// 요청값 no를 차리하세여!
	// http://localhost:7080/springweb/start3.do?no=1000
	// view는 a03_ requestNo.jsp
	@RequestMapping("start3.do")
	public String start3(@RequestParam("no") int no) {
		System.out.println("요청값 : "+no);
		return "WEB-INF\\views\\a01_start\\a03_ requestNo.jsp";
	}
	
	// http://localhost:7080/springweb/start4.do?name=사과&price=3000&cnt=2
	@RequestMapping("start4.do")
	public String start4(@RequestParam("name") String name, @RequestParam("price") int price, @RequestParam("cnt") int cnt) {
		System.out.println("## 요청값 ##");
		System.out.println("물건명 : "+ name);
		System.out.println("가격 : "+ price);
		System.out.println("갯수 : "+ cnt);
		return "WEB-INF\\views\\a01_start\\a04_buyProduct.jsp";
	}
	
	// ex]  http://localhost:7080/springweb/start5.do?name=홍길동&age=25&loc=서울
	@RequestMapping("start5.do")
	public String start5(@RequestParam("name") String name, @RequestParam("age") int age, @RequestParam("loc") String loc) {
		System.out.println("## 요청값 출력 ##");
		System.out.println("이름 : "+name);
		System.out.println("나이 : "+age);
		System.out.println("지역 : "+loc);
		return "WEB-INF\\views\\a01_start\\a04_person.jsp";
	}
	
	@RequestMapping("start6.do")
	// 요청값이 없을 때에는 defaultValue로 요청값이 있을 때에는 해당 요청값으로 처리..
	// http://localhost:7080/springweb/start6.do
	public String start6(@RequestParam(value="name", defaultValue = "^_^") String name) {
		System.out.println("요청값이름 : "+name);
		return "WEB-INF\\views\\a01_start\\a03_startSpring.jsp";
	}

	@RequestMapping("start7.do")
	// 요청값이 없을 때에는 defaultValue로 요청값이 있을 때에는 해당 요청값으로 처리..
	// http://localhost:7080/springweb/start7.do
	public String start7(@RequestParam(value="name", defaultValue = "^_^") String name, @RequestParam(value="price", defaultValue="0")int price,
			@RequestParam(value="cnt", defaultValue = "0")int cnt) {
		System.out.println("## 요청값 ##");
		System.out.println("물건명 : "+ name);
		System.out.println("가격 : "+ price);
		System.out.println("갯수 : "+ cnt);
		return "WEB-INF\\views\\a04_buyProduct.jsp";
	}
	
	//  http://localhost:7080/springweb/login01.do?id=himan&pwd=7777
	// 요청값이 없더라고 초기화면이 출력되고, 요청값을 화면에서 전달하면 해당 입력값 내용을 출력하게 하새용
	@RequestMapping("login01.do")
	public String login01(@RequestParam(value="id", defaultValue = "") String id, @RequestParam(value="pwd", defaultValue = "") String pwd) {
		return "WEB-INF\\views\\a01_start\\a02_restart.jsp";
	}
	
	//  http://localhost:7080/springweb/buyInfo.do?name=사과&price=3000&cnt=5
	// 를 처리하는 초기화면 만들어서, form요청값 화면 만든 후, 물건명@@ 총계@@ 출력되게 하세여 a07_buyForm.jsp
	@RequestMapping("buyInfo.do")
	public String buyInfo(@RequestParam(value="name", defaultValue = "")String name, @RequestParam(value="price", defaultValue = "0") int price,
			@RequestParam(value="cnt", defaultValue = "0") int cnt) {
		return "WEB-INF\\views\\a01_start\\a07_buyForm.jsp";
	}
	
	//  http://localhost:7080/springweb/members.do?mname=홍길동&mname=마길동&mname=신길동
	@RequestMapping("members.do")
	public String names(@RequestParam("mname") String[] mnames) {
		// 여거개의 데이터를 입력할 때, 사용하는 형태를 말한다.
		System.out.println("## 배열형데이터 ##");
		for(String mname:mnames) {
			System.out.println(mname);
		}
		return "WEB-INF/views/a01_start/a08_mlist.jsp"; // index.jsp 호출됨..
		
	}
	
	//  http://localhost:7080/springweb/orderMenu.do?menu=짜장면&menu=짬뽕&menu=탕수육
	@RequestMapping("orderMenu.do")
	public String orderMenu(@RequestParam(value="menu", defaultValue = "")String[] menus) {
		for(String menu : menus) {
			System.out.println(menu);
		}
		return "WEB-INF/views/a01_start/a09_orderList.jsp";
	}
	
	
}





