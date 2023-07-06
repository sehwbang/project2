package com.kh.spring.match.model.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//DB VO

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Match {
	private int no;
	private String matchNo;
	private int gymNo;
	private String userId1;
	private String userId2;
	private LocalDateTime matchdate;
	private String matchtime;
	private String score1;
	private String score2;
	private int matchStatus;
	private String delYn;
}
