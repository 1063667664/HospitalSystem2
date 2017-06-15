package com.admin.mml.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Department;
import com.whx.bean.Hospital;
import com.whx.dao.DepartmentDao;
import com.whx.dao.HospitalDao;

public class AdminDepartmentAction implements Action {
	private String hospitalName;
	private Integer departmentId;
	public Integer getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(Integer departmentId) {
		this.departmentId = departmentId;
	}
	private String addDeptTip;
	public String getAddDeptTip() {
		return addDeptTip;
	}
	public void setAddDeptTip(String addDeptTip) {
		this.addDeptTip = addDeptTip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public List<Hospital> gethList() {
		return hList;
	}
	public void sethList(List<Hospital> hList) {
		this.hList = hList;
	}
    private Integer hospitalId;
    //科室名称
    private String name;
	public Integer getHospitalId() {
		return hospitalId;
	}
	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}
	private DepartmentDao departmentDao;
	private HospitalDao hospitalDao;
	//医院列表
	private List<Hospital> hList;
	public HospitalDao getHospitalDao() {
		return hospitalDao;
	}
	public void setHospitalDao(HospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}

	private List<Department> depLists;
	//当前页
	private Integer pageIndex;
	//总记录数
	private Integer count;
	//总页数
	private Integer totalPages;

	public Integer getCount() {
		return count;
	}
	public Integer getTotalPages() {
		return totalPages;
	}
	private int getTotalPages(int count ,int pageSize){
		int totalPages = 0;
		totalPages = (count%pageSize==0)?(count/pageSize):(count/pageSize+1);
		return totalPages;
	}
	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public List<Department> getDepLists() {
		return depLists;
	}

	public void setDepLists(List<Department> depLists) {
		this.depLists = depLists;
	}

	public DepartmentDao getDepartmentDao() {
		return departmentDao;
	}

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		int pageSize = 5;
		if(pageIndex==null){
		  pageIndex=1;
		}
		hList = hospitalDao.findAllHospital(pageSize, pageIndex);
		count = hospitalDao.getTotalCount();
		totalPages =getTotalPages(count,5);
		return SUCCESS;
	}
	public  String findAllDepartmentByHospitalId(){
		int pageSize = 6;
		if(pageIndex==null){
			  pageIndex=1;
			}
		depLists = departmentDao.queryDeptAndPage(pageSize, pageIndex, hospitalId);
		count = departmentDao.getTotalCount(hospitalId);
		totalPages =getTotalPages(count,6);
		//获得医院名称。
		hospitalName = hospitalDao.queryForHospital(hospitalId).getName();
		return SUCCESS;
	}
	//跳转到新增科室页面
	public String frowardAddDeptPage(){	
		return SUCCESS;
	}
	public String addDepartment(){
		Department department = new Department();
		Hospital hospital = hospitalDao.queryForHospital(hospitalId);
		if(hospital==null){
			return INPUT;
		}
		if(departmentDao.verifyDeptNameIsExist(hospitalId, name)){
			addDeptTip = "该科室已存在";
			return INPUT;
		}
		department.setName(name);
		department.setHospital(hospital);
		departmentDao.addDepartment(department);
		addDeptTip = "添加科室成功";
		return SUCCESS;
		
	}
	public  String delDepartment(){
		//删除科室
		departmentDao.delDepartmentByDepartmentId(departmentId);
		//删除可是后返回首页
		int pageSize = 6;
		if(pageIndex==null){
		  pageIndex=1;
		}
		depLists = departmentDao.queryDeptAndPage(pageSize, pageIndex, hospitalId);
		count = departmentDao.getTotalCount(hospitalId);
		totalPages =getTotalPages(count,6);
		//获得医院名称。
		hospitalName = hospitalDao.queryForHospital(hospitalId).getName();
		return SUCCESS;
	}

}
