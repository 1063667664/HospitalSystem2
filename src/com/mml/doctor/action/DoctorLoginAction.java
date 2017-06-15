package com.mml.doctor.action;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Doctor;
import com.whx.dao.DoctorDao;

public class DoctorLoginAction implements Action{
	private Integer doctorId;
	private String password;
	private DoctorDao doctorDao;
	private String loginDoctorTip;
	private Doctor doctor;
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	public String getLoginDoctorTip() {
		return loginDoctorTip;
	}
	public void setLoginDoctorTip(String loginDoctorTip) {
		this.loginDoctorTip = loginDoctorTip;
	}
	public DoctorDao getDoctorDao() {
		return doctorDao;
	}
	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}
	public Integer getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(!doctorDao.verifyDoctorIdExist(doctorId)){
			loginDoctorTip="该账号不存在";
			return INPUT;
		}
		else if(!doctorDao.verifyDoctorLogin(doctorId, password)){
				loginDoctorTip="账号或密码不正确";
				return INPUT;
		}
		else{
			doctor = doctorDao.findDoctorById(doctorId);
		
			return SUCCESS;	
		}
		
	}
	public String doctorTopPage(){
		doctor = doctorDao.findDoctorById(doctorId);
		return SUCCESS;
	}
	public String doctorLeftMenuPage(){
		doctor = doctorDao.findDoctorById(doctorId);
		return SUCCESS;
	}

}
