package springweb.z01_vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReportFile {
	private int no;
	private String report_name;
	private Date report_regdte;
	private MultipartFile[] reports;
	private String etc;
	public ReportFile() {
		// TODO Auto-generated constructor stub
	}
	public ReportFile(int no, String report_name, Date report_regdte, MultipartFile[] reports, String etc) {
		this.no = no;
		this.report_name = report_name;
		this.report_regdte = report_regdte;
		this.reports = reports;
		this.etc = etc;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
	}
	public Date getReport_regdte() {
		return report_regdte;
	}
	public void setReport_regdte(Date report_regdte) {
		this.report_regdte = report_regdte;
	}
	public MultipartFile[] getReports() {
		return reports;
	}
	public void setReports(MultipartFile[] reports) {
		this.reports = reports;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	
}
