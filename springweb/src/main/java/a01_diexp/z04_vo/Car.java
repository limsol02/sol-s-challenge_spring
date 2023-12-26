package a01_diexp.z04_vo;

public class Car {
	private String kind; 
	private String cc;
	private int maxVel;
	public Car() {
		// TODO Auto-generated constructor stub
	}
	public Car(String kind, String cc, int maxVel) {
		this.kind = kind;
		this.cc = cc;
		this.maxVel = maxVel;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public int getMaxVel() {
		return maxVel;
	}
	public void setMaxVel(int maxVel) {
		this.maxVel = maxVel;
	}

}
