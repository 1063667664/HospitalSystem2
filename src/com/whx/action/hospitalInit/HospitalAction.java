package com.whx.action.hospitalInit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Department;
import com.whx.bean.Hospital;
import com.whx.dao.DepartmentDao;
import com.whx.service.DepartmentService;
import com.whx.service.HospitalService;

public class HospitalAction implements Action {

	private Hospital hospital;
	private HospitalService hospitalService;
	private DepartmentService departmentService;
	private List<Department> listDepartment;

	public List<Department> getListDepartment() {
		return listDepartment;
	}
	public void setListDepartment(List<Department> listDepartment) {
		this.listDepartment = listDepartment;
	}
	public DepartmentService getDepartmentService() {
		return departmentService;
	}
	public void setDepartmentService(DepartmentService departmentService) {
		this.departmentService = departmentService;
	}
	public Hospital getHospital() {
		return hospital;
	}
	public HospitalService getHospitalService() {
		return hospitalService;
	}
	public void setHospitalService(HospitalService hospitalService) {
		this.hospitalService = hospitalService;
	}
	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}
	
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.getParameter("id");
        hospital=hospitalService.queryForHospital(Integer.parseInt(request.getParameter("id")));
        listDepartment=departmentService.queryDepartmentByHospitalId(Integer.parseInt(request.getParameter("id")));
		System.out.print("listDepartment"+listDepartment);
		return SUCCESS;
	}
	

}
