package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A01_Dao;
import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
// 서비스(모델데이터를 만들고, 조건이나 반복문등 알고리즘에 필요한 부분을 처리하는 부분)
@Service
public class A01_EmpService {
	
	// mybatis에서 만들 실제 객체 autowired
	@Autowired
	private A01_Dao dao;
	
	public List<Emp> getEmpList(Emp sch){
		if(sch.getEname()==null) sch.setEname("");
		if(sch.getJob()==null) sch.setJob("");
		
		System.out.println("서비스 단 호출(dao 처리) 건수 : "+dao.getEmpList(sch).size());
		
		System.out.println("사원정보의 갯수 : "+dao.getCountEmp());
		
		System.out.println("부서정보의 갯수 : "+dao.getCountDept());
		System.out.println("부서이름 : "+dao.getDnameByDname(10));
		
		return dao.getEmpList(sch);
	}
	
	
	
	public List<Dept> getDeptList(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		System.out.println("서비스 단 호출(dao 처리) 건수 : "+dao.getDeptList(sch).size());
		return dao.getDeptList(sch);
	}
}
