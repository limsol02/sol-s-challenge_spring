package a01_diexp.z05_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

//a01_diexp.z01_vo.HPUser
/*
호출 하는 곳은 controller, 호출되는 클래스는 service 설정
 * */

@Controller
public class HPUser {
	private String name;
	// 소스 내 코드를 컨테이너에 객체가 있드면 자동으로 할당처리할 수 있게 설정 처리옵션.
	// required = false : 없더라도 null 에러 방지 에러 방지 처리..
	@Autowired(required = false)
	private HandPhone handPhone;
	public HPUser() {
		// TODO Auto-generated constructor stub
	}
	public HPUser(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public HandPhone getHandPhone() {
		return handPhone;
	}
	public void setHandPhone(HandPhone handPhone) {
		this.handPhone = handPhone;
	}
	public void usePhone() {
		System.out.println("#핸드폰사용#");
		System.out.println("사용자 : "+name);
		if(handPhone!=null) {
			System.out.println("핸드폰을 사용합니다");
			System.out.println("#소유한 폰 정보#");
			System.out.println("폰번호:"+handPhone.getPnumber());
			System.out.println("통신사:"+handPhone.getCompany());
		}else {
			System.out.println("핸드폰 없음");
		}
	}
	public void setHp02(HandPhone handPhone) {
		this.handPhone = handPhone;
	}
	
}
