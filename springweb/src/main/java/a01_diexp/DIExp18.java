package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.CarDriver;
import a01_diexp.z01_vo.HPUser;

public class DIExp18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di18.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		CarDriver carDri01 = ctx.getBean("carDri01",CarDriver.class);
		System.out.println("컨테이너의 객체 호출 : "+carDri01);
		carDri01.driving();
		
		HPUser hpu01 = ctx.getBean("hpu01",HPUser.class);
		hpu01.usePhone();
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
	}

}


