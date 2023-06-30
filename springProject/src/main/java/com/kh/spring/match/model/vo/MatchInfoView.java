package com.kh.spring.match.model.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MatchInfoView {
	private String gymNo;
	private String gymName;
	private String gymAddress;
	private String gymDetailAddress;
	private String matchdate;
	private List<String> matchtime;
	private List<String> code;
}