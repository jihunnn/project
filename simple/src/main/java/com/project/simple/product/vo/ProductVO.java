package com.project.simple.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;

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
	private Date productDate;             //��ǰ ��ϳ�¥
	private String productContentImage;    //��ǰ ���̹���

	private int productOptionNum;      //��ǰ �ɼ� ��ȣ
	private String option1;            //��ǰ �ɼ�1
	private String option2;           //��ǰ �ɼ�2
	private String option1price;	//��ǰ �ɼ�1 ����
	private String option2price;	//��ǰ �ɼ�2 ���� 
	
	public ProductVO() {

	}
	public ProductVO(String productNum, String productName, String productPrice,String category, String subcategory,
			String productImage,String productManufacturer,String productOrigin,String productContentImage
			, int productOptionNum, String option1, String option2) {
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
		this.option1 = option1;
		this.option2 = option2;
	
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
	
	public String getoption2() {
		return option2;
	}
	public void setoption2(String option2) {
		this.option2 = option2;
	}
	
	public String getoption1() {
		return option1;
	}
	public void setoption1(String option1) {
		this.option1 = option1;
	}
	public String getoption2price() {
		return option2price;
	}
	public void setoption2price(String option2) {
		this.option2price = option2price;
	}
	
	public String getoption1price() {
		return option1price;
	}
	public void setoption1price(String option1) {
		this.option1price = option1price;
	}


}