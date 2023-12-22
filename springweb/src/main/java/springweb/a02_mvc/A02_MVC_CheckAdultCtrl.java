package springweb.a02_mvc;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//springweb.a02_mvc.A02_MVC_CheckAdultCtrl
@Controller
public class A02_MVC_CheckAdultCtrl {
	
	@RequestMapping("checkAdult.do")
	public String checkAdult(@RequestParam(value = "age" , defaultValue = "0")int age, Model d) {
		String message = "";
		if(age>=18) {
			message = "성인입니다.";
		}else if(age!=0) {
			message = "미성년자입니다.";
		}else {
			message ="나이를 입력해주세요";
		}
		
		d.addAttribute("message",message);
		return "WEB-INF\\views\\a02_modelView\\a04_checkAdult.jsp";
	}
}
