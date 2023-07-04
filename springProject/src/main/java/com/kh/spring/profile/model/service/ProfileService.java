package com.kh.spring.profile.model.service;

import com.kh.spring.profile.model.vo.Profile;

public interface ProfileService {

	int profileEnroll(Profile profile);

	Profile profileUpdate(String userId);

	boolean isProfileRegistered();

}
