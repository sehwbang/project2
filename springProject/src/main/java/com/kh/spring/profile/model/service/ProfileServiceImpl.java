package com.kh.spring.profile.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.profile.model.dao.ProfileDao;
import com.kh.spring.profile.model.vo.Profile;



@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	private ProfileDao profileDao;

	@Override
	public int profileEnroll(Profile profile) {
		return profileDao.profileEnroll(profile);
	}

	@Override
	public Profile profileUpdate(String userId) {
		return profileDao.profileUpdate(userId);
	}

	@Override
	public boolean isProfileRegistered() {
	
		return false;
	}
}
