package kr.spring.ch09.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.spring.ch09.vo.MemberVO;

@Controller
public class MemberWriteController {
	//유효성 체크를 위한 자바빈(VO) 초기화
	@ModelAttribute("command")
	public MemberVO initCommand() {
		return new MemberVO();
	}
	//폼 호출
	@GetMapping("/member/write.do")
	public String form() {
		return "member/write";
	}
	
	
}
