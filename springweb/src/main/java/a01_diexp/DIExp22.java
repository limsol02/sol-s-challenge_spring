package a01_diexp;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import a01_diexp.z05_vo.Car;
import a01_diexp.z05_vo.CarDriver;
import a01_diexp.z05_vo.HPUser;
import a01_diexp.z05_vo.HandPhone;
import a01_diexp.z05_vo.Note;
import a01_diexp.z05_vo.Pen;

public class DIExp22 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// 1. 컨테이너 경로설정 
		 String path = "a01_diexp\\di22.xml";
	      AbstractApplicationContext ctx =
	            new GenericXmlApplicationContext(path);
	      // 2. DL(Dependency Lookup) 객체를 찾는 처리
	      Car car = ctx.getBean("car", Car.class);
	      car.setKind("제네시스");
	      car.setCc("4000");
	      car.setMaxVel(250);
	      CarDriver carDriver = ctx.getBean("carDriver", CarDriver.class);
	      carDriver.setName("마길동");
	      //carDriver.setCar(car);
	      carDriver.driving();
	      HandPhone handPhone = ctx.getBean("handPhone", HandPhone.class);
	      handPhone.setCompany("SKT");
	      handPhone.setPnumber("01025412365");
	      HPUser hPUser = ctx.getBean("HPUser", HPUser.class);
	      hPUser.setName("김길동");
	      hPUser.usePhone();
		
	      
			Pen pen = ctx.getBean("pen",Pen.class);
			pen.setColor("빨간색");
			pen.setMm("3mm");
			pen.setType("유성매직");
			System.out.println(pen.getColor());
			
			Note note = ctx.getBean("note",Note.class);
			note.setPage("52page");
			note.writeNote();


		
		// 3. 자원해체
		ctx.close();
		System.out.println("종료!");
		
		
	}

}
