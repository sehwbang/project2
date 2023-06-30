package com.kh.spring.match.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Match {
	private int no;
	private int match_no;
	private int gym_no;
	private String user_id1;
	private String user_id2;
	private String matchdate;
	private String matchtime;
	private String score1;
	private String score2;
	private int matchState;
}
