package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class DIExp10 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di10.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Object obj = ctx.getBean("obj",Object.class);
		System.out.println("컨테이너의 객체 호출 : "+obj);
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
