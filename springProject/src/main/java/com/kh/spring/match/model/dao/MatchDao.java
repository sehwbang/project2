package com.kh.spring.match.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.vo.Match;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;
import com.kh.spring.match.model.vo.MatchList;
import com.kh.spring.match.model.vo.MatchRegInfo;

@Mapper
public interface MatchDao {

	List<MatchInfo> selectScheduleList(String matchDate);

	int registerMatch(Match match);

	Match selectMatch(Match match);

	int updateMatch(Match match);

	List<MatchInfo> selectMatchList(@Param("userId1")String userId1, @Param("matchdate")String matchDate);

	int selectTotalRecordMatchList();

	List<MatchList> selectMatchingList(RowBounds rowBounds);

	List<MatchList> matchListFilterGender(String gender, RowBounds rowBounds);
	
	int selectTotalRecordMatchListGender(String gender);

	int selectTotalRecordMatchListLocation(String locations);

	List<MatchList> matchListFilterLocation(String locations, RowBounds rowBounds);

	int selectTotalRecordMatchListNick(String searchInput);

	List<MatchList> matchListFilterNick(String searchInput, RowBounds rowBounds);

	List<MatchList> matchListFilterDow(String dowString, RowBounds rowBounds);

	int selectTotalRecordMatchListDow(String dowString);
}
