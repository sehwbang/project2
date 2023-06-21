package com.kh.spring.match.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/match")
public class MatchController {
	
	@GetMapping("/matchList.ma")
	public void matchList() {
		
	}
	
}
