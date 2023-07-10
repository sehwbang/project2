package com.kh.spring.match.model.vo;

import java.time.LocalDateTime;
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
public class MatchList {
	private int no;
	private String matchdate;
	private String matchtime;
	private String gymAddress;
	private String gymDetailaddress;
	private String proNick;
	private String userId;
}
