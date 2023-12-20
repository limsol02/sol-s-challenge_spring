package springweb.a01_start.vo;
// frontweb.vo.Member
public class Member {
	// 유형, 컬럼명(소문자)
	private String id;
	private String pwd;
	private String name;
	private String auth;
	private String point;

	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	public Member(String id, String pwd, String name, String auth, String point) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.auth = auth;
		this.point = point;
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


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}
	
	
	public boolean success(String id, String pwd) {
		boolean isLog = false;
		if(!(id.equals("")&&pwd.equals(""))) {
			if(id.equals("himan")&&pwd.equals("7777")) {
				isLog=true;			
			}
		}
		
		return isLog;
	}
	
}
