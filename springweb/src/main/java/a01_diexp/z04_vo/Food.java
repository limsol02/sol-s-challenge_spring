package a01_diexp.z04_vo;

import org.springframework.stereotype.Component;

@Component
public class Food {
	private String fname;
	private int price;
	private int cnt;
	public Food() {
		// TODO Auto-generated constructor stub
	}
	public Food(String fname, int price, int cnt) {
		this.fname = fname;
		this.price = price;
		this.cnt = cnt;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
