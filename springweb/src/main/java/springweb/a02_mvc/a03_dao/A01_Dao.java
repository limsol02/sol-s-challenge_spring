package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Dept;
import springweb.z01_vo.Emp;
// springweb.a02_mvc.a03_dao.A01_Dao
public interface A01_Dao {
	// 여기에 인터페이스를 통해서 추상메서드(입력/리턴) 선언하면
	// mybatis에서 선언된 프레임워크에 의해서 실제 객체를 만들어준다.
	// 			   인터페이스 		Mapper.xml     연동 규칙
	// 1. [규칙1] : 인터페이스명		namespace명
	// 2. [규칙2] : 메서드명		id명
	// 3. [규칙3] : 리턴값type		resultType
	// 4. [규칙4] : 매개변수type	parameterType
	// 5. [규칙5] : 				필요한sql 선언
	
	public List<Emp> getEmpList(Emp sch);
	public int getCountEmp();
	public int getCountDept();
	public List<Dept> getDeptList(Dept sch);
	public String getDnameByDname(int deptno);
	
	/*
	 * 
	 * select dname from dept where deptno=10
	select count(*) from dept;
	 * */
}
