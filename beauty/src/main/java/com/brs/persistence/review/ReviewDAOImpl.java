package com.brs.persistence.review;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.review.ReviewVO;


@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.brs.mapper.ReviewMapper";

	@Override
	public List<ReviewVO> readProdReview(int prodNo) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(prodNo);
		System.out.println("DAO Array Size : " + session.selectList(namespace + ".read", prodNo).size());
		return session.selectList(namespace + ".read", prodNo);
	}

}
