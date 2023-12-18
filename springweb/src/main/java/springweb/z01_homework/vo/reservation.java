package springweb.z01_homework.vo;

// 식당의 ID, 예약 날짜 및 시간, 인원 수를 입력하여 예약을 할 수 있는 API
public class reservation {
	private String id;
	private String date;
	private String time;
	private int cnt;
	public reservation() {
		// TODO Auto-generated constructor stub
	}
	public reservation(String id, String date, String time, int cnt) {
		this.id = id;
		this.date = date;
		this.time = time;
		this.cnt = cnt;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
}
