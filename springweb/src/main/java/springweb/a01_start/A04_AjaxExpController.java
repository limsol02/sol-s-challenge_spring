package springweb.a01_start;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import springweb.a01_start.vo.Person;
import springweb.a01_start.vo.Product;
import springweb.a02_mvc.a02_service.A02_DeptService;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Member;

@Controller
public class A04_AjaxExpController {
	@GetMapping("ajax01.do")
	// http://localhost:7080/springweb/ajax01.do
	public String ajax01(Model d) {
		d.addAttribute("name","홍길동");
		return "pageJsonReport";
	}
	@GetMapping("ajax02.do")
	// http://localhost:7080/springweb/ajax02.do
	public String ajax02(Model d) {
		d.addAttribute("name","홍길동");
		d.addAttribute("age",25);
		d.addAttribute("loc","서울");
		return "pageJsonReport";
	}
	@GetMapping("ajax03.do")
	// http://localhost:7080/springweb/ajax03.do
	public String ajax03(Model d) {
		d.addAttribute("names",new String[]{"홍길동","김길동","신길동"});
		d.addAttribute("ages",new int[]{25,27,30});
		return "pageJsonReport";
	}
	@GetMapping("ajax04.do")
	// 물건명 가격 갯수 영문으로 설정해서 json데이터 출력
	// http://localhost:7080/springweb/ajax04.do
	public String ajax04(Model d) {
		d.addAttribute("product",new Product("apple",2,3000));
		return "pageJsonReport";
	}
	@GetMapping("ajax05.do")
	// 학생3명의 국어점수 데이터 출력
	// http://localhost:7080/springweb/ajax05.do
	public String ajax05(Model d) {
		d.addAttribute("snames",new String[]{"홍길동","김길동","최길동"});
		d.addAttribute("kors",new int[]{80,50,70});
		return "pageJsonReport";
	}
	@GetMapping("ajax07.do")
	// {"person":이름,나이,사는곳} 설정하여 json 형식을 추력
	// http://localhost:7080/springweb/ajax07.do
	public String ajax07(Model d) {
		d.addAttribute("person",new Person("홍길동",22,"서울"));
		return "pageJsonReport";
	}
	@GetMapping("ajaxFrm01.do")
	// {"person":이름,나이,사는곳} 설정하여 json 형식을 추력
	// http://localhost:7080/springweb/ajaxFrm01.do
	public String ajaxFrm01(Model d) {
		
		return "WEB-INF\\views\\a01_start\\a13_ajaxForm.jsp";
	}
	
	
	@Autowired(required = false)
	private A02_DeptService service;
	
	@GetMapping("ajaxFrm02.do")
	// {"person":이름,나이,사는곳} 설정하여 json 형식을 추력
	// http://localhost:7080/springweb/ajaxFrm02.do
	public String ajaxFrm02(Model d) {
		
		return "WEB-INF\\views\\a01_start\\a14_ajaxForm.jsp";
	}
	
	@GetMapping("ajax10.do")
	// http://localhost:7080/springweb/ajax10.do
	public String ajax10(Dept sch,Model d) {
		d.addAttribute("deptList",service.getDeptList02(sch));
		return "pageJsonReport";
	}
	
	@GetMapping("ajax20.do")
	// http://localhost:7080/springweb/ajax20.do
	public String ajax20(@RequestParam(value="name", defaultValue = "") String name,Model d) {
		d.addAttribute("req_name",name);
		return "pageJsonReport";
	}
	
	@GetMapping("ajax21.do")
	// http://localhost:7080/springweb/ajax21.do
	public String ajax21(Person p) {
	
		return "pageJsonReport";
	}
	
	@GetMapping("ajax22.do")
	// http://localhost:7080/springweb/ajax22.do
	public String ajax22(Product p01) {
		return "pageJsonReport";
	}
	
	@GetMapping("ajaxFrm03.do")
	// {"person":이름,나이,사는곳} 설정하여 json 형식을 추력
	// http://localhost:7080/springweb/ajaxFrm03.do
	public String ajaxFrm03(Model d) {
		
		return "WEB-INF\\views\\a01_start\\a15_ajaxForm.jsp";
	}
	
	//ajax23.do
	//a16_ajaxFormdo
	//회원아이디 회원이름 회원권한 입력하여 등록된 회원 리스트를 처리
	@GetMapping("ajaxFrm04.do")
	// http://localhost:7080/springweb/ajaxFrm04.do
	public String ajaxFrm04() {
		return "WEB-INF\\views\\a01_start\\a16_ajaxForm.jsp";
	}
	@GetMapping("ajax23.do")
	public String ajax23(Member m) {
		return "pageJsonReport";
	}
	
	
	
}
