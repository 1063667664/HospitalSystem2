package com.whx.service;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;

import com.whx.bean.Period;
import com.whx.bean.Registration;
import com.whx.dao.RegistrationDao;
import com.whx.dao.ScheduleDao;

public class ScheduleService {
	public RegistrationDao getRegistrationDao() {
		return registrationDao;
	}
	public void setRegistrationDao(RegistrationDao registrationDao) {
		this.registrationDao = registrationDao;
	}
	private ScheduleDao scheduleDao;
	private RegistrationDao registrationDao;
	private static final String EXISTED = "已存在";
	private static final String SUCCESS = "插入成功";
	private static final String ERROR = "插入失败";
	private static final int NUM_PERIODS=2;
	private static final String MORNING="-上午";
	private static final String AFTERNOON="-下午";
	private static final String FILLED="filled";
	private static final String UNFILLED="unfilled";
	private static final int NUM_REGISTRATION_PRE_PERIOD=9;
	public ScheduleDao getScheduleDao() {
		return scheduleDao;
	}
	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}
	
	public JSONArray findPeriods(String doctorName){
	  List<Period> list= scheduleDao.findPeriods(doctorName);
	  Set<String> periodNames=new HashSet<String>();
	  if(list!=null){
		  for(Period item:list){
			  Map<String,List<Period>> map = new HashMap<String,List<Period>>();
			  
			  String timeDesc=transformPeriod(doctorName,item);
			  periodNames.add(timeDesc);		  }
		  
	  }
	 JSONArray jsonArray = new JSONArray();
	 if (periodNames.size() > 0) {
			jsonArray = JSONArray.fromObject(periodNames);
	 }
		return jsonArray;
	  
	}
	private String transformPeriod(String doctorName, Period item) {
		Date date=item.getDate();
		Time time=item.getBeginTime();
		long morningBeginHour = Time.valueOf("09:00:00").getTime();
		long morningEndHour = Time.valueOf("11:00:00").getTime();
		String timeDesc = null;
		long hour = time.getTime();
		String mornOrAfter=null;
		if (hour >= morningBeginHour && hour <= morningEndHour) {
			mornOrAfter= MORNING;
		} else {
			mornOrAfter=AFTERNOON;
		}
		String isFilled=isFilled(doctorName,item)?FILLED:UNFILLED;
		timeDesc = date.toString().substring(0, 10) +mornOrAfter+"-"+isFilled;
		return timeDesc;
	}
	/**
	 * 判断该时间段是否已满
	 * 每个时间段最多看3个病人,上下午分别有3个时间段
	 * @param doctorName
	 * @param period
	 * @return
	 */
	private boolean isFilled(String doctorName,Period period){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		Date date=period.getDate();  
		String dateStr=sdf.format(date);  
		String time=period.getBeginTime().toString();
		System.out.println("time="+time);
		System.out.println("doctorname="+doctorName);
		String dateStr1=dateStr+"-"+"上午"+"10:00-11:00";
		List<Registration>list=registrationDao.find(doctorName, dateStr, time);
		System.out.println(dateStr);
		System.out.print("List<Registration>list="+list.size());
		return list.size()>=NUM_REGISTRATION_PRE_PERIOD;
	}

}
