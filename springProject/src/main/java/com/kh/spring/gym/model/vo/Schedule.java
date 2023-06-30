package com.kh.spring.gym.model.vo;

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
public class Schedule {
	private int num;
	private String code;
	private Date matchdate;
	private String matchtime;
	private String user_id;
}
