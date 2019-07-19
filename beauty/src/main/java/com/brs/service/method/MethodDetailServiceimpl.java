package com.brs.service.method;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.product.ProductVO;
import com.brs.persistence.method.MethodDetailDAO;

@Service
public class MethodDetailServiceimpl implements MethodDetailService{
	
	
	@Inject
	private MethodDetailDAO mDAO;
	
	@Override
	public void insert(MethodDetailVO mVO) throws Exception {
	    mDAO.insert(mVO);

	}

	@Override
	public void detailUpdate(MethodDetailVO mVO) throws Exception {
		mDAO.detailUpdate(mVO);
		
	}

	@Override
	public void detailRemove(int methodNo) throws Exception {
		mDAO.detailRemove(methodNo);
	}

	@Override
	public List<ProductVO> prodList() throws Exception {
		return mDAO.prodList();
	}

	@Override
	public List<MethodDetailVO> readDetail(MethodDetailVO mVO) throws Exception {
		return mDAO.readDetail(mVO);
	}

}
