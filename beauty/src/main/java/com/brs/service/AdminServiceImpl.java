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

	@Override
	public AdminVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void registerCategory(CategoryVO cVO) throws Exception {
		dao.createCategory(cVO);
		
	}

}
