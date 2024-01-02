package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Dept;
import springweb.z01_vo.EmpDTO;
import springweb.z01_vo.Member;

public interface Z01_Dao {

public int login(Member m);
public List<Member> schMember(String name);
public int insertMem(Member insert);

}
