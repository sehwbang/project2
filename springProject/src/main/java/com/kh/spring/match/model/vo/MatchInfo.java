package com.kh.spring.match.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MatchInfo {
	private String gymNo;
	private String gymName;
	private String gymAddress;
	private String gymDetailAddress;
	private Date matchdate;
	private String matchtime;
	private String code;
}
