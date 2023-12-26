package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z02_vo.Person;
import a01_diexp.z02_vo.Product;
import a01_diexp.z04_vo.Food;

public class DIExp19 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "a01_diexp\\di19.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Product prod = ctx.getBean("prod",Product.class);
		System.out.println("컨테이너의 객체 호출 : "+prod);
		prod.setPname("사과");
		
		Person person = ctx.getBean("person",Person.class);
		person.setName("홍길동");
		
		System.out.println(prod.getPname());
		System.out.println(person.getName());
		
		Food food = ctx.getBean("food",Food.class);
		food.setFname("청포도 사탕");
		System.out.println(food.getFname());
		/*
		annotation으로 Component 라고 선언되어 있어야 함..
		Car car = ctx.getBean("car",Car.class);
		System.out.println("컨테이너 객체 호출 : "+ car ); ==> 에러발생
		
		 * 
		 * */
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
