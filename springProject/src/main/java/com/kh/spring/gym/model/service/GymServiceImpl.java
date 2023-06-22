package com.kh.spring.gym.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gym.model.dao.GymDao;
import com.kh.spring.gym.model.vo.Gym;

@Service
public class GymServiceImpl implements GymService {
	@Autowired
	private GymDao gymDao;
	
	@Override
	public int insertJoin(Gym gym) {
		return gymDao.insertJoin(gym);
	}
}