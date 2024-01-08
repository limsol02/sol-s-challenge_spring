package springweb.a02_mvc.a03_dao;

import org.apache.ibatis.annotations.Insert;

import springweb.z01_vo.report;

public interface Z01_ReportDao {
	@Insert("insert into report values(#{no}, #{fname}, #{path}, sysdate, sysdate, #{etc})")
	int uploadFile(report ins);
}
