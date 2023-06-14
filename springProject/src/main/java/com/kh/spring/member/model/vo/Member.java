package com.kh.spring.member.model.vo;

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
	private String id;
	private String pw;
	private String name;
	private String gender;
	private int birth;
	private String phone;
	private String email;
	private int zipcode;
	private String address;
	private String detailaddress;
	private String usertype;
	private String status;
}
