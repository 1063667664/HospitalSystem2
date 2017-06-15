package com.whx.dao;

import java.util.List;

import com.whx.bean.Department;

public interface DepartmentDao {
	public List<Department> queryDepartmentByHospitalId(Integer hospitalId);
    public  List<Department> findAllDepartments(int pageSize, int pageIndex);
    /**
     * 查询单个医院总页数
     * @return
     */
	public int getTotalCount(Integer hospitalId);
	public List<Department> queryDeptAndPage(int pageSize, int pageIndex,Integer hospitalId);
	public boolean verifyDeptNameIsExist(Integer hospitalId,String name);
	public void addDepartment(Department department);
	public void delDepartmentByDepartmentId(Integer departmentId );
	public Department queryDeptByDeptId(Integer departmentId);
}
