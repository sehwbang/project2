package com.kh.spring.profile.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.profile.model.service.ProfileService;
import com.kh.spring.profile.model.vo.Profile;

@Controller
@SessionAttributes({"profileMember"})
@RequestMapping("/profile")
public class ProfileController {

	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private MemberService memberService;

	@RequestMapping("/profile/profileEnroll.pr")
	public String enrollProfile(Model model) {
		// 프로필 등록 로직을 수행하고 등록 여부를 확인합니다.
		boolean isProfileRegistered = profileService.isProfileRegistered();

		// 모델에 isProfileRegistered 변수를 추가합니다.
		// JSP에서 사용할 수 있도록 모델에 설정됩니다.
		model.addAttribute("isProfileRegistered", isProfileRegistered);

		return "profileEnroll"; // 프로필 등록 페이지로 이동
	}

	@GetMapping("/profileEnroll.pr")
	public void profileEnroll() {
	}

	@PostMapping("/profileEnroll.pr")
	public String profileEnroll(Profile profile, Member member, Model model) {
		//System.out.println("pro =" + profile);
		int result = profileService.profileEnroll(profile);
		//System.out.println("result =" + result);
		
		//System.out.println(profile.getUserId());
		int result2 = 0;
		 if (result == 1) {
			result2 = memberService.statusUpdate(profile.getUserId());
			System.out.println("status업데이트 결과 : " + result2);
			member.setUserStatus(2);
			System.out.println("getUserStatus : " + member.getUserStatus());
			model.addAttribute("profileMember", member);
		 }
		return "redirect:/";			
	}		

	
	@GetMapping("/profileUpdate.pr")
	public String profileUpdate(@RequestParam(defaultValue = "user1") String userId, Model model) {
		Profile profile = profileService.profileUpdate(userId);

		model.addAttribute("profile", userId);

		return "profile/profileUpdate";
	}

}