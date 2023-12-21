package a01_diexp.z01_vo;

import java.util.List;

public class OnDisk {
	private String name;
	private List<Member> mlist;
	public OnDisk() {
		// TODO Auto-generated constructor stub
	}
	public OnDisk(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Member> getMlist() {
		return mlist;
	}
	public void setMlist(List<Member> mlist) {
		this.mlist = mlist;
	}
	
	public void showMembers(){
		System.out.println("사이트이름 : "+name);
		if(mlist!=null&&mlist.size()>0) {
			for(Member mem : mlist) {
				System.out.print("이름 : "+mem.getName()+"\n");
				System.out.print("아이디 : "+mem.getId()+"\n");
				System.out.print("포인트 : "+mem.getPoint()+"\n");
			}
		}else {
			System.out.println("현재 사이트에는 등록된 사람이 없습니다. ");
		}
	}
}


