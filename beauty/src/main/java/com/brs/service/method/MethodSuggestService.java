package com.brs.service.method;

import java.util.List;

import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.util.MethodSuggestCriteria;

public interface MethodSuggestService {
	
	public List<MethodVO> read(MethodVO mVO) throws Exception;
	
	public List<MethodVO> listCriteria(MethodSuggestCriteria cri) throws Exception;
	
	public int countPaging(MethodSuggestCriteria cri) throws Exception;
	
	public List<MethodVO> search(MethodVO mVo) throws Exception;

}
