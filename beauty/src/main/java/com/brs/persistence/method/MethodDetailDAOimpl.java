package com.brs.persistence.method;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.product.ProdTypeVO;
import com.brs.domain.product.ProductVO;
import com.brs.domain.util.SearchCriteria;

@Repository
public class MethodDetailDAOimpl implements MethodDetailDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.brs.mapper.methodMapper";
	
	@Override
	public void insert(MethodDetailVO mVO) throws Exception {
		session.insert(namespace+".insert", mVO);
		
	}
	@Override
	public void detailUpdate(MethodDetailVO mVO) throws Exception {
		session.update(namespace+".detailUpdate", mVO);
		
	}
	@Override
	public void detailRemove(int methodNo) throws Exception {
		session.selectOne(namespace+".detailRemove", methodNo);
	}
	@Override
	public List<ProductVO> prodList() throws Exception {
		return session.selectList(namespace+".prodList");
	}
	@Override
	public List<MethodDetailVO> readDetail(MethodDetailVO mVO) throws Exception {
		return session.selectList(namespace+".readDetail", mVO);
	}
}
