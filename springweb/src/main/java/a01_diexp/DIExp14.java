package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.OnDisk;
import a01_diexp.z01_vo.ShoppingMall;

public class DIExp14 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di14.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		ShoppingMall sm01= ctx.getBean("sm01",ShoppingMall.class);
		System.out.println("컨테이너의 객체 호출 : "+sm01);
		sm01.showProductInfo();
		
		OnDisk od01 = ctx.getBean("od01",OnDisk.class);
		od01.showMembers();
		
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
