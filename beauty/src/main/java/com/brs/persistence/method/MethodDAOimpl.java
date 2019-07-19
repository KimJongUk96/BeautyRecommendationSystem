package com.brs.persistence.method;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.method.MethodVO;
import com.brs.domain.util.SearchCriteria;

@Repository
public class MethodDAOimpl implements MethodDAO{

	@Inject
	private SqlSession session;
	private static String namespace = "com.brs.mapper.methodMapper";
	
	@Override
	public Integer create(MethodVO mVO) throws Exception {
		session.insert(namespace+".create", mVO);
		
		return mVO.getMethodNo();
	}
	
	@Override
	public MethodVO readMethod(int methodNo) throws Exception {
		return session.selectOne(namespace+".readMethod", methodNo);
				
	}

	@Override
	public Integer methodUpdate(MethodVO mVO) throws Exception {
		session.selectOne(namespace+".methodUpdate", mVO);
		
		return mVO.getMethodNo();
	}

	@Override
	public void removeMethod(int methodNo) throws Exception {
		session.selectOne(namespace+".remove", methodNo);
	}

	@Override
	public List<MethodVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+".listSearchCount", cri);
	}

}
