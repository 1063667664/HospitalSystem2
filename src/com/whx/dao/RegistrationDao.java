package com.whx.dao;

import java.util.List;
import java.util.Map;

import com.whx.bean.Registration;

public interface RegistrationDao {
	public List<Map<String, String>> findRegistrations(String doctorName,
			String date, String firstPeriodBegin, String lastPeriodBegin);
	public int mark(String userId);
	public List<Registration> find(String doctorName, String date,
			String beginTime);

}
