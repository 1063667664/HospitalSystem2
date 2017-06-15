package com.whx.service;

import java.util.List;

import com.whx.bean.Department;
import com.whx.dao.DepartmentDao;

public class DepartmentServiceImpl implements DepartmentService {

	private DepartmentDao departmentDao;
	
	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public List<Department> queryDepartmentByHospitalId(Integer hospitalId) {
		// TODO Auto-generated method stub
		return departmentDao.queryDepartmentByHospitalId(hospitalId);
	}
	

}
