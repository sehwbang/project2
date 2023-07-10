package com.kh.spring.match.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.gym.model.vo.Gym;
import com.kh.spring.gym.model.vo.Schedule;
import com.kh.spring.match.model.dao.MatchDao;
import com.kh.spring.match.model.vo.Match;
import com.kh.spring.match.model.vo.MatchInfo;
import com.kh.spring.match.model.vo.MatchInfoView;
import com.kh.spring.match.model.vo.MatchList;
import com.kh.spring.match.model.vo.MatchRegInfo;

@Service
public class MatchServiceImpl implements MatchService{

	@Autowired
	private MatchDao matchDao;

	@Override
	public List<MatchInfo> selectScheduleList(String matchDate) {
		System.out.println("ServiceImpl = selectScheduleList : " + matchDate);
		return matchDao.selectScheduleList(matchDate);
	}

	@Override
	public int registerMatch(Match match) {
		return matchDao.registerMatch(match);
	}

	@Override
	public Match selectMatch(Match match) {
		return matchDao.selectMatch(match);
	}

	@Override
	public int updateMatch(Match match) {
		return matchDao.updateMatch(match);
	}

	@Override
	public List<MatchInfo> selectMatchList(String userId1, String matchDate) {
		return matchDao.selectMatchList(userId1, matchDate);
	}

	@Override
	public int selectTotalRecordMatchList() {
		return matchDao.selectTotalRecordMatchList();
	}

	@Override
	public List<MatchList> selectMatchingList(RowBounds rowBounds) {
		return matchDao.selectMatchingList(rowBounds);
	}

	@Override
	public List<MatchList> matchListFilterGender(String gender, RowBounds rowBounds) {
		return matchDao.matchListFilterGender(gender, rowBounds);
	}

	@Override
	public int selectTotalRecordMatchListGender(String gender) {
		return matchDao.selectTotalRecordMatchListGender(gender);
	}

	@Override
	public int selectTotalRecordMatchListLocation(String location) {
		return matchDao.selectTotalRecordMatchListLocation(location);
	}

	@Override
	public List<MatchList> matchListFilterLocation(String locations, RowBounds rowBounds) {
		return matchDao.matchListFilterLocation(locations, rowBounds);
	}

	@Override
	public int selectTotalRecordMatchListNick(String searchInput) {
		return matchDao.selectTotalRecordMatchListNick(searchInput);
	}

	@Override
	public List<MatchList> matchListFilterNick(String searchInput, RowBounds rowBounds) {
		return matchDao.matchListFilterNick(searchInput, rowBounds);
	}

	@Override
	public List<MatchList> matchListFilterDow(String dowString, RowBounds rowBounds) {
		return matchDao.matchListFilterDow(dowString, rowBounds);
	}

	@Override
	public int selectTotalRecordMatchListDow(String dowString) {
		return matchDao.selectTotalRecordMatchListDow(dowString);
	}

}
