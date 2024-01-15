package springweb.z01_vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

// board.vo.Board : 리스트출력 / 둥록/ 수정
public class Board {
	private int cnt;
	private int no;
	private int refno;
	private String title;
	private String content;
	private String writer;
	private Date regdte;  // 화면에서 String
	private Date uptdte;  // 화면에서 String
	private int readcnt;
	private MultipartFile[] reports;
	private int level;
	// 클라이언트에서 서버로 업로드되는 파일을 받는 객체
	private List<String> fnames;
	// DB에서 등록된 파일명을 가져올때 사용
	public Board() {
		// TODO Auto-generated constructor stub
	}
	public Board(int no, int refno, String title, String content, String writer, Date regdte, Date uptdte,
			int readcnt) {
		this.no = no;
		this.refno = refno;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdte = regdte;
		this.uptdte = uptdte;
		this.readcnt = readcnt;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefno() {
		return refno;
	}
	public void setRefno(int refno) {
		this.refno = refno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdte() {
		return regdte;
	}
	public void setRegdte(Date regdte) {
		this.regdte = regdte;
	}
	public Date getUptdte() {
		return uptdte;
	}
	public void setUptdte(Date uptdte) {
		this.uptdte = uptdte;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	public List<String> getFnames() {
		return fnames;
	}
	public void setFnames(List<String> fnames) {
		this.fnames = fnames;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	

}
