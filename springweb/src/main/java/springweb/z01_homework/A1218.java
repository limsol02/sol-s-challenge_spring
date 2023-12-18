package springweb.z01_homework;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

//springweb.z01_homework.A1218
@Controller
public class A1218 {
// 1) 사용자가 도시 이름을 입력하면 해당 도시의 날씨 정보(도시3개 날씨3개 조건처리)를 반환하는 API를 만드세요.
@RequestMapping("start01.do")
public String start01(Model d) {
	d.addAttribute("city",new String[] {"서울","오사카","시드니"});
	d.addAttribute("weather",new String[] {"드럽게추움","좀 들추움","더움"});
	return "WEB-INF\\z01_homework\\1218\\1218_01.jsp";
}

// 사용자가 이름, 이메일, 비밀번호를 입력하여 회원 가입을 할 수 있는 API를 만드세요.
@RequestMapping("home01.do")
public String home01(@RequestParam(value="name", defaultValue = "") String name,@RequestParam(value="email", defaultValue = "") String email,
							@RequestParam(value="pwd", defaultValue = "") String pwd) {
	return "WEB-INF\\z01_homework\\1218\\1218_02.jsp";
}

//3) 여러 개의 투표 항목이 주어지고, 사용자는 투표를 할 수 있는 API를 만드세요. 
//각 사용자는 한 항목에 대해 한 번만 투표 또는 다중 투표를 할 수 있게 만드세요
@RequestMapping("home02.do")
public String home02(Model d) {
	d.addAttribute("dinner",new String[] {"백반","피자","수제비","김치전"});
	return "WEB-INF\\z01_homework\\1218\\1218_03.jsp";
}

// 사용자가 식당의 ID, 예약 날짜 및 시간, 인원 수를 입력하여 예약을 할 수 있는 API를 만드세요.
// - 예약 가능한 시간과 인원 수에 제한을 두어, 불가능한 예약 요청에 대해선 거절 메시지를 반환하세요.
@RequestMapping("home03.do")
public String home03(Model d) {
	d.addAttribute("r01",new String[] {"식당1","4","13:00"});
	d.addAttribute("r02",new String[] {"식당2","2","12:00"});
	d.addAttribute("r03",new String[] {"식당3","5","10:00"});
	d.addAttribute("r04",new String[] {"식당4","4","15:00"});
	return "WEB-INF\\z01_homework\\1218\\1218_04.jsp";
}
}
