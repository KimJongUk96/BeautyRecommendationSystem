package com.brs.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.AdminVO;
import com.brs.domain.product.CategoryVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.dto.LoginDTO;

@Repository
public class AdminDAOImpl implements AdminDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.brs.mapper.adminMapper";
	
	
	@Override
	public void create(AdminVO aVO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public AdminVO read(int adminNo) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(AdminVO aVO) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int adminNo) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<AdminVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	//로그인
	@Override
	public AdminVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login", dto);
	}

	//기초 정보 등록
	@Override
	public void createCategory(CategoryVO cVO) throws Exception {
		session.insert(namespace + ".createCategory", cVO);
		
	}

}
