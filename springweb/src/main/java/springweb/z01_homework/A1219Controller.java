package springweb.z01_homework;

import org.springframework.stereotype.Controller;
// springweb.z99_home.A1219Controller
import org.springframework.web.bind.annotation.RequestMapping;

import a01_diexp.z01_vo.Vote;
@Controller
public class A1219Controller {
/*
여러 개의 투표 항목이 주어지고, 사용자는 투표를 할 수 있는 API를 만드세요. 
각 사용자는 한 항목에 대해 한 번만 투표 또는 다른 항목에 대해선 다중 투표를 할 수 있게 만드세요
 * */
	// http://localhost:7080/springweb/voting.do
	@RequestMapping("voting.do")
	public String voting(Vote v) {
		// 기본 VO객체를 선언하면 default 요청값 객체에 할당도 하고,
		// Model데이터로 선언도 된다..   @ModelAttribute("vote") Vote t
		// default 객체의 시작 소문자로 모델명이 자동 설정된다.
		// vote   PersonCom ==> personCom
		
		
		return "z01_homework\\1218.jsp";
	}
}
