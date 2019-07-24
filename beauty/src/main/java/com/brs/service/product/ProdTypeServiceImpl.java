package com.brs.service.product;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.product.ProdTypeVO;
import com.brs.domain.util.Criteria;
import com.brs.persistence.product.ProdTypeDAO;

@Service
public class ProdTypeServiceImpl implements ProdTypeService{
	
	@Inject
	private ProdTypeDAO pDao;

	@Override
	public void create(ProdTypeVO pVO) throws Exception {
		pDao.create(pVO);
	}

	@Override
	public void update(ProdTypeVO pVO) throws Exception {
		pDao.update(pVO);
	}

	@Override
	public void delete(int prodtypeNo) throws Exception {
		pDao.delete(prodtypeNo);
	}

	@Override
	public List<ProdTypeVO> listCriteria(Criteria cri) throws Exception {
		return pDao.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return pDao.countPaging(cri);
	}

	@Override
	public ProdTypeVO read(int prodtypeNo) throws Exception {
		return pDao.read(prodtypeNo);
	}

	@Override
	public String check(ProdTypeVO pVO) throws Exception {
		return pDao.check(pVO);
		
	}

	@Override
	public List<ProdTypeVO> getAllType() throws Exception {
		// TODO Auto-generated method stub
		return pDao.getAllType();
	}



}
