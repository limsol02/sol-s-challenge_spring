package a01_diexp.z01_vo;

import java.util.ArrayList;
import java.util.List;

public class z01_Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		HandPhone h01 = new HandPhone("010-5555-9999","SKT");
	    HPUser hu01 = new HPUser("홍길동");
		hu01.setHandPhone(h01);
		hu01.usePhone();
		
		List<Product> addList = new ArrayList<Product>();
		addList.add(new Product("사과",2000,2));
		addList.add(new Product("바나나",4000,5));
		addList.add(new Product("딸기",12000,3));
		addList.add(new Product("오렌지",2200,5));
		
		ShoppingMall sm = new ShoppingMall("온라인 쇼핑몰");
		sm.showProductInfo();
		sm.setPlist(addList);
		sm.showProductInfo();
	}

}
