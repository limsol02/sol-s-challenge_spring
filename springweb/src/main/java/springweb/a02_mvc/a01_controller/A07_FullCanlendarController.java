package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import springweb.a02_mvc.a02_service.a07_CalendarService;

@Controller
public class A07_FullCanlendarController {
	@Autowired(required = false)
	private a07_CalendarService service;
	
	// http://localhost:7080/springweb/calendar.do 
	@GetMapping("calendar.do")
	public String calendar() {
		return"WEB-INF\\views\\a03_mvc\\a12_fullcalendar.jsp";
	}
	
	// http://localhost:7080/springweb/calList.do 
	@GetMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("calList",service.getCalList());
		return"pageJsonReport";
	}
	
}
