package a01_diexp.z01_vo;

public class CarDriver {
	private String name;
	private Car car;
	public CarDriver() {
		// TODO Auto-generated constructor stub
	}
	public CarDriver(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public void driving() {
		if(car!=null) {
			System.out.println("#차량정보#");
			System.out.println("소유주 : "+name);
			System.out.println("차종 : "+car.getKind());
			System.out.println("cc : "+car.getCc());
			System.out.println("최고속력 : "+car.getMaxVel()+"Km");
			
		}else {
			System.out.println("소유한 차가 없습니다 ");
		}
	}
}
