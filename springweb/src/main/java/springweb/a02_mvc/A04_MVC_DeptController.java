package springweb.a02_mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.z01_vo.Emp;
import springweb.z01_vo.EmpDTO;

@Controller

public class A04_MVC_DeptController {
	// 컨테이너에 있는 객체 자동 할당 처리..
	@Autowired(required = false) // 컨테이너에 객체가 없더라도 null point Exception 발생 방지
	private d01_dao.PreparedStmtDao dao;
	
	// http://localhost:7080//springweb/empList.do
	@RequestMapping("empList.do")
	public String empList(Emp sch, Model d) {
		
		// 요청값이 없을 때는 "" 으로 처리..
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		
		d.addAttribute("empList",dao.getEmpList(sch));
		
		return "WEB-INF\\views\\a03_mvc\\a01_empList.jsp";
	}
	
	
//	@RequestMapping("empList.do")
//	public String insertEmp(EmpDTO ins, Model d) {
//		
//		d.addAttribute("insertEmp",dao.insertEmp01(ins));
//		
//		return "WEB-INF\\views\\a03_mvc\\a01_empList.jsp";
//	}
}
