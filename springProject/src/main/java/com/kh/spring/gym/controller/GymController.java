package com.kh.spring.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.gym.model.dao.GymDao;
import com.kh.spring.gym.model.service.GymService;
import com.kh.spring.gym.model.vo.Gym;

@Controller
@RequestMapping("/gym")
public class GymController {
	
	@Autowired
	private GymService gymService;
	
	@Autowired
	private GymDao gymDao;
	
	@GetMapping("/joinPage.gy")
	public String joinPage() {
		return "/gym/joinEnroll";
	}
	
	@PostMapping("/joinEnroll.gy")
	public String joinEnroll(Gym gym) {
		System.out.println(gym);
		int result = gymService.insertJoin(gym);
		return "redirect:/";
	}
}