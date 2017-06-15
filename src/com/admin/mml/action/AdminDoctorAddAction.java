package com.admin.mml.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Department;
import com.whx.bean.Doctor;
import com.whx.bean.Hospital;
import com.whx.dao.DepartmentDao;
import com.whx.dao.DoctorDao;
import com.whx.dao.HospitalDao;

public class AdminDoctorAddAction implements Action {
	 private String name;
	 private Integer hospitalId;
	 private Integer departmentId;
	 private String sex;
	 private String academicTitle;
	 private Integer regfee;
	 private String speciality;
	 private  DepartmentDao departmentDao;
     private HospitalDao hospitalDao;
     private DoctorDao doctorDao;
     private String addDoctorTip;
     private String updateDoctorTip;
     private Integer doctorId;
     private List<Department> departmentLists;
 	public List<Department> getDepartmentLists() {
		return departmentLists;
	}


	public void setDepartmentLists(List<Department> departmentLists) {
		this.departmentLists = departmentLists;
	}
	private Doctor doctor;
	public Doctor getDoctor() {
		return doctor;
	}


	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}


	public String getUpdateDoctorTip() {
		return updateDoctorTip;
	}


	public void setUpdateDoctorTip(String updateDoctorTip) {
		this.updateDoctorTip = updateDoctorTip;
	}


	public Integer getDoctorId() {
		return doctorId;
	}


	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}


	public String getAddDoctorTip() {
		return addDoctorTip;
	}


	public void setAddDoctorTip(String addDoctorTip) {
		this.addDoctorTip = addDoctorTip;
	}


	public DoctorDao getDoctorDao() {
		return doctorDao;
	}


	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}


	public String getSpeciality() {
		return speciality;
	}


	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}


	public HospitalDao getHospitalDao() {
		return hospitalDao;
	}


	public void setHospitalDao(HospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}


	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}


	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getHospitalId() {
		return hospitalId;
	}


	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}


	public Integer getDepartmentId() {
		return departmentId;
	}


	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getAcademicTitle() {
		return academicTitle;
	}


	public void setAcademicTitle(String academicTitle) {
		this.academicTitle = academicTitle;
	}


	public Integer getRegfee() {
		return regfee;
	}


	public void setRegfee(Integer regfee) {
		this.regfee = regfee;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		Doctor doctor = new Doctor();
		if(hospitalId==null||departmentId==null){
			return INPUT;
		}
		Department department = departmentDao.queryDeptByDeptId(departmentId);
		if(department==null){
			departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
			addDoctorTip="科室号不存在";
			return SUCCESS;
		}
		else if(department.getHospital()!=null){
			if(!department.getHospital().getHospitalId().equals(hospitalId)){
				addDoctorTip = "科室号"+departmentId+"不存在于该医院，新增失败";
				departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
				return SUCCESS;
			}
		}
		doctor.setDepartment(department);
		Hospital hospital = hospitalDao.queryForHospital(hospitalId);
		doctor.setHospital(hospital);
		doctor.setAcademicTitle(academicTitle);
		doctor.setName(name);
		doctor.setRegfee(regfee);
		doctor.setSex(sex);
		doctor.setPassword(String.valueOf(hospitalId)+String.valueOf(departmentId));
		doctor.setSpeciality(speciality);
		doctor.setSpeciality(speciality);
		doctorDao.addDoctor(doctor);
		addDoctorTip="添加医生成功";
		return SUCCESS;
	}
	public String updateDoctor(){
		if(hospitalId==null||doctorId==null){
			return INPUT;
		}
		else{
			if(departmentId==null){
				updateDoctorTip = "科室号不存在，更新失败";
				return SUCCESS;
			}
			else {
				Department department=departmentDao.queryDeptByDeptId(departmentId);
				if(department==null){
					updateDoctorTip = "科室号"+departmentId+"不存在，更新失败，请查看该医院存在的科室ID号";
					doctor = doctorDao.findDoctorById(doctorId);
					if(doctor==null){
						return INPUT;
					}
					departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
					return SUCCESS;
				}
				else if(!department.getHospital().getHospitalId().equals(hospitalId)){
					updateDoctorTip = "科室号"+departmentId+"不存在于该医院，更新失败";
					doctor = doctorDao.findDoctorById(doctorId);
					if(doctor==null){
						return INPUT;
					}
					departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
					return SUCCESS;
				}
				else{
					doctor = doctorDao.findDoctorById(doctorId);
					if(doctor==null){
						return INPUT;
					}
					else{
						Hospital hospital = hospitalDao.queryForHospital(hospitalId);
						if(hospital==null){
							return INPUT;
						}
						doctor.setAcademicTitle(academicTitle);
						doctor.setSex(sex);
						doctor.setDepartment(department);
						doctor.setSpeciality(speciality);
						doctor.setName(name);
						doctor.setRegfee(regfee);	
						doctor.setHospital(hospital);
						doctorDao.updateDoctor(doctor);
						updateDoctorTip = "更新医生信息成功";
						doctor = doctorDao.findDoctorById(doctorId);
						departmentLists = departmentDao.queryDepartmentByHospitalId(hospitalId);
						return  SUCCESS;
					}
				}
			}
		}
	}

}
