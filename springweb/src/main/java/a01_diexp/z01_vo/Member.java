package a01_diexp.z01_vo;
// frontweb.vo.Member
public class Member {
	// 유형, 컬럼명(소문자)

	private String id;
	private String pwd;

	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String id, String pwd) {
		this.id = id;
		this.pwd = pwd;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	
	public boolean success(String id, String pwd) {
		boolean isLog = false;
		if(id.equals("himan")&&pwd.equals("7777")) {
			isLog=true;			
		}
		return isLog;
	}
	

}
