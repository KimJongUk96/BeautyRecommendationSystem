package com.brs.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.persistence.product.UserProductDAO;
@Repository
public class UserProductServiceImpl implements UserProductService {

	@Inject
	private UserProductDAO dao;
	
	//세안제품 목록
	@Override
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	//세안 제품 목록 검색
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

	//세안제품 상세보기
	@Override
	public ProductVO read(int prodNo) throws Exception {
		return dao.read(prodNo);
	}

}
