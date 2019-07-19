package com.brs.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.brs.domain.UserVO;
import com.brs.dto.LoginDTO;
@Repository
public class UserDAOImpl implements UserDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.brs.mapper.userMapper";

	//로그인
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login", dto);
	}

	//비밀번호 찾기
	@Override
	public String forgetpw(String email) throws Exception {
		return session.selectOne(namespace+".forgetpw", email);
	}

	//회원가입
	@Override
	public void create(UserVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	//아이디 중복 체크
	@Override
	public int checkid(String email) throws Exception {
		return session.selectOne(namespace + ".checkid", email);
	}
	
	/*---사용자 정보 수정---*/
	
	
	//비밀번호 확인
	@Override
	public String checkpw(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".checkpw", vo);
	}

	//사용자 정보 상세보기
	@Override
	public UserVO read(String email) throws Exception {
		return session.selectOne(namespace + ".read", email);
	}
	
	//사용자 정보 수정
	@Override
	public void update(UserVO vo) throws Exception {
		session.update(namespace+".update", vo);
	}


}
