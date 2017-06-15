package com.whx.dao;

import java.util.Date;
import java.util.List;
import com.whx.bean.Doctor;
import com.whx.bean.Period;
import com.whx.bean.Schedule;

public interface ScheduleDao {
	public List<Period> findPeriods(String doctorName);
	public Schedule find(String doctorId, String date, String firstPeriodBegin,
			String lastPeriodBegin);
	public boolean save(Doctor doctor, Period period);
	public boolean delete(String doctorId, String date, String beginTime,
			String endTime);
	//查询医生的排班时间
	public List<Period> findPeriodsByDoctorId(Integer doctorId,int pageSize, int pageIndex,Date beginDateTime,Date endDateTime);
	public int getTotalCount(Integer doctorId,Date beginDateTime,Date endDateTime);
	public void saveDoctorSchedule(Doctor doctor,Period period);
	public  void savePeriod(Period period);
	public boolean deleteScheduleSperiod(Integer doctorId,Integer periodId);
}
