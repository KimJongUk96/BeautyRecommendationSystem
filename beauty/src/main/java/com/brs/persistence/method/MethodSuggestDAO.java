package com.brs.persistence.method;

import java.util.List;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.util.MethodSuggestCriteria;


public interface MethodSuggestDAO {
	
	public MethodSuggestVO read(int methodNo) throws Exception;
	
	public List<MethodDetailVO> listSearch(MethodSuggestCriteria cri) throws Exception;
	
	public int countPaging(MethodSuggestCriteria cri) throws Exception;
	
	public List<MethodSuggestVO> search(MethodSuggestVO mVO) throws Exception;
	
	
}
