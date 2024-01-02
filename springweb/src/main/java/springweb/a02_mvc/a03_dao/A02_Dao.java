package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Dept;
import springweb.z01_vo.EmpDTO;
import springweb.z01_vo.Member;

public interface A02_Dao {
/*
1. Mapper를 통한 등록
 * */

public int insertEmp(EmpDTO insert);

// dept01 입력처리..
public int insertDept(Dept insert);

public int login(Member m);
public List<Member> schMember(String name);
public int insertMem(Member insert);


/*
2. 인터페이스에서 annotation을 이용하여 sql을 처리
 * */
	
	
}
