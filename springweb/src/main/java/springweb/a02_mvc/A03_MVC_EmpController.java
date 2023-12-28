package springweb.a02_mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Dept;


@Controller

public class A03_MVC_EmpController {
	// 컨테이너에 있는 객체 자동 할당 처리..
	@Autowired(required = false) // 컨테이너에 객체가 없더라도 null point Exception 발생 방지
	private d01_dao.PreparedStmtDao dao; // new PreparedStmtDao 호출
	
	// http://localhost:7080//springweb/deptList.do
	
	@RequestMapping("deptList.do")
	public String deptList(Dept sch, Model d) {
		
		d.addAttribute("deptList",dao.getDeptList(sch));
		
		return"WEB-INF\\views\\a03_mvc\\a02_deptList.jsp";
	}
	
	
//	@RequestMapping("empList.do")
//	public String insertEmp(EmpDTO ins, Model d) {
//		
//		d.addAttribute("insertEmp",dao.insertEmp01(ins));
//		
//		return "WEB-INF\\views\\a03_mvc\\a01_empList.jsp";
//	}
}
