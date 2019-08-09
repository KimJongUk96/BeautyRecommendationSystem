package com.brs.service.review;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.brs.domain.review.ReviewVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.persistence.review.ReviewDAO;


@Repository
public class ReviewServiceImpl implements ReviewService{
	
	@Inject
	private ReviewDAO dao;

	@Override
	public List<ReviewVO> readProdReview(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		return dao.readProdReview(prodNo);
	}

}
