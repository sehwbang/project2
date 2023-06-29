package com.kh.spring.gym.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;

@Mapper
public interface GymDao {
	int insertJoin(Gym gym);

	int insertSchedule(Schedule schedule);

	List<Schedule> selectCodeList(String userId);

	int deleteSchedule(Schedule schedule);
}