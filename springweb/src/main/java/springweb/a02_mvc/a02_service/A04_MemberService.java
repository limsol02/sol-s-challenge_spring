package springweb.a02_mvc.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.A04_MemberDao;
import springweb.z01_vo.Member;
@Service
public class A04_MemberService {
	@Autowired(required = false)
	private A04_MemberDao dao; 
	
	public Member login(Member sch) {
		return dao.login(sch);
	}
}
