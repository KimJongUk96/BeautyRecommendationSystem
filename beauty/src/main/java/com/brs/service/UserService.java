package com.brs.service;

import com.brs.domain.UserVO;
import com.brs.dto.LoginDTO;

public interface UserService {

	//로그인
	public UserVO login(LoginDTO dto) throws Exception;
	
	//비밀번호 찾기
	public String forgetpw(String email) throws Exception;
	
	//회원가입
	public void regist(UserVO vo) throws Exception;
	
	//아이디 중복 체크
	public int checkid(String email) throws Exception;
	
	
	/*---사용자 정보 조회---*/
	
	//비밀번호 확인하기
	public String checkpw(UserVO vo) throws Exception;
	
	//사용자 정보 상세보기
	public UserVO read(String email) throws Exception;
	
	//사용자 정보 수정
	public void modify(UserVO vo) throws Exception;
}
