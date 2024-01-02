package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.Z01_MemberService;
import springweb.z01_vo.Member;

@Controller
public class Z01_MemberController {
	
	@Autowired
	private Z01_MemberService service;
	
	@RequestMapping("memExp.do")
	public String memExp(Member m, Model d) {
		d.addAttribute("login", service.getLogin(m));
	
		return "WEB-INF\\views\\z01_homework\\0102.jsp";
	}
	
	

	
}
