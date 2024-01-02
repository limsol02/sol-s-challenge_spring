package springweb.a02_mvc.a02_service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springweb.a02_mvc.a03_dao.Z01_Dao;
import springweb.z01_vo.Member;

@Service
public class Z01_MemberService {

	@Autowired(required =false)
	private Z01_Dao dao02;
	
	public boolean getLogin(Member m){
		if(m.getId()==null) m.setId("");
		if(m.getPwd()==null) m.setPwd("");
		
		boolean isSuc = false;
		
		if(dao02.login(new Member("himan","7777"))==1) {			
			System.out.println("로그인 성공" );
			isSuc = true;
		}else {
			System.out.println("로그인 실패");
			isSuc = false;
		}
		
		System.out.println("등록한 데이터 건수 : "+dao02.insertMem(new Member(22,"임솔","dlathf","1515","대표",200)));
		
		for(Member m01 : dao02.schMember("홍길동")) {
			System.out.println(m01.getId()+"\t");
			System.out.println(m01.getMno()+"\t");
			System.out.println(m01.getAuth()+"\n");
		}

		return isSuc;
	}

}
