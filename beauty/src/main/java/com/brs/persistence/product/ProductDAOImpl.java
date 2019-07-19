package com.brs.persistence.product;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;


@Repository
public class ProductDAOImpl implements ProductDAO  {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.brs.mapper.ProductMapper";

	@Override
	public void create(ProductVO pVO) throws Exception {
		session.insert(namespace + ".create", pVO);
	}

	@Override
	public ProductVO read(int prodNo) throws Exception {
		return session.selectOne(namespace + ".read", prodNo);
	}

	@Override
	public void update(ProductVO pVO) throws Exception {
		session.update(namespace + ".update", pVO);
	}

	@Override
	public void delete(int prodNo) throws Exception {
		session.delete(namespace + ".delete", prodNo);
	}

	@Override
	public List<ProductVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
	
}
