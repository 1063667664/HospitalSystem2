package com.whx.service;

import java.util.List;

import com.whx.bean.Doctor;
import com.whx.dao.DoctorDao;

public class DoctorServiceImpl implements DoctorService {
	private DoctorDao doctorDao;

	public DoctorDao getDoctorDao() {
		return doctorDao;
	}

	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}

	@Override
	public List<Doctor> queryDoctorByHospitalIdAndDepartName(
			Integer hospitalId, String departmentName,int startLine,int pageSize) {
		// TODO Auto-generated method stub
		List<Doctor> doctorList=
				doctorDao.queryDoctorByHospitalIdAndDepartName(hospitalId, departmentName,
						startLine,pageSize);
		return doctorList;
		
	}

	@Override
	public Doctor findDoctorById(Integer doctorId) {
		return doctorDao.findDoctorById(doctorId);
	}

	@Override
	public List<Doctor> queryDoctorByIllness(String illNess) {
		
		return doctorDao.queryDoctorByIllness(illNess);
	}

	@Override
	public List<Doctor> queryDoctorByDoctorName(String doctorName) {
		// TODO Auto-generated method stub
		return doctorDao.queryDoctorByDoctorName(doctorName);
	}

}
