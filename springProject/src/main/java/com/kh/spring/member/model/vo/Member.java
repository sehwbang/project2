package com.kh.spring.member.model.vo;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

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
public class Member {
	private String userId;
	private String userPw;
	private int userRnn;
	private String userName;
	private String userGender;
	private String userEmail;
	private String userPhone;
	private String userZipcode;
	private String userAddr;
	private String userDetailaddr;
	private String userType;
	private int userStatus;
	private int userCon;
	private Date userRegdate;
}
