package com.brs.service.method;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.util.MethodSuggestCriteria;
import com.brs.persistence.method.MethodSuggestDAO;

@Service
public class MethodSuggestServiceImpl implements MethodSuggestService{
	
	@Inject
	private MethodSuggestDAO mDao;

	@Override
	public List<MethodVO> read(MethodVO mVO) throws Exception {
		return mDao.read(mVO);
	}

	@Override
	public List<MethodVO> listCriteria(MethodSuggestCriteria cri) throws Exception {
		return mDao.listCriteria(cri);
	}

	@Override
	public int countPaging(MethodSuggestCriteria cri) throws Exception {
		return mDao.countPaging(cri);
	}

	@Override
	public List<MethodVO> search(MethodVO mVo) throws Exception {
		
		return mDao.search(mVo);
	}

}
