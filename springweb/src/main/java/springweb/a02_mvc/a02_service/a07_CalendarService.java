package springweb.a02_mvc.a02_service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A07_CalendarDao;
import springweb.z01_vo.Calendar;

@Service
public class a07_CalendarService {
	@Autowired(required = false)
	private A07_CalendarDao dao;
	
	public List<Calendar> getCalList(){
		return dao.getCalList();
	}
	
	public String insertCalendar(Calendar ins) {
		return dao.insertCal(ins)>0?"등록성공":"등록실패";
	}
	
	public String updateCalendar(Calendar upt) {
		return dao.updateCalendar(upt)>0?"수정성공":"수정실패";
	}
	
	public String deleteCal(int id) {
		return dao.deleteCal(id)>0?"삭제성공":"삭제실패";
	}
	
	
}
