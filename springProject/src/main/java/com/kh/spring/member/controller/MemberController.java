package com.kh.spring.member.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.service.MemberServiceImpl;
import com.kh.spring.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
//	@GetMapping("/memberEnroll.me")
//	public String memberEnroll() {
//		return "member/memberEnroll";
//	}
	@RequestMapping("/GoLoginPage.me")
	public String loginPage() {
		return "member/loginPage";
	}
	
	@GetMapping("/memberEnroll.me")
	public void memberEnroll() {}  // => /member/memberEnroll
	
	@PostMapping("/memberEnroll.me")
	public String memberEnroll(Member member) {
		System.out.println(member);
		
		int result = memberService.insertMember(member);
		return "redirect:/";
	}
	
	@RequestMapping(value = "/phoneCheck", method = RequestMethod.GET)
	@ResponseBody
	public String sendSMS(@RequestParam("phone") String userPhoneNumber) { // 휴대폰 문자보내기
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성

		MemberServiceImpl.certifiedPhoneNumber(userPhoneNumber,randomNumber);
		
		return Integer.toString(randomNumber);
	}

	

}









