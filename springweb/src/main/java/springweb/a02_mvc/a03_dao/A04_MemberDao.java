package springweb.a02_mvc.a03_dao;

import org.apache.ibatis.annotations.Select;

import springweb.z01_vo.Member;

public interface A04_MemberDao {
	
	@Select("select * from member where id=#{id} and pwd=#{pwd}")
	Member login(Member sch);
}
