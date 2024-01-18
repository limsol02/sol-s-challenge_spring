package springweb.a02_mvc.a01_controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.a07_CalendarService;
import springweb.z01_vo.Calendar;

@Controller
public class A07_FullCanlendarController {
	@Autowired(required = false)
	private a07_CalendarService service;
	// http://localhost:7080/springweb/calendar.do
	@GetMapping("calendar.do")
	public String calendar() {
		return "WEB-INF\\views\\a03_mvc\\a12_fullcalendar.jsp";
	}
	// http://localhost:7080/springweb/calList.do
	@GetMapping("calList.do")
	public String calList(Model d) {
		d.addAttribute("callist", service.getCalList());
		return "pageJsonReport";
	}	
	// http://localhost:7080/springweb/insertCalendar.do?
	// 
	@PostMapping("insertCalendar.do")
	public String insertCalendar(Calendar ins, Model d) {
		d.addAttribute("msg", service.insertCalendar(ins));
		d.addAttribute("callist",service.getCalList());
		return  "pageJsonReport";
	}
	// // http://localhost:7080/springweb/insertCalendar.do
	@GetMapping("insertCalendar.do")
	public String insertCalendarFrm() {
		return "WEB-INF\\views\\a01_start\\a17_calendarInsForm.jsp";
	}
	//타이틀 캘린더입력테스트용폼
	
	
	
	
	
	// http://localhost:7080/springweb/calList2.do
	@RequestMapping("calList2.do")
	public ResponseEntity<List<Calendar>>  calList() {
		return ResponseEntity.ok(service.getCalList());
	}		
}
