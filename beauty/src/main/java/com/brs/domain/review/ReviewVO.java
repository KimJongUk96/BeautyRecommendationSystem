package com.brs.domain.review;

import java.util.Date;

/**
REVIEW_NO: NUMBER NOT NULL
RATING: NUMBER NOT NULL
REVIEW_TEXT: VARCHAR2(1000) NULL
COMMAND: CHAR(1) NOT NULL
REGDATE: DATE NULL
PROD_NO: NUMBER NOT NULL (FK)
EMAIL: VARCHAR2(100) NOT NULL (FK)
 */
 
public class ReviewVO {

	private int reviewNo;
	private int rating;
	private String reviewText;
	private String command;
	private Date regdate;
	private int prodNo;
	private String email;
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getCommand() {
		return command;
	}
	public void setCommand(String command) {
		this.command = command;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", rating=" + rating + ", reviewText=" + reviewText + ", command="
				+ command + ", regdate=" + regdate + ", prodNo=" + prodNo + ", email=" + email + "]";
	}
	
	
}
