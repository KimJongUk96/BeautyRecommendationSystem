package com.brs.service.review;

import java.util.List;

import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.SearchCriteria;

public interface ReviewService {

	public List<ReviewVO> readProdReview(int prodNo) throws Exception;
	
	public List<ReviewVO> getAllReview() throws Exception;
}
