package com.brs.domain.product;
/**
CATEGORY_NO: NUMBER() NOT NULL
CATEGORY_NAME: VARCHAR2(50) NOT NULL
 */
public class CategoryVO {

	private int categoryNo;
	private String categoryName;
	
	public int getCategoryNo() {
		return categoryNo;
	}
	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "CategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}
	
	
}
