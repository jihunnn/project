package com.project.simple.cart.vo;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	
	private String memId;
	private String productNum;
	private int productCnt;
	private String productName;
	private String option1name;
	private String option1value;
	private String option2name;
	private String option2value;
	private int totalPrice;
	private String productimage;
	private String deliverycharge;
	private int memCartId;
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOption1name() {
		return option1name;
	}
	public void setOption1name(String option1name) {
		this.option1name = option1name;
	}
	public String getOption1value() {
		return option1value;
	}
	public void setOption1value(String option1value) {
		this.option1value = option1value;
	}
	public String getOption2name() {
		return option2name;
	}
	public void setOption2name(String option2name) {
		this.option2name = option2name;
	}
	public String getOption2value() {
		return option2value;
	}
	public void setOption2value(String option2value) {
		this.option2value = option2value;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getProductimage() {
		return productimage;
	}
	public void setProductimage(String productimage) {
		this.productimage = productimage;
	}
	public String getDeliverycharge() {
		return deliverycharge;
	}
	public void setDeliverycharge(String deliverycharge) {
		this.deliverycharge = deliverycharge;
	}
	public int getMemCartId() {
		return memCartId;
	}
	public void setMemCartId(int memCartId) {
		this.memCartId = memCartId;
	}
	

}
