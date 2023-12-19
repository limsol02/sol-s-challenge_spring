package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z01_vo.Food;
import a01_diexp.z01_vo.Person;
import a01_diexp.z01_vo.Product;

public class DIExp11 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di11.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Person p01 = ctx.getBean("p01",Person.class);
		System.out.println("컨테이너의 객체 호출 : "+p01);
		System.out.println(p01.getName());
		System.out.println(p01.getAge());
		System.out.println(p01.getLoc());
		
		Product prod01 = ctx.getBean("prod01",Product.class);
		System.out.println(prod01.getPname());
		System.out.println(prod01.getPrice());
		System.out.println(prod01.getCnt());
		
		Food food01 = ctx.getBean("food01",Food.class);
		System.out.println(food01.getFname());
		System.out.println(food01.getPrice());
		System.out.println(food01.getCnt());
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
