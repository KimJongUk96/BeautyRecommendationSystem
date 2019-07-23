package com.brs.domain.method;

import com.brs.domain.product.ProductVO;

/**
DETAIL_NO: NUMBER NOT NULL
STEP: NUMBER NOT NULL
METHOD_NO: NUMBER NOT NULL (FK)
METHOD: VARCHAR2(500) NOT NULL
PROD_NO: NUMBER NOT NULL (FK)

 */
public class MethodDetailVO extends ProductVO{

	private int detailNo;
	private int step;
	private int methodNo;
	private String method;
	private int prodNo;
	
	public int getDetailNo() {
		return detailNo;
	}
	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getMethodNo() {
		return methodNo;
	}
	public void setMethodNo(int methodNo) {
		this.methodNo = methodNo;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	
	@Override
	public String toString() {
		return "MethodDetailVO [detailNo=" + detailNo + ", step=" + step + ", methodNo=" + methodNo + ", method="
				+ method + ", prodNo=" + prodNo + "]";
	}
	

	
	

	
	
}
