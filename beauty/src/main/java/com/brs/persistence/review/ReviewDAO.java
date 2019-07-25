package com.brs.persistence.review;

import java.util.List;

import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.SearchCriteria;

public interface ReviewDAO {
	
	
	public List<ReviewVO> readProdReview(int prodNo) throws Exception;
	
	

}
