package com.kh.spring.match.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.match.model.dao.MatchDao;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchDao matchDao;
	
	@Override
	public Gym selectGymList(int gymNo) {
		return matchDao.selectGymList(gymNo);
	}

//	@Override
//	public Gym selectGymList() {
//		return matchDao.selectGymList();;
//	}

}
