package com.brs.service.product;

import com.brs.domain.product.CategoryVO;

public interface CategoryService {

	public void create(CategoryVO cVO) throws Exception;
	
	public void delete(int categoryNo) throws Exception;
}
