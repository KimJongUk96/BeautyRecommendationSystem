package com.brs.service.product;

import java.util.List;

import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;

public interface ProductService {

	public void create(ProductVO pVO) throws Exception;
	
	public ProductVO read(int prodNo) throws Exception;
	
	public void update(ProductVO pVO) throws Exception;
	
	public void delete(int prodNo) throws Exception;
	
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
