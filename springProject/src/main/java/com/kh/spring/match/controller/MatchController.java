package com.kh.spring.match.controller;

import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.service.MatchService;
import com.kh.spring.match.model.vo.Match;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;
import com.kh.spring.match.model.vo.MatchRegInfo;

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
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd(E)");
		
		String userId1 = "user_03";
		List<MatchInfo> insertScheduleList = matchService.selectMatchList(userId1);
		System.out.println("화면에 보이는 등록된 스케줄 : " + insertScheduleList);

		//MatchInfoView ifv = new MatchInfoView();
		MatchInfoView infoView = new MatchInfoView();
		List<MatchInfoView> inSchedList = new ArrayList<MatchInfoView>();
		
		for(int i=0; i<insertScheduleList.size(); i++) {
			System.out.println(insertScheduleList.get(i));
			infoView = new MatchInfoView();
			
			String gNo = insertScheduleList.get(i).getGymNo();
			String name = insertScheduleList.get(i).getGymName();
			LocalDateTime date = insertScheduleList.get(i).getMatchdate();
			String tm = insertScheduleList.get(i).getMatchtime();
			String cd = insertScheduleList.get(i).getCode();
			
			infoView.setGymNo(gNo);
			infoView.setGymName(name);
			infoView.setMatchdate(formatter.format(date));
			infoView.setMatchday(date);
			infoView.setTime(tm);
			infoView.setCode(cd);
			
			inSchedList.add(infoView);
		}
		System.out.println(inSchedList);
		
		model.addAttribute("inSchedList", inSchedList);
		
		
		
		List<MatchInfo> scheduleList = matchService.selectScheduleList();
		System.out.println("스케줄 : " + scheduleList.get(0));
		
		String tempGymNo = "0";
		String matchdate1 = "";
		LocalDateTime matchday1 = null;
		String time = "";
		
		List<String> matchdates = new ArrayList<String>();
		List<LocalDateTime> matchdays = new ArrayList<>();
		List<String> times = new ArrayList<String>();
		List<String> codes = new ArrayList<String>();
		//MatchInfoView infoView = new MatchInfoView();
		List<MatchInfoView> markerOverlayList = new ArrayList<MatchInfoView>();
		
		for(int i=0; i<scheduleList.size(); i++) {
			String gymNo = scheduleList.get(i).getGymNo();
			String gymName = scheduleList.get(i).getGymName();
			String gymAddress = scheduleList.get(i).getGymAddress();
			String gymDetailAddress = scheduleList.get(i).getGymDetailAddress();
			LocalDateTime matchdate = scheduleList.get(i).getMatchdate();
			String matchtime = scheduleList.get(i).getMatchtime();
			String code = scheduleList.get(i).getCode();			
									
			if(!tempGymNo.equals(gymNo)) {
				if(!tempGymNo.equals("0")) {
					infoView.setMatchdateList(matchdates);
					infoView.setMatchdayList(matchdays);
					infoView.setMatchTimeList(times);
					infoView.setCodeList(codes);
					markerOverlayList.add(infoView);
					//times = new ArrayList<MatchTimeCode>();
					times = new ArrayList<String>();
					codes = new ArrayList<String>();
				}
				infoView = new MatchInfoView();
				//matchTimeCode = new MatchTimeCode();
				
				infoView.setGymNo(gymNo);
				infoView.setGymName(gymName);
				infoView.setGymAddress(gymAddress);
				infoView.setGymDetailAddress(gymDetailAddress);
				System.out.println("matchdate : " + matchdate);
				
				matchdate1 = formatter.format(matchdate);
				matchday1 = matchdate;
				time = (matchtime.substring(0, 2) + ":" + matchtime.substring(2));
				
				matchdates.add(matchdate1);
				matchdays.add(matchday1);
				times.add(time);
				codes.add(code);
				
				//
				tempGymNo = gymNo;
			} else {
				matchdate1 = formatter.format(matchdate);
				matchday1 = matchdate;
				time = (matchtime.substring(0, 2) + ":" + matchtime.substring(2));
				System.out.println("시간 : " + time);
				
				matchdates.add(matchdate1);
				matchdays.add(matchday1);
				times.add(time);
				codes.add(code);
			}
		}
		if(!tempGymNo.equals("0")) {
			infoView.setMatchdateList(matchdates);
			infoView.setMatchdayList(matchdays);
			infoView.setMatchTimeList(times);
			infoView.setCodeList(codes);
			markerOverlayList.add(infoView);
			System.out.println(markerOverlayList);
		}
		
		model.addAttribute("markerOverlayList", markerOverlayList);

		return "/match/matchReg";
	}
	
	@ResponseBody
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String registerMatch(@RequestBody List<MatchRegInfo> matchRegInfoList) {
		System.out.println("registerMatch 들어옴");
		Match match = new Match();
		int result = 0;
		
		for(MatchRegInfo mri : matchRegInfoList) {		
			System.out.println(mri.toString());

			String matchNo = mri.getCode();
			int gymNo = mri.getGymNo();
			String userId1 = "user_03";
			String delYnCge = mri.getValue();
			System.out.println("mri에서 가져온 값 : " + matchNo + gymNo + delYnCge);
			
			match.setMatchNo(matchNo);
			match.setGymNo(gymNo);
			match.setUserId1(userId1);
			match.setMatchStatus(1);
			match.setDelYn(delYnCge);
			Match matchOne = matchService.selectMatch(match);
			System.out.println(matchOne);
			
			// 문자열
	        String dateStr = mri.getMatchday();
	 
	        // 포맷터
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
	        
	        // 문자열 -> Date
	        LocalDateTime date = LocalDateTime.parse(dateStr);
			
			//if(matchNo, gymNo, userId1 가 db에 없으면)
			//	insert
			//있으면
			//} else {
			//  update
			//}
	       
			if(matchOne == null) {		
				match.setMatchdate(date);
				match.setMatchtime(mri.getMatchtime());
				match.setMatchStatus(1);
				match.setDelYn(mri.getValue());
				
				System.out.println("insert문");
				result = matchService.registerMatch(match);
			} else {
				System.out.println("updat문");

				match.setDelYn(mri.getValue());				
				System.out.println(match);
				
				result = matchService.updateMatch(match);
			}
		}		
		
		Gson gson = new Gson();
		 
        // Json key, value 추가
        JsonObject jsonObject = new JsonObject();
        if(result > 0) {
	        jsonObject.addProperty("result", "OK");
	        jsonObject.addProperty("msg", "등록되었습니다.");
        } else {
	        jsonObject.addProperty("result", "NOT_OK");
	        jsonObject.addProperty("msg", "등록 실패했습니다.");
        }        
 
        // JsonObject를 Json 문자열로 변환
        String jsonStr = gson.toJson(jsonObject);
 
        // 생성된 Json 문자열 출력
        System.out.println(jsonStr); // {"name":"anna","id":1}
	
		return jsonStr;
	}
	
}
