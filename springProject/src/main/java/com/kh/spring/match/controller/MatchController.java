package com.kh.spring.match.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public void matchList() { }
	
	@GetMapping("/matchReg.ma")
	public String matchReg(Model model) {
		List<Gym> gymList = matchService.selectGymList();
		
		model.addAttribute("gymList", gymList);
		System.out.println("gym=" + gymList);
		
		return "/match/matchReg";
	}
	
	@ResponseBody
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String registerMatch(@RequestBody List<String> param) {
		for(String s : param) {
			System.out.println(s);			
		}
		
		return "{}";
	}
	
}
