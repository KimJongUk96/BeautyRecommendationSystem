package com.brs.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.brs.domain.UserVO;
import com.brs.dto.LoginDTO;
import com.brs.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {

	@Inject
	private UserDAO dao;
	
	
	//로그인
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}


	//비밀번호 찾기
	@Override
	public String forgetpw(String email) throws Exception {
		return dao.forgetpw(email);
	}
	
	
	//회원가입
	@Override
	public void regist(UserVO vo) throws Exception {
		dao.create(vo);
	}

	
	//아이디 중복 체크
	@Override
	public int checkid(String email) throws Exception {
		return dao.checkid(email);
	}
	
	
	//비밀번호 확인
	@Override
	public String checkpw(UserVO vo) throws Exception {
		return dao.checkpw(vo);
	}

	
	//내 정보 상세 조회
	@Override
	public UserVO read(String email) throws Exception {
		return dao.read(email);
	}
	
	
	//내 정보 수정
	@Override
	public void modify(UserVO vo) throws Exception {
		dao.update(vo);
	}

}
