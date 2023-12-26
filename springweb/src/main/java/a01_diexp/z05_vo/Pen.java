package a01_diexp.z05_vo;

import org.springframework.stereotype.Service;

@Service
public class Pen {
	private String color;
	private String type;
	private String mm;
	public Pen() {
		// TODO Auto-generated constructor stub
	}
	public Pen(String color, String type, String mm) {
		this.color = color;
		this.type = type;
		this.mm = mm;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMm() {
		return mm;
	}
	public void setMm(String mm) {
		this.mm = mm;
	}
	

}
