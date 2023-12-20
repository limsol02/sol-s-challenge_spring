package springweb.z01_homework;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import springweb.a01_start.vo.Member;
import springweb.z01_homework.vo.Account;
import springweb.z01_homework.vo.Car;



// springweb.z01_homework.A1219
@Controller
public class A1219 {
	@RequestMapping("homelogin.do")
	public String homelogin(Member m) { // 요청값 + 모델(member)
		return "WEB-INF\\views\\z01_homework\\1219.jsp";
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		String path = "springweb\\z01_homework\\di10.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(path);
		
		// 2. DL(Dependency Lookup) 객체를 찾는 처리
		Car car01= ctx.getBean("car01",Car.class);
		System.out.println(car01.getColor());
		System.out.println(car01.getBrand());
		System.out.println(car01.getYear());
	
		
		Account account01= ctx.getBean("account01",Account.class);
		System.out.println(account01.getBalance());
		System.out.println(account01.getDeposit());
		System.out.println(account01.getWithdraw());
		
		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}
	
}
