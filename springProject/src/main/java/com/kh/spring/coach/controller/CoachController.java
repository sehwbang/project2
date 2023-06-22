package com.kh.spring.coach.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/coach")
public class CoachController {

	@GetMapping("/coachMainPage.co")
	public void coachMainPage() {
		
	}
	
	@GetMapping("/gymUpdateForm.gym")
	public void gymUpdateForm() {
		
	}
	
	@GetMapping("/gymCalendar.gym")
	public void gymCalendar() {
		
	}
	
	@GetMapping("/gymView.gym")
	public void gymView() {
		
	}
}
