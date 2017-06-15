package com.mml.doctor.action;

import java.sql.Date;
import java.util.List;

import javax.resource.spi.RetryableUnavailableException;

import org.aspectj.apache.bcel.generic.ReturnaddressType;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Registration;
import com.whx.dao.RegisterOrderDao;

public class DoctorRegistrationOrderAction implements Action {
	private String dateTime;
	private List<Registration> rList;
	private Integer doctorId;
	private RegisterOrderDao registerOrderDao;
	private Integer registrationId;
	// 当前页
	private Integer pageIndex;
	// 总记录数
	private Integer count;
	// 总页数
	private Integer totalPages;
	public Integer getRegistrationId() {
		return registrationId;
	}

	public void setRegistrationId(Integer registrationId) {
		this.registrationId = registrationId;
	}

	public String getDateTime() {
		return dateTime;
	}

	public void setDateTime(String dateTime) {
		this.dateTime = dateTime;
	}

	public List<Registration> getrList() {
		return rList;
	}

	public void setrList(List<Registration> rList) {
		this.rList = rList;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public RegisterOrderDao getRegisterOrderDao() {
		return registerOrderDao;
	}

	public void setRegisterOrderDao(RegisterOrderDao registerOrderDao) {
		this.registerOrderDao = registerOrderDao;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	private int getTotalPages(int count ,int pageSize){
		int totalPages = 0;
		totalPages = (count%pageSize==0)?(count/pageSize):(count/pageSize+1);
		return totalPages;
	}
	@Override
	public String execute() throws Exception {
		int pageSize=5;
		if(pageIndex==null){
			pageIndex=1;
		}
		if(dateTime==null||dateTime.trim().length()==0){
		  rList = registerOrderDao.checkAllRegistrationByDoctorId(doctorId, pageSize, pageIndex);
		  count= registerOrderDao.getTotalCount(doctorId);
		  totalPages =getTotalPages(count,5);
		}
		else {
			rList = registerOrderDao.checkRegistrationByDoctorIdAndDateTime(doctorId, dateTime, pageSize, pageIndex);
			count= registerOrderDao.getTotalCountByDateTime(doctorId, dateTime);
			 totalPages =getTotalPages(count,5);
		}
		return SUCCESS;
	}
    public String dealWithRegistration(){
		int mark = registerOrderDao.updateRegistrationState(registrationId);
		if(mark>0){
			return SUCCESS;
		}
		else{
		  return INPUT;
		}
    }
}
