package com.brs.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.persistence.product.ProductDAO;


@Repository
public class ProductServiceImpl implements ProductService {
	
	@Inject
	private ProductDAO dao;
	

	@Override
	public void create(ProductVO pVO) throws Exception {
		System.out.println(pVO.toString());
		dao.create(pVO);
	}

	@Override
	public ProductVO read(int prodNo) throws Exception {
		return dao.read(prodNo);
	}

	@Override
	public void update(ProductVO pVO) throws Exception {
		//System.out.println(pVO.toString());
		dao.update(pVO);
	}

	@Override
	public void delete(int prodNo) throws Exception {
		dao.delete(prodNo);
	}

	@Override
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
