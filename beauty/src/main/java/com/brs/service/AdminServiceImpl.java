package com.brs.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.AdminVO;
import com.brs.domain.product.CategoryVO;
import com.brs.domain.util.SearchCriteria;
import com.brs.dto.LoginDTO;
import com.brs.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO dao;
	
	@Override
	   public void regist(AdminVO aVO) throws Exception {
	      dao.create(aVO);

	   }

	   @Override
	   public AdminVO read(int adminNo) throws Exception {
	      return dao.read(adminNo);

	   }

	   @Override
	   public void modify(AdminVO aVO) throws Exception {
	      dao.update(aVO);

	   }

	   @Override
	   public void remove(int adminNo) throws Exception {
	      dao.delete(adminNo);

	   }

	   @Override
	   public List<AdminVO> listCriteria(SearchCriteria cri) throws Exception {
	      return dao.listCriteria(cri);
	   }

	   @Override
	   public int listCountCriteria(SearchCriteria cri) throws Exception {
	      return dao.countPaging(cri);
	   }

	   //로그인
	   @Override
	   public AdminVO login(LoginDTO dto) throws Exception {
		   return dao.login(dto);
	   }
	   
	   //카테고리 등록
	   @Override
	   public void registerCategory(CategoryVO cVO) throws Exception {
		   dao.createCategory(cVO);
		
	   }

}