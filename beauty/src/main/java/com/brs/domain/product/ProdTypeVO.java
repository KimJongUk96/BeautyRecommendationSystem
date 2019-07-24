package com.brs.domain.product;
/**
PRODTYPE_NO: NUMBER NOT NULL
NAME: VARCHAR2(100) NOT NULL
REGDATE: DATE NULL
CATEGORY_NO: NUMBER() NOT NULL (FK
 */

import java.util.Date;

public class ProdTypeVO{
	private int prodtypeNo;
	private String name;
	private Date regdate;
	private int categoryNo;
	private String category;
	
	public int getProdtypeNo() {
		return prodtypeNo;
	}
	public void setProdtypeNo(int prodtypeNo) {
		this.prodtypeNo = prodtypeNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	@Override
	public String toString() {
		return "ProdTypeVO [prodtypeNo=" + prodtypeNo + ", name=" + name + ", regdate=" + regdate + ", categoryNo="
				+ categoryNo + ", category=" + category + "]";
	}
	
	
	
	
}
