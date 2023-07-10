package com.kh.spring.match.controller;

import java.util.Date;
import java.util.HashMap;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
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
import com.kh.spring.common.model.vo.PageInfo;
import com.kh.spring.common.template.Pagination;
import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.service.MatchService;
import com.kh.spring.match.model.vo.Match;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;
import com.kh.spring.match.model.vo.MatchList;
import com.kh.spring.match.model.vo.MatchRegInfo;
import com.kh.spring.support.model.vo.Notice;
	
@Controller
@RequestMapping("/match")
public class MatchController {
	
	@Autowired
	private MatchService matchService;
	
	@Autowired
	private MatchDao matchDao;
	
	@GetMapping("/matchList.ma")
	public void matchList(@RequestParam(defaultValue="1") int nowPage, Model model,
			              @RequestParam(defaultValue="gender") String gender,
			              @RequestParam(defaultValue="loc") String locations,
			              @RequestParam(defaultValue="") String searchInput,
			              @RequestParam(defaultValue="") String dowFromSelect) {
		int totalRecord = 0;
		System.out.println(dowFromSelect+"요일");
		
		int dowInt = Integer.parseInt(dowFromSelect);
		String dowString = null;
		if(gender.equals("M") || gender.equals("F")) {
			totalRecord = matchService.selectTotalRecordMatchListGender(gender);
		} else if(locations.equals("seoul") ||
				  locations.equals("kyunggi") ||
				  locations.equals("충청") ||
				  locations.equals("대전") ||
				  locations.equals("강원") ||
				  locations.equals("경상") ||
				  locations.equals("대구") ||
				  locations.equals("부산") ||
				  locations.equals("전라") ||
				  locations.equals("광주") ||
				  locations.equals("제주")) {
			totalRecord = matchService.selectTotalRecordMatchListLocation(locations);
		} else if(!("".equals(searchInput))) {
			totalRecord = matchService.selectTotalRecordMatchListNick(searchInput);
		} else if(1 <= dowInt && dowInt <= 7) {
			if(dowInt==1) {
				dowString = "monday";
			} else if(dowInt==2) {
				dowString = "tuesday";
			} else if(dowInt==3) {
				dowString = "wednesday";
			} else if(dowInt==4) {
				
			}
			
		} else {
			totalRecord = matchService.selectTotalRecordMatchList();
		
			
		}
		
		int limit = 10;
		int offset = (nowPage - 1) * limit;
		RowBounds rowBounds = new RowBounds(offset, limit);
		PageInfo pi = Pagination.getPageInfo(totalRecord, nowPage, limit, 3);
		System.out.println(searchInput);
		
		List<MatchList> matchList = null;
		if(gender.equals("M") || gender.equals("F")) {
			matchList = matchService.matchListFilterGender(gender, rowBounds);
		} else if(locations.equals("서울") ||
				  locations.equals("경기") ||
				  locations.equals("충청") ||
				  locations.equals("대전") ||
				  locations.equals("강원") ||
				  locations.equals("경상") ||
				  locations.equals("대구") ||
				  locations.equals("부산") ||
				  locations.equals("전라") ||
				  locations.equals("광주") ||
				  locations.equals("제주")) {
			matchList = matchService.matchListFilterLocation(locations, rowBounds);
		} else if(!("".equals(searchInput))) {
			matchList = matchService.matchListFilterNick(searchInput, rowBounds);
		} else {
		    matchList = matchService.selectMatchingList(rowBounds);
		}
		
		System.out.println(matchList);
		
		System.out.println(nowPage);
		System.out.println(pi);
		String dow = "";
		String formattedDate = "";
		for(int i=0; i<matchList.size(); i++) {
			String y = matchList.get(i).getMatchdate().substring(0,4);
			String m = matchList.get(i).getMatchdate().substring(5,7);
			String d = matchList.get(i).getMatchdate().substring(8,10);
			
			int yd = Integer.parseInt(y);
			int md = Integer.parseInt(m);
			int dd = Integer.parseInt(d);
			
			LocalDate date = LocalDate.of(yd, md, dd);
			DayOfWeek dayOfWeek = date.getDayOfWeek();
			if(dayOfWeek.getValue() == 1) {
				dow = "월";
			} else if (dayOfWeek.getValue() == 2) {
				dow = "화";
			} else if (dayOfWeek.getValue() == 3) {
				dow = "수";
			} else if (dayOfWeek.getValue() == 4) {
				dow = "목";
			} else if (dayOfWeek.getValue() == 5) {
				dow = "금";
			} else if (dayOfWeek.getValue() == 6) {
				dow = "토";
			} else if (dayOfWeek.getValue() == 7) {
				dow = "일";
			}
			formattedDate = m + "월 " + d + "일 " + dow + "요일";
			matchList.get(i).setMatchdate(formattedDate);
		}
		
		LocalDate currentDate = LocalDate.now();
		DayOfWeek dayOfWeekNow = currentDate.getDayOfWeek();
		
		model.addAttribute("dowNow", dayOfWeekNow.getValue());
		model.addAttribute("matchList", matchList);
		model.addAttribute("pi", pi);
	}
	
