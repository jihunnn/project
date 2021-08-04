package com.project.simple.nonmember.vo;

import org.springframework.stereotype.Component;

@Component("nonmemberVO")
public class NonmemberVO {
	
	private int nonMemOrderSeqNum;         //��ȸ�� �ֹ� ��ǰ �Ϸ� ��ȣ
	private String productNum;             //��ǰ ��ȣ
	private int nonMemOrderNum;            //��ȸ�� �ֹ� ��ȣ
	private String nonMemName;             //��ȸ�� �ֹ���
	private String nonMemPwd;             //��ȸ�� �ֹ� ��й�ȣ
	private String nonEmail;             //��ȸ�� �̸���
	private String nonMemPhoneNum;             //��ȸ�� ��ȭ��ȣ
	private String nonMemSpName;             //��ȸ�� �޴� ���
	private String nonMemPhoneNum1;             //��ȸ�� �޴� ��� ��ȭ��ȣ1
	private String nonMemPhoneNum2;             //��ȸ�� �޴� ��� ��ȭ��ȣ2
	private String nonMemSpAdr;             //��ȸ�� �޴� ��� �ּ�
	private String nonMemOrderMsg;             //�ֹ� �޽���
	private String nonMemDepositorName;             //
	private String nonMemPaymentMethod;             //���� ���
	private int totalPrice;                   //�� ����
	private String nonMemOrderDate;             //�ֹ� ��¥
	private int productCnt;
	private String productPrice;
	private String productImage;
	private String currentStatus;
	private String productName;
	
	public NonmemberVO() {

	}
	public int getnonMemOrderSeqNum() {
		return nonMemOrderSeqNum;
	}
	public void setnonMemOrderSeqNum(int nonMemOrderSeqNum) {
		this.nonMemOrderSeqNum = nonMemOrderSeqNum;
	}
	public String getproductNum() {
		return productNum;
	}
	public void setproductNum(String productNum) {
		this.productNum = productNum;
	}
	public int getnonMemOrderNum() {
		return nonMemOrderNum;
	}
	public void setnonMemOrderNum(int nonMemOrderNum) {
		this.nonMemOrderNum = nonMemOrderNum;
	}
	public String getnonMemName() {
		return nonMemName;
	}
	public void setnonMemName(String nonMemName) {
		this.nonMemName = nonMemName;
	}
	public String getnonMemPwd() {
		return nonMemPwd;
	}
	public void setnonMemPwd(String nonMemPwd) {
		this.nonMemPwd = nonMemPwd;
	}
	public String getnonEmail() {
		return nonEmail;
	}
	public void setnonEmail(String nonEmail) {
		this.nonEmail = nonEmail;
	}
	public String getnonMemPhoneNum() {
		return nonMemPhoneNum;
	}
	public void setnonMemPhoneNum(String nonMemPhoneNum) {
		this.nonMemPhoneNum = nonMemPhoneNum;
	}
	public String getnonMemSpName() {
		return nonMemSpName;
	}
	public void setnonMemSpName(String nonMemSpName) {
		this.nonMemSpName = nonMemSpName;
	}
	public String getnonMemPhoneNum1() {
		return nonMemPhoneNum1;
	}
	public void setnonMemPhoneNum1(String nonMemPhoneNum1) {
		this.nonMemPhoneNum1 = nonMemPhoneNum1;
	}
	public String getnonMemPhoneNum2() {
		return nonMemPhoneNum2;
	}
	public void setnonMemPhoneNum2(String nonMemPhoneNum2) {
		this.nonMemPhoneNum2 = nonMemPhoneNum2;
	}
	public String getnonMemSpAdr() {
		return nonMemSpAdr;
	}
	public void setnonMemSpAdr(String nonMemSpAdr) {
		this.nonMemSpAdr = nonMemSpAdr;
	}
	public String getnonMemOrderMsg() {
		return nonMemOrderMsg;
	}
	public void setnonMemOrderMsg(String nonMemOrderMsg) {
		this.nonMemOrderMsg = nonMemOrderMsg;
	}
	public String getnonMemDepositorName() {
		return nonMemDepositorName;
	}
	public void setnonMemDepositorName(String nonMemDepositorName) {
		this.nonMemDepositorName = nonMemDepositorName;
	}
	public String getnonMemPaymentMethod() {
		return nonMemPaymentMethod;
	}
	public void setnonMemPaymentMethod(String nonMemPaymentMethod) {
		this.nonMemPaymentMethod = nonMemPaymentMethod;
	}
	public int gettotalPrice() {
		return totalPrice;
	}
	public void settotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getnonMemOrderDate() {
		return nonMemOrderDate;
	}
	public void setnonMemOrderDate(String nonMemOrderDate) {
		this.nonMemOrderDate = nonMemOrderDate;
	}
	public int getproductCnt() {
		return productCnt;
	}
	public void setproductCnt(int productCnt) {
		this.productCnt = productCnt;
	}
	public String getproductPrice() {
		return productPrice;
	}
	public void setproductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getproductImage() {
		return productImage;
	}
	public void setproductImage(String productImage) {
		this.productImage = productImage;
	}
	public String getcurrentStatus() {
		return currentStatus;
	}
	public void setcurrentStatus(String currentStatus) {
		this.currentStatus = currentStatus;
	}
	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	

}
