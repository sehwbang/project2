package com.kh.spring.match.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.service.MatchService;

@Controller
@RequestMapping("/match")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	@Autowired
	private MatchDao matchDao;
	
	@GetMapping("/matchList.ma")
	public String matchList(@RequestParam(defaultValue="19") int gymNo, Model model) {
		Gym gym = matchService.selectGymList(gymNo);
		
		model.addAttribute("gym", gym);
		System.out.print("gym=" + gym);
		
		return "/match/matchReg";
	}
	
	@GetMapping("/matchReg.ma")
	public void matchReg() {
		
	}
}
