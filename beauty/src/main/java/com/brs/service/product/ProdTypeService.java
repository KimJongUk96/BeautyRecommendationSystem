package com.brs.service.product;

import java.util.List;

import com.brs.domain.product.ProdTypeVO;
import com.brs.domain.util.Criteria;
import com.brs.domain.util.SearchCriteria;

public interface ProdTypeService {

	public void create(ProdTypeVO pVO) throws Exception;
	
	public void update(ProdTypeVO pVO) throws Exception;

	public void delete(int prodtypeNo) throws Exception;
	
	public ProdTypeVO read(int prodtypeNo) throws Exception;
	
	public List<ProdTypeVO> getAllType() throws Exception;

	public List<ProdTypeVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public String check(ProdTypeVO pVO) throws Exception;
}
