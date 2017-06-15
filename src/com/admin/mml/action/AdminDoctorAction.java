package com.admin.mml.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Department;
import com.whx.bean.Doctor;
import com.whx.bean.Hospital;
import com.whx.dao.DepartmentDao;
import com.whx.dao.DoctorDao;
import com.whx.dao.HospitalDao;

public class AdminDoctorAction implements Action {
	private HospitalDao hospitalDao;
	private Integer hospitalId;
	private String hositalName;
	private Integer doctorId;
	private Integer departmentId;
	private List<Department> departmentLists;
	private DepartmentDao departmentDao;
	private Doctor doctor;
	
	
	public Integer getDepartmentId() {
		return departmentId;
	}


	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}

	public Doctor getDoctor() {
		return doctor;
	}


	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}


	public Integer getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}


	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}


	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}


	public List<Department> getDepartmentLists() {
		return departmentLists;
	}


	public void setDepartmentLists(List<Department> departmentLists) {
		this.departmentLists = departmentLists;
	}


	public String getHositalName() {
		return hositalName;
	}


	public void setHositalName(String hositalName) {
		this.hositalName = hositalName;
	}


	public Integer getHospitalId() {
		return hospitalId;
	}


	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}


	private DoctorDao doctorDao;
	private List<Doctor> dList;
	public List<Doctor> getdList() {
		return dList;
	}


	public void setdList(List<Doctor> dList) {
		this.dList = dList;
	}


	public DoctorDao getDoctorDao() {
		return doctorDao;
	}


	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}


	public HospitalDao getHospitalDao() {
		return hospitalDao;
	}


	public void setHospitalDao(HospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}


	// 当前页
	private Integer pageIndex;
	// 总记录数
	private Integer count;
	// 总页数
	private Integer totalPages;
	

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


	public Integer getTotalPages() {
		return totalPages;
	}
	//医院列表
	private List<Hospital> hList;

	public List<Hospital> gethList() {
		return hList;
	}


	public void sethList(List<Hospital> hList) {
		this.hList = hList;
	}

	private int getTotalPages(int count ,int pageSize){
		int totalPages = 0;
		totalPages = (count%pageSize==0)?(count/pageSize):(count/pageSize+1);
		return totalPages;
	}
	@Override
	public String execute() throws Exception {
		int pageSize = 5;
		if(pageIndex==null){
		  pageIndex=1;
		}
		hList = hospitalDao.findAllHospital(pageSize, pageIndex);
		count = hospitalDao.getTotalCount();
		totalPages =getTotalPages(count,5);
		return SUCCESS;
	}
	public String checkDoctorsByHospitalId(){
		int pageSize = 10;
		if(pageIndex==null){
			pageIndex = 1;
		}
		dList = doctorDao.queryDoctorsByHospitalId(pageSize, pageIndex, hospitalId);
		if(dList.size()>0){
			hositalName = dList.get(0).getHospital().getName();
		}
		count = doctorDao.getTotalCount(hospitalId);
		totalPages = getTotalPages(count,10);
		return SUCCESS;
	}
	public String forwardAddDoctorPage(){
		if(hospitalId==null){
			return INPUT;
		}
		departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
		Hospital hospital=hospitalDao.queryForHospital(hospitalId);
		if(hospital!=null){
			hositalName = hospital.getName();	
		}	
		return SUCCESS;
	}
	public String checkDoctorByDoctorId(){
		if(doctorId==null){
			return INPUT;
		}
		else{
		doctor=	doctorDao.findDoctorById(doctorId);
		if(doctor!=null){
			if(doctor.getHospital()!=null){
			hospitalId = doctor.getHospital().getHospitalId();
			}
		}
		}
		return SUCCESS;
	}
	public String delDoctorByDoctorId(){
		if(doctorId==null||hospitalId==null){
			return INPUT;
		}
		else{
			doctorDao.delDoctorByDoctorId(doctorId);
			int pageSize = 10;
			if(pageIndex==null){
				pageIndex = 1;
			}
			dList = doctorDao.queryDoctorsByHospitalId(pageSize, pageIndex, hospitalId);
			if(dList.size()>0){
				hositalName = dList.get(0).getHospital().getName();
			}
			count = doctorDao.getTotalCount(hospitalId);
			totalPages = getTotalPages(count,10);
			return SUCCESS;
		}
	}
	public String editDoctor(){
		if(doctorId==null){
			return INPUT;
		}
		doctor = doctorDao.findDoctorById(doctorId);
		if(doctor!=null){
			Hospital hospital = doctor.getHospital();
			if(hospital!=null){
				hospitalId = hospital.getHospitalId();
				departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
			}
		}
		return SUCCESS;
	}


}
