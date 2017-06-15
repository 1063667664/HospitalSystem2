package com.admin.mml.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Hospital;
import com.whx.bean.User;
import com.whx.dao.HospitalDao;
import com.whx.dao.UserDao;

public class AdminHospitalAction implements Action{
	    private Integer hospitalId;
	    private Hospital hospital;
	    public Hospital getHospital() {
			return hospital;
		}

		public void setHospital(Hospital hospital) {
			this.hospital = hospital;
		}

		public Integer getHospitalId() {
			return hospitalId;
		}

		public void setHospitalId(Integer hospitalId) {
			this.hospitalId = hospitalId;
		}
		private HospitalDao hospitalDao;
	    public HospitalDao getHospitalDao() {
			return hospitalDao;
		}

		public void setHospitalDao(HospitalDao hospitalDao) {
			this.hospitalDao = hospitalDao;
		}
		//当前页
		private Integer pageIndex;
		//总记录数
		private Integer count;
		//总页数
		private Integer totalPages;
		//医院列表
		private List<Hospital> hList;
		public List<Hospital> gethList() {
			return hList;
		}

		public void sethList(List<Hospital> hList) {
			this.hList = hList;
		}

		public Integer getCount() {
			return count;
		}

		public void setCount(Integer count) {
			this.count = count;
		}

		public Integer getPageIndex() {
			return pageIndex;
		}

		public void setPageIndex(Integer pageIndex) {
			this.pageIndex = pageIndex;
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
		public Integer getTotalPages() {
			return totalPages;
		}

		private int getTotalPages(int count ,int pageSize){
			int totalPages = 0;
			totalPages = (count%pageSize==0)?(count/pageSize):(count/pageSize+1);
			return totalPages;
		}
		public String queryHospitalByHospitalId(){
			hospital = hospitalDao.queryForHospital(hospitalId);
			return SUCCESS;
		}
		public  String  checkEditHospitalByHospitalId(){
			System.out.print("********");
			hospital = hospitalDao.queryForHospital(hospitalId);
			return SUCCESS;
		}
		public String deleteHospitalByByHospitalId(){
			hospitalDao.deleteHospital(hospitalId);
			int pageSize = 5;
			if(pageIndex==null){
			  pageIndex=1;
			}
			hList = hospitalDao.findAllHospital(pageSize, pageIndex);
			count = hospitalDao.getTotalCount();
			totalPages =getTotalPages(count,5);
			return SUCCESS;
		}
		

}
