package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z04_vo.Member;
import a01_diexp.z04_vo.Food;

public class DIExp21 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di21.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Food food = ctx.getBean("food",Food.class);
		System.out.println("컨테이너의 객체 호출 : "+food);
		food.setFname("순댓국");
		
		Member member = ctx.getBean("member", Member.class);
		member.setName("홍길동");
		
	
		
		System.out.println(food.getFname());
		System.out.println(member.getName());
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
