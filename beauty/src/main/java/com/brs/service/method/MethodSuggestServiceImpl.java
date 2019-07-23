package com.brs.service.method;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.util.MethodSuggestCriteria;
import com.brs.persistence.method.MethodSuggestDAO;

@Service
public class MethodSuggestServiceImpl implements MethodSuggestService{
	
	@Inject
	private MethodSuggestDAO mDao;

	@Override
	public MethodSuggestVO read(int methodNo) throws Exception {
		return mDao.read(methodNo);
	}

	@Override
	public List<MethodDetailVO> listSearch(MethodSuggestCriteria cri) throws Exception {
		return mDao.listSearch(cri);
	}

	@Override
	public int countPaging(MethodSuggestCriteria cri) throws Exception {
		return mDao.countPaging(cri);
	}

	@Override
	public List<MethodSuggestVO> search(MethodSuggestVO mVO) throws Exception {
		return mDao.search(mVO);
	}


}
