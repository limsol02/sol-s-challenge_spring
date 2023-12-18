package springweb.a01_start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a01_start.vo.Movie;
import springweb.a01_start.vo.Person;
import springweb.a01_start.vo.PhoneNumber;
import springweb.a01_start.vo.Product;

// springweb.a01_start.A03_ParamObjectModel
@Controller
public class A03_ParamObjectModel {
	/*
	# 객체형 요청값 전달하기
	1. 요청값이 useBean과 같이 property와 matching이 되면 전달되는 처리를 스프링에서 매개변수로 처리하게 하고 있다.
	
	2. 즉, regPerson.do?name=홍길동?age=25&loc=서울 의 요청을 받을 수 있는 setName(), setAge(), setLoc()가 있는
		클래스가 매개변수로 선언되어 있으면 해당 값을 받아서 처리할 수 있다.
	[ex] public String regerPerson(Person p)
	
	3. 객체로 요청값을 받는 경우, 특별한 기능 처리가 더 추가가 되는데
	 1) default값을 설정하기 않더라도 해당 요청값이 없으면 객체는 각 속성이 null, 0이 설정되어 처리된다.
	  	요청값을 처리하지 않을 때, default로 처리되는데, 합당하지 않는 요청값을 요청시는 에러발생.
	  	?age=이십오 : 문자열데이터 호출시는 404에러가 발생한다
	  	
	 2) 객체로 요청값을 받는 경우, default로 객체의 소문자 형태로 모델 데이터까지 설정되어 처리된다.
	 	public String regerPerson(Person p) 의 경우, 화면에서 Person ==> person 형태로 객체의 참조로 모델 데이터를 사용할 수 있다. 
	 	${person.name} ${person.age} ${person.loc}
	 * */
	@RequestMapping("callObj01.do")
	public String callObj01(Person p) {
		return "WEB-INF/views/a01_start/a10_objectParam.jsp";
	}
	
	// 고객명 전화번호를 전화번호부를 등록하는 vo 를 만들어 a11_regPhone.jsp
	// http://localhose:7080/springweb/regPhone.do
	@RequestMapping("regPhone.do")
	public String regPhone(PhoneNumber p01) {
		return "WEB-INF/views/a01_start/ a11_regPhone.jsp";
	}
	
	// http://localhost:7080/springweb/preMovie.do?date=&name=&cnt=
	// 영화 예약 날짜 제목 인원을 입력 해당 출력 처리하세여
	@RequestMapping("preMovie.do")
	public String preMovie(@ModelAttribute("m01") Movie m01) {
		// movie ==> m01로 설정
		return "WEB-INF/views/a01_start/ a12_preMovie.jsp";
	}
	/*
	# Model 데이터
	1. MVC 패턴에서 핵심 데이터를 처리할 때 사용한다.
	스프링에는 Model이라는 객체를 지원하여 그 객체에 속성과 속성값 형식으로 설정한다.
	 * */
	@RequestMapping("model01.do")
	public String Model01(Model d) {
		d.addAttribute("m01","안녕하새요"); // ==>${m01}
		d.addAttribute("m02",200); // ==>${m02}
		d.addAttribute("m03",new String[]{"사과","오렌지","바나나"});
		// ==> ${m03[0]} ${m03[1]} ${m03[2]}
		d.addAttribute("m04",new Person("홍길동",25,"서울"));
		// ==> ${m04.name} ${m04.age} ${m04.loc}
		return "WEB-INF\\views\\a02_modelView\\a01_oneModel.jsp";
	}
	
	// http://localhost:7080/springweb/model02.do
	// num01, num02, Product (pname(물건명) , price(가격), cnt(갯수))
	//	memberIds(회원아디==이디 배열을 설정하여) a02_model.jsp에 출력하세요
	@RequestMapping("model02.do")
	public String model02(Model d) {
		d.addAttribute("num01",10);
		d.addAttribute("num02",20);
		d.addAttribute("memberIds",new String[] {"himan","badman","goodman"});
		d.addAttribute("p01", new Product("사과",2000,3));
		return "WEB-INF\\views\\a02_modelView\\a02_model.jsp";
		
	}
}
