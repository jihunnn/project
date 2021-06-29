package com.project.simple.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;


import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {

	private String productNum;            //��ǰ ��ȣ
	private String productName;           //��ǰ �̸�
	private String productPrice;         //��ǰ ����
	private String category;              //��ǰ �з�	`
	private String subcategory;           //��ǰ �󼼺з�
	private String productImage;          //��ǰ �̹���
	private String productManufacturer;   //��ǰ ������
	private String productOrigin;         //��ǰ ������
	private String categoryCode;
	
	public ProductVO() {

	}
	public ProductVO(String productNum, String productName, String productPrice,String category, String subcategory,
			String productImage,String productManufacturer,String productOrigin,String categoryCode) {
		this.productNum = productNum;
		this.productName = productName;
		this.productPrice = productPrice;
		this.category = category;
		this.subcategory = subcategory;
		this.productImage = productImage;
		this.productManufacturer = productManufacturer;
		this.productOrigin = productOrigin;
		this.categoryCode = categoryCode;
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
	
	public String getcategoryCode() {
		return categoryCode;
	}
	public void setcategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}


}
