package com.brs.service.method;


import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.method.MethodVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.persistence.method.MethodDAO;

@Service
public class MethodServiceimpl implements MethodService{

	@Inject
	private MethodDAO mDAO;

	@Override
	public Integer create(MethodVO mVO) throws Exception {
		return mDAO.create(mVO);
	}
	
	@Override
	public MethodVO readMethod(int methodNo) throws Exception {
		return mDAO.readMethod(methodNo);
	}

	@Override
	public Integer methodUpdate(MethodVO mVO) throws Exception {
		return mDAO.methodUpdate(mVO);
		
	}

	@Override
	public void removeMethod(int methodNo) throws Exception {
		mDAO.removeMethod(methodNo);
	}

	@Override
	public List<MethodVO> listSearch(SearchCriteria cri) throws Exception {
		return mDAO.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return mDAO.listSearchCount(cri);
	}

}
