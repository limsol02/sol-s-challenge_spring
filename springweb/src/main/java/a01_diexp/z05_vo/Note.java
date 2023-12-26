package a01_diexp.z05_vo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class Note {
	private String page;
	@Autowired(required = false)
	private Pen pen;
	
	public Note() {
		// TODO Auto-generated constructor stub
	}
	public Note(String page) {
		this.page = page;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public Pen getPen() {
		return pen;
	}
	public void setPen(Pen pen) {
		this.pen = pen;
	}
	public void setPen03(Pen pen) {
		this.pen = pen;
	}
	public void writeNote() {
		if(pen!=null) {
			System.out.println("##노트정보##");
			System.out.println(page+"에");
			System.out.println(pen.getColor()+"색인");
			System.out.println(pen.getMm()+"의");
			System.out.println(pen.getType()+"으로");
			System.out.println("이름을 씁니다.");
		}else {
			System.out.println("노트없음");
		}
	}
}
