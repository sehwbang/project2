package com.kh.spring.gym.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.gym.model.vo.Gym;

@Mapper
public interface GymDao {
	int insertJoin(Gym gym);
}