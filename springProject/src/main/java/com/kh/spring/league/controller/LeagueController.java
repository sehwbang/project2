package com.kh.spring.league.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/league")
public class LeagueController {
	
	@GetMapping("/leagueList.vcr")
	public void leagueList() {
		
	}
}
