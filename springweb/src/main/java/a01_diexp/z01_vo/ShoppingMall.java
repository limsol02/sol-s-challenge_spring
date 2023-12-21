package a01_diexp.z01_vo;

import java.util.List;

public class ShoppingMall {
	private String name;
	private List<Product> plist;
	public ShoppingMall() {
		// TODO Auto-generated constructor stub
	}
	public ShoppingMall(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Product> getPlist() {
		return plist;
	}
	public void setPlist(List<Product> plist) {
		this.plist = plist;
	}
	public void showProductInfo() {
		System.out.println(name+"에서 파는 물건들!");
		if(plist!=null&&plist.size()>0) {
			for(Product prod : plist) {
				System.out.print(prod.getPname()+"\t");
				System.out.print(prod.getPrice()+"\t");
				System.out.print(prod.getCnt()+"\n");
			}
			System.out.println("총"+plist.size()+"개 판매");
		}else {
			System.out.println("판매하는 물건이 없습니다.");
		}
	}
	
}
