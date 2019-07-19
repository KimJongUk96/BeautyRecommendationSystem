package com.brs.persistence.product;

import com.brs.domain.product.CategoryVO;

public interface CategoryDAO {

	public void create(CategoryVO cVO) throws Exception;
	
	public void delete(int categoryNo) throws Exception;
	
}
