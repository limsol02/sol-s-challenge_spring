package springweb.a02_mvc.a01_controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a02_mvc.a02_service.A05_BoardService;
import springweb.z01_vo.BoardSch;

@Controller
public class A05_BoardController {
	@Autowired(required = false)
	private A05_BoardService service;
	
	// boardList.do
	@RequestMapping("boardList.do")
	public String boardList(BoardSch sch, Model d) {
		d.addAttribute("boardList", service.boardList(sch));
		return"WEB-INF\\views\\a03_mvc\\a10_boardList.jsp";
	}
}
