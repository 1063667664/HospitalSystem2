package com.whx.dao;

import java.util.List;

import com.whx.bean.Doctor;

public interface DoctorDao {
	public List<Doctor> queryDoctorByHospitalIdAndDepartName(Integer hospitalId,
			String departmentName,int startLine,int pageSize);
	public Doctor findDoctorById(Integer doctorId);
	public List<Doctor> queryDoctorByIllness(String illNess);
	public List<Doctor> queryDoctorByDoctorName(String doctorName);
	public List<Doctor> queryDoctorsByHospitalId(int pageSize, int pageIndex,Integer hospitalId);
	public int getTotalCount(Integer hospitalId);
	public void addDoctor(Doctor doctor);
	public void delDoctorByDoctorId(Integer doctorId);
	public void updateDoctor(Doctor doctor);
	public boolean verifyDoctorIdExist(Integer doctorId);
	public boolean verifyDoctorLogin(Integer doctorId,String password);
}
