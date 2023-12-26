package a01_diexp.z04_vo;
 //a01_diexp.z01_vo.HPUser
public class HPUser {
	private String name;
	private HandPhone handPhone;
	public HPUser() {
		// TODO Auto-generated constructor stub
	}
	public HPUser(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public HandPhone getHandPhone() {
		return handPhone;
	}
	public void setHandPhone(HandPhone handPhone) {
		this.handPhone = handPhone;
	}
	public void usePhone() {
		System.out.println("#핸드폰사용#");
		System.out.println("사용자 : "+name);
		if(handPhone!=null) {
			System.out.println("핸드폰을 사용합니다");
			System.out.println("#소유한 폰 정보#");
			System.out.println("폰번호:"+handPhone.getPnumber());
			System.out.println("통신사:"+handPhone.getCompany());
		}else {
			System.out.println("핸드폰 없음");
		}
	}
	public void setHp02(HandPhone handPhone) {
		this.handPhone = handPhone;
	}
	
}
