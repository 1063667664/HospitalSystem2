package com.whx.service;
import java.util.List;

import com.whx.bean.Hospital;
import com.whx.paging.PageBean;
public interface HospitalService {
	public PageBean queryForPage(int pageSize,int currentPage);
	public PageBean queryForPageH(int pageSize,int currentPage,String hospitalName);
	public PageBean queryForPageH2(int pageSize,int currentPage,String property);
	public PageBean queryForPageH3(int pageSize,int currentPage,String area);
	public PageBean queryForPageH4(int pageSize,int currentPage,String rank);
	public Hospital queryForHospital(Integer id);
}
