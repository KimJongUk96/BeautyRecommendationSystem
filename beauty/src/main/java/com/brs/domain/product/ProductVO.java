package com.brs.domain.product;

import java.util.Date;

/**
PROD_NO: NUMBER NOT NULL
NAME: VARCHAR2(100) NOT NULL
CUS_GENDER: CHAR(2) NOT NULL
COMP_NAME: VARCHAR2(100) NULL
PRICE: VARCHAR2(15) NULL
LINK: VARCHAR2(200) NULL
IMG: VARCHAR2(300) NULL
REGDATE: DATE NULL
PRODTYPE_NO: NUMBER NOT NULL (FK)
ADMIN_NO: NUMBER NOT NULL (FK)

 */
public class ProductVO {
	private int prodNo;
	private String name;
	private String cusGender;
	private String compName;
	private String price;
	private String link;
	private String img;
	private Date regdate;
	private String prodtypeNo;
	private int adminNo;
	
	//�������
	private String ratingAvg;
	//��ǰŸ�� �̸�
	private String prodtypeName;
	//��ǰ ī�װ�
	private String categoryName;
	//카운트
	private String count;
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCusGender() {
		return cusGender;
	}
	public void setCusGender(String cusGender) {
		this.cusGender = cusGender;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getProdtypeNo() {
		return prodtypeNo;
	}
	public void setProdtypeNo(String prodtypeNo) {
		this.prodtypeNo = prodtypeNo;
	}
	public int getAdminNo() {
		return adminNo;
	}
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	public String getRatingAvg() {
		return ratingAvg;
	}
	public void setRatingAvg(String ratingAvg) {
		this.ratingAvg = ratingAvg;
	}
	public String getProdtypeName() {
		return prodtypeName;
	}
	public void setProdtypeName(String prodtypeName) {
		this.prodtypeName = prodtypeName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ProductVO [prodNo=" + prodNo + ", name=" + name + ", cusGender=" + cusGender + ", compName=" + compName
				+ ", price=" + price + ", link=" + link + ", img=" + img + ", regdate=" + regdate + ", prodtypeNo="
				+ prodtypeNo + ", adminNo=" + adminNo + ", ratingAvg=" + ratingAvg + ", prodtypeName=" + prodtypeName
				+ ", categoryName=" + categoryName + "]";
	}
	
	
	
}
