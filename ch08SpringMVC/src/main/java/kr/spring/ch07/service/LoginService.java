package kr.spring.ch07.service;

import kr.spring.ch07.vo.LoginVO;

public class LoginService {
	public void checkLogin(LoginVO vo) throws LoginCheckException{
		//테스트용으로 id와 passwd가 일치하면 로그인 처리
		if(!vo.getId().equals(vo.getPasswd())) {
			System.out.println("인증 에러 - " + vo.getId());
			throw new LoginCheckException();
		}
	}
}

