package com.kh.spring.gym.model.vo;

import java.util.Date;

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
	int num;
	String code;
	Date MatchDate;
	String MatchTime;
    String userId;
    int gymNo;
}