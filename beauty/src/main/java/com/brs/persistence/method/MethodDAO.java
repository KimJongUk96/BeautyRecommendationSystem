package com.brs.persistence.method;

import java.util.List;

import com.brs.domain.method.MethodVO;
import com.brs.domain.util.SearchCriteria;
 
public interface MethodDAO {
	 
	public Integer create(MethodVO mVO) throws Exception;
	
	public MethodVO readMethod(int methodNo)throws Exception;
	
	public Integer methodUpdate(MethodVO mVO) throws Exception;
	
	public void removeMethod(int methodNo) throws Exception;
	
	public List<MethodVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
