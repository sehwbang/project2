package com.kh.spring.match.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.gym.model.vo.Gym;

@Mapper
public interface MatchDao {

//	Gym selectGymList(int gymNo);

	List<Gym> selectGymList();
	
}
