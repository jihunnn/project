package com.project.simple.order.vo;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;


@Component("orderVO")

public class OrderVO {
	//주문페이지
	private String memId;
	private String productNum;
	private String productName;
	private String memName;
	private String memAdr;
	private String memPhoneNum;
	private String memSpName;
	private String memSpPhoneNum1;
	private String memSpPhoneNum2;
	private String memSpAdr;
	private String memOrderMsg;
	private String memDepositorName;
	private String memPaymentMethod;
	private String option1value;
	private String option2value;
	private int totalPrice;
	private int productCnt;
	private String productImage;
	private String purchaseConfirm;
	private String returnConfirm;
	private String reviewConfirm;
	private String deliverycharge;
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getproductName() {
		return productName;
	}
	public void setproductName(String productName) {
		this.productName = productName;
	}
	public String getProductNum() {
		return productNum;
	}
	public void setProductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemAdr() {
		return memAdr;
	}
	public void setMemAdr(String memAdr) {
		this.memAdr = memAdr;
	}
	public String getMemPhoneNum() {
		return memPhoneNum;
	}
	public void setMemPhoneNum(String memPhoneNum) {
		this.memPhoneNum = memPhoneNum;
	}
	public String getMemSpName() {
		return memSpName;
	}
	public void setMemSpName(String memSpName) {
		this.memSpName = memSpName;
	}
	public String getMemSpPhoneNum1() {
		return memSpPhoneNum1;
	}
	public void setMemSpPhoneNum1(String memSpPhoneNum1) {
		this.memSpPhoneNum1 = memSpPhoneNum1;
	}
	public String getMemSpPhoneNum2() {
		return memSpPhoneNum2;
	}
	public void setMemSpPhoneNum2(String memSpPhoneNum2) {
		this.memSpPhoneNum2 = memSpPhoneNum2;
	}
	public String getMemSpAdr() {
		return memSpAdr;
	}
	public void setMemSpAdr(String memSpAdr) {
		this.memSpAdr = memSpAdr;
	}
	public String getMemOrderMsg() {
		return memOrderMsg;
	}
	public void setMemOrderMsg(String memOrderMsg) {
		this.memOrderMsg = memOrderMsg;
	}
	public String getMemDepositorName() {
		return memDepositorName;
	}
	public void setMemDepositorName(String memDepositorName) {
		this.memDepositorName = memDepositorName;
	}
	public String getMemPaymentMethod() {
		return memPaymentMethod;
	}
	public void setMemPaymentMethod(String memPaymentMethod) {
		this.memPaymentMethod = memPaymentMethod;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getProductCnt() {
		return productCnt;
	}
	public void setProductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getProductImage() {
		return productImage;
	}
	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getPurchaseConfirm() {
		return purchaseConfirm;
	}
	public void setPurchaseConfirm(String purchaseConfirm) {
		this.purchaseConfirm = purchaseConfirm;
	}
	public String getReturnConfirm() {
		return returnConfirm;
	}
	public void setReturnConfirm(String returnConfirm) {
		this.returnConfirm = returnConfirm;
	}
	public String getReviewConfirm() {
		return reviewConfirm;
	}
	public void setReviewConfirm(String reviewConfirm) {
		this.reviewConfirm = reviewConfirm;
	}
	
	public String getdeliverycharge() {
		return deliverycharge;
	}
	public void setdeliverycharge(String deliverycharge) {
		this.deliverycharge = deliverycharge;
	}
	
	public String getoption1value() {
		return option1value;
	}
	public void setoption1value(String option1value) {
		this.option1value = option1value;
	}
	
	public String getoption2value() {
		return option2value;
	}
	public void setoption2value(String option2value) {
		this.option2value = option2value;
	}
	
}

