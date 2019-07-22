package com.brs.persistence.method;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.method.MethodVO;
import com.brs.domain.util.MethodSuggestCriteria;

@Repository
public class MethodSuggestDAOImpl implements MethodSuggestDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.brs.mapper.methodSuggestMapper";

	@Override
	public List<MethodVO> read(MethodVO mVO) throws Exception {
		return session.selectList(namespace+".read", mVO);
	}

	@Override
	public List<MethodVO> listCriteria(MethodSuggestCriteria cri) throws Exception {
		return session.selectList(namespace+".listCriteria", cri);
	}

	@Override
	public int countPaging(MethodSuggestCriteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<MethodVO> search(MethodVO mVo) throws Exception {
		
		return session.selectList(namespace+".search", mVo);
	}

}
