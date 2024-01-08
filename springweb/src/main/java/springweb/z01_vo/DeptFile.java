package springweb.z01_vo;

import org.springframework.web.multipart.MultipartFile;

public class DeptFile {
	private int deptno;
	private String dname;
	private String loc;
	private MultipartFile[] reports;
	private String etc;
	
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public DeptFile() {
		// TODO Auto-generated constructor stub
	}
	public DeptFile(int deptno, String dname, String loc, MultipartFile[] reports) {
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
		this.reports = reports;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	
}
