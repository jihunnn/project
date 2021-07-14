package com.project.simple.cart.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	
	private int memCartId;
	private String memId;
	private String productNum;
	private int productCnt;
	
	public int getmemCartId() {
		return memCartId;
	}
	public void setmemCartId(int memCartId) {
		this.memCartId = memCartId;
	}
	
	public String getmemId() {
		return memId;
	}
	public void setmemId(String memId) {
		this.memId = memId;
	}
	public String getproductNum() {
		return productNum;
	}
	public void setproductNum(String productNum) {
		this.productNum = productNum;
	}
	
	public int getproductCnt() {
		return productCnt;
	}
	public void setproductCnt(int productCnt) {
		this.productCnt = productCnt;
	}

}
