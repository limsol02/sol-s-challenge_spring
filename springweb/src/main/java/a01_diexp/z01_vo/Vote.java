package a01_diexp.z01_vo;

public class Vote {
	private int choice1;
	private String choice2;
	private String[] choice3;
	public Vote() {
		// TODO Auto-generated constructor stub
	}
	public Vote(int choice1, String choice2, String[] choice3) {
		this.choice1 = choice1;
		this.choice2 = choice2;
		this.choice3 = choice3;
	}

	public int getChoice1() {
		return choice1;
	}
	public void setChoice1(int choice1) {
		this.choice1 = choice1;
	}
	// 
	
	
	// option 0, 1, 2, 3
	//        chs[0], chs[1], chs[2], chs[3] 조건문 없이 처리가능..
	public String getChoice1Str() {
		String[] chs = {"선택없음","갑당 김주립","을당 강경책","정당 최고백"};
		return chs[this.choice1];
	}
	public String getChoice2() {
		return choice2;
	}
	public void setChoice2(String choice2) {
		this.choice2 = choice2;
	}
	public String[] getChoice3() {
		return choice3;
	}
	public void setChoice3(String[] choice3) {
		this.choice3 = choice3;
	}
	
}
