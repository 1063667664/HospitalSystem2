package com.whx.dao;

import java.util.List;

import com.whx.bean.Registration;
import com.whx.bean.User;

public interface BookingDao {
	public User findByName(String userName);
	   public void UpdateUserBalance(User u);
	   public void UpdateRegistrationSate(Registration reg);
	   public Registration findByUserName(String userName,String date);
	   public List<Registration> findRegistrationByUserName(String UserName);
}
