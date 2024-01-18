package springweb.a02_mvc.a03_dao;

import java.util.List;

import springweb.z01_vo.Calendar;

public interface A07_CalendarDao {
	List<Calendar> getCalList();
	int insertCal(Calendar ins);
}
