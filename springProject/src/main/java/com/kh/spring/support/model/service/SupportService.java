package com.kh.spring.support.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;

import com.kh.spring.support.model.vo.Notice;

public interface SupportService {
	int selectTotalRecord();

	List<Notice> selectNoticeList(RowBounds rowBounds);

	int insertNotice(Notice notice);

	int updateCountNotice(int noticeNo);
	
	Notice selectOneNotice(int noticeNo);
}