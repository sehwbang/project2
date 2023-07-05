package com.kh.spring.manager.controller;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.profile.model.vo.Profile;
import com.kh.spring.manager.model.service.ManagerService;



@Controller
@RequestMapping("/manager")
public class ManagerController {
	
	@Autowired
	private ManagerService managerService;
	
	@Autowired
	private ServletContext application;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/mnMainPage.mn")
	public void mnMainPage() {}


	
	// 체육관정보 조회 및 수정
	@GetMapping("/mnGymList.mn")
	public void gymList(@RequestParam(defaultValue="1") int nowPage, Model model) {
		int totalRecord = managerService.selectTotalRecord();
		int limit = 10;
		int offset = (nowPage - 1) * limit; 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
		
		List<Gym> mnGymList = managerService.selectGymList(rowBounds);
		model.addAttribute("gymList", mnGymList);
		
		model.addAttribute("pi", pi);
		System.out.println(mnGymList);
	}
	
	
	@GetMapping("/mnGymUpdate.mn")
	public String updateDev(@RequestParam("gymNo") int gymNo, Model model) {
		Gym gym = managerService.selectOneGym(gymNo);
		model.addAttribute("gym", gym);
		return "manager/mnGymUpdate";
	}
	
	@PostMapping("/mnGymUpdate.mn")
	public String updateDev(Gym gym, RedirectAttributes redirectAttr) {
		int result = managerService.mnGymUpdate(gym);
		redirectAttr.addFlashAttribute("msg", "체육관 정보수정 완료");
		return "redirect:/manager/mnGymList.mn";
	}

	
	
	// 회원정보 조회 및 수정
	@GetMapping("/mnMemberList.mn")
	public void memberList(@RequestParam(defaultValue="1") int nowPage, Model model) {
		int totalRecord = managerService.selectTotalRecordMember();
		int limit = 10;
		int offset = (nowPage - 1) * limit; 
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
		
		List<Member> mnMemberList = managerService.selectMemberList(rowBounds);
		model.addAttribute("memberList", mnMemberList);
		model.addAttribute("pi", pi);
	}
	
	@GetMapping("/mnMemberUpdate.mn")
	public String updateMember(@RequestParam("userId") String userId, Model model) {
		Member member = managerService.selectOneMember(userId);
		model.addAttribute("member", member);
		return "manager/mnMemberUpdate";
	}
	
	@PostMapping("/mnMemberUpdate.mn")
	public String updateMember(Member member, RedirectAttributes redirectAttr) {
		int result = managerService.mnMemberUpdate(member);
		redirectAttr.addFlashAttribute("msg", "회원 정보수정 완료");
		return "redirect:/manager/mnMemberList.mn";
	}
	
	@GetMapping("/mnProfileUpdate.mn")
	public String updateProfile(@RequestParam("userId") String userId, Model model) {
		Profile profile = managerService.selectOneProfile(userId);
		model.addAttribute("profile", profile);
		return "manager/mnMemberUpdate";
	}
	
	@PostMapping("/mnProfileUpdate.mn")
	public String updateProfile(Profile profile, RedirectAttributes redirectAttr) {
		int result = managerService.mnProfileUpdate(profile);
		redirectAttr.addFlashAttribute("msg", "프로필 정보수정 완료");
		return "redirect:/manager/mnMemberList.mn";
	}
	
	
}
