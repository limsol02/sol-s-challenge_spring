package springweb.a02_mvc.a03_dao;
// springweb.a02_mvc.a03_dao.A03_DeptDao

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

import springweb.z01_vo.Dept;
import springweb.z01_vo.FileRep;

public interface A03_DeptDao {
	public List<Dept> getDeptList02(Dept sch);
	public int insertDept(Dept ins);
	public Dept getDept(@Param("deptno")int deptno);
	
	@Insert("insert into filerep values(#{no}, #{fname}, #{path}, sysdate, sysdate, #{etc})")
	int uploadFile(FileRep ins);
}
