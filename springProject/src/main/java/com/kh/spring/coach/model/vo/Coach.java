package com.kh.spring.coach.model.vo;

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
public class Coach {
	private int gymNo;
	private String gymName;
	private String gymType;
	private String gymBoss;
	private String gymCoach;
	private String coachPhone;
	private String gymPhone;
	private String gymZipcode;
	private String gymAddr;
	private String gymDetailAddr;
	private int matchCount;
	private String gymBank;
	private int gymAccount;
	private String bussinessNo;
	private Date gymRegdate;
	private int gymStatus;
	private String reason;
}
