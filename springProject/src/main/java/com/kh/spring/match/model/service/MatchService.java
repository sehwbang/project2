package com.kh.spring.match.model.service;

import java.util.List;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;

public interface MatchService {
	
//	Gym selectGymList(int gymNo);

	List<Gym> selectGymList();

	List<MatchInfo> selectScheduleList();
}
