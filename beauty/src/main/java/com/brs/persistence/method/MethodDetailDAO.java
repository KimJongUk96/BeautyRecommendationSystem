package com.brs.persistence.method;

import java.util.List;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.product.ProductVO;

public interface MethodDetailDAO {
	
	public void insert(MethodDetailVO mVO) throws Exception;
	
	public void detailUpdate(MethodDetailVO mVO) throws Exception;
	
	public void detailRemove(int methodNo) throws Exception;
	
	public List<MethodDetailVO> readDetail(MethodDetailVO mVO) throws Exception;
	
	public List<ProductVO> prodList() throws Exception;
	

}
