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
	    session.insert(namespace + ".regist", aVO);

	 }

	 @Override
	 public AdminVO read(int adminNo) throws Exception {
	    return session.selectOne(namespace + ".read", adminNo);
	 }

	 @Override
	 public void update(AdminVO aVO) throws Exception {
	    session.update(namespace + ".modify", aVO);
	 }

	 @Override
	 public void delete(int adminNo) throws Exception {
	    session.delete(namespace + ".delete", adminNo);

	 }


	 @Override
	 public List<AdminVO> listCriteria(SearchCriteria cri) throws Exception {
	    return session.selectList(namespace +".listCriteria", cri);
	    
	 }

	 @Override
	 public int countPaging(SearchCriteria cri) throws Exception {
	    return session.selectOne(namespace +".countPaging", cri);
	  
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