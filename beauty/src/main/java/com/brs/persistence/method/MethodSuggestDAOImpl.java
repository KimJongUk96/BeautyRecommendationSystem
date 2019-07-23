package com.brs.persistence.method;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.method.MethodDetailVO;
import com.brs.domain.method.MethodSuggestVO;
import com.brs.domain.util.MethodSuggestCriteria;

@Repository
public class MethodSuggestDAOImpl implements MethodSuggestDAO{
	
	@Inject
	private SqlSession session;
	private static String namespace = "com.brs.mapper.methodSuggestMapper";

	@Override
	public MethodSuggestVO read(int methodNo) throws Exception {
		return session.selectOne(namespace+".read", methodNo);
	}

	@Override
	public List<MethodDetailVO> listSearch(MethodSuggestCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int countPaging(MethodSuggestCriteria cri) throws Exception {
		return session.selectOne(namespace+".countPaging", cri);
	}

	@Override
	public List<MethodSuggestVO> search(MethodSuggestVO mVO) throws Exception {
		return session.selectList(namespace+".search", mVO);
				
	}


}
