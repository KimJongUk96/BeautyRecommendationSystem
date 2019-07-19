package com.brs.service.review;

import java.util.List;

import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.SearchCriteria;

public interface ReviewService {

	public void create(ReviewVO rVO) throws Exception;
	
	public ReviewVO read(int reviewNo) throws Exception;
	
	public void update(ReviewVO rVO) throws Exception;
	
	public void delete(int reviewNo) throws Exception;
	
	public List<ReviewVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
