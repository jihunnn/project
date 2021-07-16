package com.project.simple.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {

	private String productNum;            //상품 번호
	private String productName;           //상품 이름
	private String productPrice;         //상품 가격
	private String category;              //상품 분류	`
	private String subcategory;           //상품 상세분류
	private String productImage;          //상품 이미지
	private String productManufacturer;   //상품 제조사
	private String productOrigin;         //상품 원산지
	private Date productDate;             //상품 등록날짜
	private String productContentImage;    //상품 상세이미지

	private int productOptionNum;      //상품 옵션 번호
	private String option1name;            //상품 옵션1
	private String option2name;           //상품 옵션2
	private int option1price;	//상품 옵션1 가격
	private int option2price;	//상품 옵션2 가격
	private String option1value; //옵션1 목록
	private String option2value; //옵션2 목록
	
	public ProductVO() {

	}
	public ProductVO(String productNum, String productName, String productPrice,String category, String subcategory,
			String productImage,String productManufacturer,String productOrigin,String productContentImage
			, int productOptionNum, String option1name, String option2name) {
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.category = category;
		this.subcategory = subcategory;
		this.productImage = productImage;
		this.productManufacturer = productManufacturer;
		this.productOrigin = productOrigin;
		this.productContentImage = productContentImage;
		this.productOptionNum = productOptionNum;
		this.option1name = option1name;
		this.option2name = option2name;
	
	}
	public String getproductNum() {
		return productNum;
	}
	public void setproductNum(String productNum) {
		this.productNum = productNum;
	}
	public String getproductName() {
		return productName;
	}
	public void setproductName(String productName) {
		this.productName = productName;
	}

	public String getproductPrice() {
		return productPrice;
	}
	public void setproductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getsubcategory() {
		return subcategory;
	}
	public void setsubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	public String getproductImage() {
		try {
			if(productImage != null & productImage.length() !=0) {
				productImage = URLDecoder.decode(productImage, "utf-8");
			}
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			} 
			return productImage;
	}
	public void setproductImage(String productImage) {
		try {
			if(productImage != null && productImage.length() !=0) {
				this.productImage = URLEncoder.encode(productImage, "utf-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}

	public String getproductManufacturer() {
		return productManufacturer;
	}
	public void setproductManufacturer(String productManufacturer) {
		this.productManufacturer = productManufacturer;
	}
	public String getproductOrigin() {
		return productOrigin;
	}
	public void setproductOrigin(String productOrigin) {
		this.productOrigin = productOrigin;
	}
	
	public Date getproductDate() {
		return productDate;
	}
	public void setproductDate(Date productDate) {
		this.productDate = productDate;
	}
	public String getproductContentImage() {
		return productContentImage;
	}
	public void setproductContentImage(String productContentImage) {
		this.productContentImage = productContentImage;
	}
	
	public int getproductOptionNum() {
		return productOptionNum;
	}
	public void setproductOptionNum(int productOptionNum) {
		this.productOptionNum = productOptionNum;
	}
	
	public String getoption2name() {
		return option2name;
	}
	public void setoption2name(String option2name) {
		this.option2name = option2name;
	}
	
	public String getoption1name() {
		return option1name;
	}
	public void setoption1name(String option1name) {
		this.option1name = option1name;
	}
	public int getoption2price() {
		return option2price;
	}
	public void setoption2price(int option2price) {
		this.option2price = option2price;
	}
	
	public int getoption1price() {
		return option1price;
	}
	public void setoption1price(int option1price) {
		this.option1price = option1price;
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