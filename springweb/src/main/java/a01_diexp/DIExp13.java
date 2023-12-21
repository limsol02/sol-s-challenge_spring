package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.CarDriver;
import a01_diexp.z01_vo.HPUser;

public class DIExp13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di13.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		HPUser hu01 = ctx.getBean("hu01",HPUser.class);
		System.out.println("컨테이너의 객체 호출 : "+hu01);
		hu01.usePhone();
		
		CarDriver cd01= ctx.getBean("cd01",CarDriver.class);
		cd01.driving();
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
