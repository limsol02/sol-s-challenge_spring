package springweb.a02_mvc.a03_dao;

import org.apache.ibatis.annotations.Insert;

import springweb.z01_vo.FileRep;
import springweb.z01_vo.Report;

public interface Z01_ReportDao {
	@Insert("insert into filerep values(#{no}, #{fname}, #{path}, sysdate, sysdate, #{etc})")
	int uploadFile(FileRep ins);
	
	@Insert("insert into report values(#{no}, #{report_name}, sysdate)")
	int InsertReport(Report ins);
}
