package springweb.a02_mvc.a03_dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

import springweb.z01_vo.Calendar;

public interface A07_CalendarDao {
	List<Calendar> getCalList();
	int insertCal(Calendar ins);
	int updateCalendar(Calendar upt);
	@Delete("delete from calendar where id = #{id}")
	int deleteCal(@Param("id") int id);
}
