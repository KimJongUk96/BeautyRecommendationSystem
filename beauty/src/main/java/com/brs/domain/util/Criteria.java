package com.brs.domain.util;

public class Criteria {
	
	private int page;
	private int perPageNum;  //페이지당 표시할 게시글의 수
	private int startPage;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getStartPage() {
		
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	 // method for MyBatis SQL Mapper -
	public int getPageEnd() {
		return this.startPage +9;
	}
	
	 // method for MyBatis SQL Mapper -
	public int getPageStart() {
		
		this.startPage = (this.page * perPageNum)-9;
		
		return this.startPage;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
		

}
