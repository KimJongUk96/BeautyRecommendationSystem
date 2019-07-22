package com.brs.service.product;

import java.util.List;

import com.brs.domain.product.ProductVO;
import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.SearchCriteria;

public interface UserProductService {

	//세안제품 목록
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception;
	
	//세안 제품 목록 검색
	public int listSearchCount(SearchCriteria cri) throws Exception;

	//세안제품 상세보기
	public ProductVO read(int prodNo) throws Exception;
	
	//세안제품 리뷰 등록하기
	public void register(ReviewVO vo) throws Exception;
	
	//세안제품 리뷰 조회
	public List<ReviewVO> listReview(int prodNo) throws Exception;
}
