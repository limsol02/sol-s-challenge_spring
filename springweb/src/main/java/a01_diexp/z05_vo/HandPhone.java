package a01_diexp.z05_vo;

import org.springframework.stereotype.Service;

@Service
public class HandPhone {
	private String pnumber;
	private String company;
	public HandPhone() {
		// TODO Auto-generated constructor stub
	}
	public HandPhone(String pnumber, String company) {
		this.pnumber = pnumber;
		this.company = company;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	
}
