package com.whx.service;

import java.util.List;

import com.whx.bean.Doctor;

public interface DoctorService {
	 public List<Doctor> queryDoctorByHospitalIdAndDepartName(Integer hospitalId,
			 String departmentName,int startLine,int pageSize);
	 public Doctor findDoctorById(Integer doctorId);
	 public List<Doctor> queryDoctorByIllness(String illNess);
	 public List<Doctor> queryDoctorByDoctorName(String doctorName);

}
