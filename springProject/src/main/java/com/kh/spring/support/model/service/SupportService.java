package com.kh.spring.support.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.spring.support.model.vo.Notice;
import com.kh.spring.support.model.vo.Question;

import lombok.NonNull;

public interface SupportService {
	int selectTotalRecord();

	List<Notice> selectNoticeList(RowBounds rowBounds);

	int insertNotice(Notice notice);

	int updateCountNotice(int noticeNo);
	
	Notice selectOneNotice(int noticeNo);

	int updateNotice(Notice notice);

	int deleteNotice(int noticeNo);

	List<Question> selectQuestionList(RowBounds rowBounds);
}