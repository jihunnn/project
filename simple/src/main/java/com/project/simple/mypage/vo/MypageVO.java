package com.project.simple.mypage.vo;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;


@Component("mypageVO")

public class MypageVO {
	//���������� �ֹ�/�����ȸ
	private int memOrderSeqNum;
	private int memOrderNum;
	private String memId;
	private String productNum;
	private String memSpName;
	private String memSpPhoneNum1;
	private String memSpPhoneNum2;
	private String memSpAdr;
	private String memOrderMsg;
	private String memDepositorName;
	private String memPaymentMethod;
	private String totalPrice;
	private Date memOrderDate;
	private int productCnt;
	private String productImage;
	private String option1;
	private String option2;
	private String productName;
	private String productPrice;
	private String deliveryStatus;


	
	
	//notice �Խ���
	public MypageVO() {
		System.out.println("ArticleVO ������");
	}
	
	public int getMemOrderSeqNum() {
		return memOrderSeqNum;
	}
	
	public void setMemOrderSeqNum(int memOrderSeqNum) {
		this.memOrderSeqNum = memOrderSeqNum;
	}
	
	public int getMemOrderNum() {
		return memOrderNum;
	}
	
	public void setMemOrderNum(int memOrderNum) {
		this.memOrderNum = memOrderNum;
	}
	
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
	
	public String getTotalPrice() {
		return totalPrice;
	}
	
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public Date getMemOrderDate() {
		return memOrderDate;
	}
	
	public void setMemOrderDate(Date memOrderDate) {
		this.memOrderDate = memOrderDate;
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
	
	public String getOption1() {
		return option1;
	}
	
	public void setOption1(String option1) {
		this.option1 = option1;
	}
	
	public String getOption2() {
		return option2;
	}
	
	public void setOption2(String option2) {
		this.option2 = option2;
	}
	
	public String getProductName() {
		return productName;
	}
	
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	public String getProductPrice() {
		return productPrice;
	}
	
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	
	public String getDeliveryStatus() {
		return deliveryStatus;
	}
	
	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	

	
}
