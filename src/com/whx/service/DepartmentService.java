package com.whx.service;

import java.util.List;

import com.whx.bean.Department;

public interface DepartmentService {
	public List<Department> queryDepartmentByHospitalId(Integer hospitalId);

}
