package com.brs.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.product.ProdTypeVO;
import com.brs.domain.util.Criteria;

@Repository
public class ProdTypeDAOImpl implements ProdTypeDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.brs.mapper.prodTypeMapper";
	
	@Override
	public void create(ProdTypeVO pVO) throws Exception {
		session.insert(namespace+".create", pVO);
		
	}

	@Override
	public void update(ProdTypeVO pVO) throws Exception {
		session.update(namespace+".update", pVO);
		
	}

	@Override
	public void delete(int prodtypeNo) throws Exception {
		session.delete(namespace+".delete", prodtypeNo);
		
	}

	@Override
	public List<ProdTypeVO> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public ProdTypeVO read(int prodtypeNo) throws Exception {
		return session.selectOne(namespace+".read", prodtypeNo);
	}

	@Override
	public String check(ProdTypeVO pVO) throws Exception {
		return session.selectOne(namespace+".check", pVO);
	}

	@Override
	public List<ProdTypeVO> getAllType() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace+".allType");
	}

	

}
