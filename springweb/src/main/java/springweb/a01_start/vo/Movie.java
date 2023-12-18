package springweb.a01_start.vo;

public class Movie {
	private String date;
	private String name;
	private int cnt;
	public Movie() {
		// TODO Auto-generated constructor stub
	}
	public Movie(String date, String name, int cnt) {
		this.date = date;
		this.name = name;
		this.cnt = cnt;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
