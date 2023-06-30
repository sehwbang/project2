package com.kh.spring.match.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.service.MatchService;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;
import com.kh.spring.match.model.vo.MatchTimeCode;

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
		List<MatchInfo> scheduleList = matchService.selectScheduleList();
		System.out.println("스케줄 : " + scheduleList.get(0));
			
		
		String tempGymNo = "0";
		String time = "0";
		//List<MatchTimeCode> times = new ArrayList<MatchTimeCode>();
		List<String> times = new ArrayList<String>();
		List<String> codes = new ArrayList<String>();
		MatchInfoView infoView = new MatchInfoView();
		//MatchTimeCode matchTimeCode = new MatchTimeCode();
		List<MatchInfoView> scheduleListView = new ArrayList<MatchInfoView>();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd(E)"); 
		
		for(int i=0; i<scheduleList.size(); i++) {
			String gymNo = scheduleList.get(i).getGymNo();
			String gymName = scheduleList.get(i).getGymName();
			String gymAddress = scheduleList.get(i).getGymAddress();
			String gymDetailAddress = scheduleList.get(i).getGymDetailAddress();
			Date matchdate = scheduleList.get(i).getMatchdate();
			String matchtime = scheduleList.get(i).getMatchtime();
			String code = scheduleList.get(i).getCode();
			
									
			if(!tempGymNo.equals(gymNo)) {
				if(!tempGymNo.equals("0")) {
					infoView.setMatchtime(times);
					infoView.setCode(codes);
					scheduleListView.add(infoView);
					//times = new ArrayList<MatchTimeCode>();
					time = "";
					times = new ArrayList<String>();
					codes = new ArrayList<String>();
				}
				infoView = new MatchInfoView();
				//matchTimeCode = new MatchTimeCode();
				
				infoView.setGymNo(gymNo);
				infoView.setGymName(gymName);
				infoView.setGymAddress(gymAddress);
				infoView.setGymDetailAddress(gymDetailAddress);
				infoView.setMatchdate(simpleDateFormat.format(matchdate));
				
				time = (matchtime.substring(0, 2) + ":" + matchtime.substring(2));
				times.add(time);
				infoView.setMatchtime(times);
				//matchTimeCode.setMatchTime(matchtime.substring(0, 2) + ":" + matchtime.substring(2));
				//matchTimeCode.setCode(code);
				
				//times.add(matchTimeCode);
				codes.add(code);
				infoView.setCode(codes);
				
				//
				tempGymNo = gymNo;
			} else {
//				matchTimeCode = new MatchTimeCode();
//				matchTimeCode.setMatchTime(matchtime.substring(0, 2) + ":" + matchtime.substring(2));
//				matchTimeCode.setCode(code);
//				times.add(matchTimeCode);
				time = (matchtime.substring(0, 2) + ":" + matchtime.substring(2));
				System.out.println("시간 : " + time);
				
				times.add(time);
				infoView.setMatchtime(times);
				codes.add(code);
				infoView.setCode(codes);
			}
		}
		if(!tempGymNo.equals("0")) {
			infoView.setMatchtime(times);
			infoView.setCode(codes);
			scheduleListView.add(infoView);
			System.out.println(scheduleListView);
		}
		
		model.addAttribute("scheduleList", scheduleListView);

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
