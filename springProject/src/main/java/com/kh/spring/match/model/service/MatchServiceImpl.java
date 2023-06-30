package com.kh.spring.match.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchDao matchDao;
	
//	@Override
//	public Gym selectGymList(int gymNo) {
//		return matchDao.selectGymList(gymNo);
//	}

	@Override
	public List<Gym> selectGymList() {
		return matchDao.selectGymList();
	}

	@Override
	public List<MatchInfo> selectScheduleList() {
		return matchDao.selectScheduleList();
	}

}
