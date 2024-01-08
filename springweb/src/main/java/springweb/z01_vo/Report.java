package springweb.z01_vo;

import java.util.Date;


public class Report {
	private int no;
	private String report_name;
	private Date report_regdte;
	public Report() {
		// TODO Auto-generated constructor stub
	}
	
	public Report(int no, String report_name) {
		this.no = no;
		this.report_name = report_name;
	}

	public Report(int no, String report_name, Date report_regdte) {
		this.no = no;
		this.report_name = report_name;
		this.report_regdte = report_regdte;
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
	
}