	/*@GetMapping("/MatchListFilterGender.ma")
	public String MatchListFilterGender(@RequestParam String gender, Model model) {
		System.out.println(gender);
		
		System.out.println(matchList.get(0).getProNick());
		model.addAttribute("matchListFilterGender", matchList);
		return "/match/matchList";
	}*/
	
	@GetMapping("/mathChallenge.ma")
	public void matchChallenge(@RequestParam int no) {}

	@RequestMapping(value="/matchReg.ma", method = RequestMethod.GET)
	public String matchReg(HttpServletRequest request, Model model) {	
		String matchDate = request.getParameter("day");
		if(matchDate == null || "".equals(matchDate)) {
			LocalDateTime today = LocalDateTime.now();
			System.out.println(today);
			matchDate = today.toLocalDate().toString();
		}
		System.out.println("matchDate : " + matchDate);
		
		//matchdateList포맷용 ex.2023/07/05
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("M/d(E)");
		
		//user 하드코딩
		String userId1 = "user_03";
		
		//지도 옆에 보이는 매치 신청한 리스트 조회
		List<MatchInfo> insertScheduleList = matchService.selectMatchList(userId1, matchDate);
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
		
		//////////////////////////////////////////////////////////////////////
		
		Match match = new Match();
		//지도에 보여질 GYM, SCHEDULE 테이블 조인해서 조회하는 부분
		List<MatchInfo> scheduleList = matchService.selectScheduleList(matchDate);
		System.out.println(scheduleList);
		//System.out.println("스케줄 : " + scheduleList.get(0));
		
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

		model.addAttribute("dateFilter", getDateList());
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
	
	
	public List<HashMap<String, String>> getDateList() {
		
		List<HashMap<String, String>> result = new ArrayList<>();
		//오늘 날짜(요일) 구하기
		LocalDateTime today = LocalDateTime.now();
		String today2 = today.toLocalDate().toString();
		//System.out.println(today);
		DayOfWeek yoil = today.getDayOfWeek();
		//System.out.println(yoil);
		
		String[] yoils = new String[]{"일", "월", "화", "수", "목", "금", "토"};
		
		int yoilNum = yoil.getValue();
		//System.out.println(yoilNum);
		
		//그 주의 일요일 구하기
		LocalDateTime sunday = today.minusDays(yoilNum);
		//System.out.println(sunday);
		
		//+14일치 구하기
		for(int i=0; i<14; i++) {
			LocalDateTime date = sunday.plusDays(i);
			//System.out.println(date);
			
			DayOfWeek yoil2 = date.getDayOfWeek();
			int yoilNum2 = yoil2.getValue();
			//System.out.println(yoilNum2%7);
			
			String yoil3 = yoils[yoilNum2%7];
			
			LocalDate day = date.toLocalDate();
			String dayTemp = day.toString();
//			System.out.println(day);
//			System.out.println(dayTemp);
			
			String dateTemp = date.format(DateTimeFormatter.ofPattern("M/d"));
			//System.out.println(dateTemp);
			
			HashMap<String, String> yoilTemp = new HashMap<>();
			yoilTemp.put("date", dateTemp);
			yoilTemp.put("day", dayTemp);
			yoilTemp.put("yoil", yoil3);
			yoilTemp.put("today", today2);

			result.add(yoilTemp);
		}		
		System.out.println(result);
		
		return result;
	}
	
}