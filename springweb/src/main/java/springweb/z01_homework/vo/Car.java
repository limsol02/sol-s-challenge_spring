package springweb.z01_homework.vo;

public class Car {
//color, brand, year
	private String color;
	private String brand;
	private String year;
	public Car() {
		// TODO Auto-generated constructor stub
	}
	public Car(String color, String brand, String year) {
		this.color = color;
		this.brand = brand;
		this.year = year;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	

}
