package com.brs.persistence.product;

import java.util.List;

import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;

public interface UserProductDAO {

	//세안제품 목록
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception;
	
	//세안 제품 목록 검색
	public int listSearchCount(SearchCriteria cri) throws Exception;

	//세안제품 상세보기
	public ProductVO read(int prodNo) throws Exception;
	
	
	
}
