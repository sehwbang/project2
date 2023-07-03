package com.kh.spring.profile.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.spring.profile.model.vo.Profile;

@Mapper
public interface ProfileDao {

	int profileEnroll(Profile profile);

	Profile profileUpdate(String userId);


}
