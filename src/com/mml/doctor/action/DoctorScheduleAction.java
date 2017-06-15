package com.mml.doctor.action;

import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.enterprise.inject.New;
import javax.ws.rs.DELETE;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Doctor;
import com.whx.bean.Period;
import com.whx.dao.DoctorDao;
import com.whx.dao.ScheduleDao;

public class DoctorScheduleAction implements Action {
	private Integer doctorId;
	// 当前页
	private Integer pageIndex;
	// 总记录数
	private Integer count;
	// 总页数
	private Integer totalPages;
	//查询医生排班开始时间
    private String beginDateTime;
    //查询医生排班结束时间
    private String endDateTime;
    private ScheduleDao scheduleDao;
    private String date;
    private String mornOrAfternoon;
    private List<Period> pList;
    private DoctorDao doctorDao;
    private String addScheduleTip;
    private Integer periodId;
    
	public Integer getPeriodId() {
		return periodId;
	}

	public void setPeriodId(Integer periodId) {
		this.periodId = periodId;
	}

	public String getAddScheduleTip() {
		return addScheduleTip;
	}

	public void setAddScheduleTip(String addScheduleTip) {
		this.addScheduleTip = addScheduleTip;
	}

	public DoctorDao getDoctorDao() {
		return doctorDao;
	}

	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}

	public String getMornOrAfternoon() {
		return mornOrAfternoon;
	}

	public void setMornOrAfternoon(String mornOrAfternoon) {
		this.mornOrAfternoon = mornOrAfternoon;
	}


	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public List<Period> getpList() {
		return pList;
	}

	public void setpList(List<Period> pList) {
		this.pList = pList;
	}

	public ScheduleDao getScheduleDao() {
		return scheduleDao;
	}

	public void setScheduleDao(ScheduleDao scheduleDao) {
		this.scheduleDao = scheduleDao;
	}

	public Integer getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public String getBeginDateTime() {
		return beginDateTime;
	}

	public void setBeginDateTime(String beginDateTime) {
		this.beginDateTime = beginDateTime;
	}

	public String getEndDateTime() {
		return endDateTime;
	}

	public void setEndDateTime(String endDateTime) {
		this.endDateTime = endDateTime;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	@Override
	public String execute() throws Exception {
		int pageSize = 5;
		if (pageIndex == null) {
			pageIndex = 1;
		}
		pList = scheduleDao.findPeriodsByDoctorId(doctorId, pageSize, pageIndex, stringToDate(beginDateTime),
				stringToDate(endDateTime));
		count = scheduleDao.getTotalCount(doctorId, stringToDate(beginDateTime), stringToDate(endDateTime));
		totalPages = getTotalPages(count, 5);
		return SUCCESS;
	}
	public String deleteDoctorSchedule(){
		if(scheduleDao.deleteScheduleSperiod(doctorId, periodId))
		  return SUCCESS;
		else 
			return INPUT;
	}
	@SuppressWarnings("unused")
	private Date  stringToDate(String date) throws ParseException{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (date != null&&date.trim().length()!=0) {
			return sdf.parse(date);
		} else
			return null;
	}
	private int getTotalPages(int count ,int pageSize){
		int totalPages = 0;
		totalPages = (count%pageSize==0)?(count/pageSize):(count/pageSize+1);
		return totalPages;
	}
	public  String forwardToAddSchedulePage(){
		return SUCCESS;
	}
	public String addDoctorSchedule() throws ParseException{
		Doctor doctor = doctorDao.findDoctorById(doctorId);
		if(doctor==null||date==null||date.length()==0)
		{
			return ERROR;
		}
		 Date dateToday = new Date();
	     DateFormat df1 = DateFormat.getDateInstance();
		if(!verifyDateCorrect(df1.parse(df1.format(dateToday)))){
			addScheduleTip="请选择今天或今天之后的日期排班";
			return INPUT;
		}
		if(savePeriodSchedule(doctor,date, mornOrAfternoon)){
			return SUCCESS;
		}
		else{
			addScheduleTip="排班失败";
		   return INPUT;
		}
	}
	@SuppressWarnings("unused")
	private boolean savePeriodSchedule(Doctor doctor,String date,String mornOrAfter) throws ParseException{
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		if(mornOrAfternoon.equals("morning")){
			Period p1=new Period();	
			p1.setBeginTime(new Time(simpleDateFormat.parse(date+" 10:00:00")
					.getTime()));
			p1.setEndTime(new Time(simpleDateFormat.parse(date+" 11:00:00")
					.getTime()));
			p1.setDate(stringToDate(date));
			scheduleDao.savePeriod(p1);
			scheduleDao.saveDoctorSchedule(doctor, p1);
			Period p2=new Period();
			p2.setBeginTime(new Time(simpleDateFormat.parse(date+" 09:00:00")
					.getTime()));
			p2.setEndTime(new Time(simpleDateFormat.parse(date+" 10:00:00")
					.getTime()));
			p2.setDate(stringToDate(date));
			scheduleDao.savePeriod(p2);
			scheduleDao.saveDoctorSchedule(doctor, p2);
			Period p3=new Period();
			p3.setBeginTime(new Time(simpleDateFormat.parse(date+" 11:00:00")
					.getTime()));
			p3.setEndTime(new Time(simpleDateFormat.parse(date+" 12:00:00")
					.getTime()));
			p3.setDate(stringToDate(date));
			scheduleDao.savePeriod(p3);
			scheduleDao.saveDoctorSchedule(doctor, p3);
			return true;
		}
		else if(mornOrAfternoon.equals("afternoon")){
			Period p1=new Period();	
			p1.setBeginTime(new Time(simpleDateFormat.parse(date+" 14:00:00")
					.getTime()));
			p1.setEndTime(new Time(simpleDateFormat.parse(date+" 15:00:00")
					.getTime()));
			p1.setDate(stringToDate(date));
			scheduleDao.savePeriod(p1);
			scheduleDao.saveDoctorSchedule(doctor, p1);
			Period p2=new Period();
			p2.setBeginTime(new Time(simpleDateFormat.parse(date+" 15:00:00")
					.getTime()));
			p2.setEndTime(new Time(simpleDateFormat.parse(date+" 16:00:00")
					.getTime()));
			p2.setDate(stringToDate(date));
			scheduleDao.savePeriod(p2);
			scheduleDao.saveDoctorSchedule(doctor, p2);
			Period p3=new Period();
			p3.setBeginTime(new Time(simpleDateFormat.parse(date+" 16:00:00")
					.getTime()));
			p3.setEndTime(new Time(simpleDateFormat.parse(date+" 17:00:00")
					.getTime()));
			p3.setDate(stringToDate(date));
			scheduleDao.savePeriod(p3);
			scheduleDao.saveDoctorSchedule(doctor, p3);
			return true;
		}
		else
		{
			return false;
		}
	}
	@SuppressWarnings("unused")
	private boolean verifyDateCorrect(Date d) throws ParseException{
		Date temp=stringToDate(date);
		if(d==null||temp==null){
			return false;
		}	
		else if(d.after(temp)){
			return false;
		}
		else{
			return true;
		}
	}
	
}
