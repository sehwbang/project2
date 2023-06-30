package com.kh.spring.match.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;

@Mapper
public interface MatchDao {

//	Gym selectGymList(int gymNo);

	List<Gym> selectGymList();

	List<MatchInfo> selectScheduleList();
}
