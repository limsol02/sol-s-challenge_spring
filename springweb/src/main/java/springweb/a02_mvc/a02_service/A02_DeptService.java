package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A03_DeptDao;
import springweb.z01_vo.Dept;

@Service
public class A02_DeptService {
	@Autowired
	private A03_DeptDao dao;
	
	public List<Dept> getDeptList02(Dept sch){
		if(sch.getDname()==null) sch.setDname("");
		if(sch.getLoc()==null) sch.setLoc("");
		return dao.getDeptList02(sch);
	}
	
	public int insertDept(Dept ins) {
		return dao.insertDept(ins);
	}
	
	public Dept getDept(int deptno) {
		return dao.getDept(deptno);
	}
	
}
