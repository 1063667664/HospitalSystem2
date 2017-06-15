package com.whx.service;

import java.util.List;
import com.whx.dao.HospitalDao;
import com.whx.bean.Hospital;
import com.whx.paging.PageBean;

public class HospitalServiceImpl implements HospitalService {
	
    private HospitalDao hospitalDao;
    
    public void setHospitalDao(HospitalDao hospitalDao){
    	this.hospitalDao=hospitalDao;
    }
    
	@Override
	public PageBean queryForPage(int pageSize, int page) {
	  final String hql="from Hospital";
	  int allRow =hospitalDao.getAllRowCount(hql);
	  int totalPage=PageBean.countTotalPage(pageSize, allRow);
	  final int offset = PageBean.countOffset(pageSize, page);
	  final int length = pageSize;//每页记录数
	  final int currentPage = PageBean.countCurrentPage(page);
	  List<Hospital> list =hospitalDao.queryForPage(hql,offset, length);//"一页"的记录
	  PageBean pageBean = new PageBean();
	  pageBean.setPageSize(pageSize);
	  pageBean.setCurrentPage(currentPage);
	  pageBean.setAllRow(allRow);
	  pageBean.setTotalPage(totalPage);
	  pageBean.setList(list);
	  pageBean.init();
	  return pageBean;
	}
	
	@Override
	public Hospital queryForHospital(Integer id) {
		return hospitalDao.queryForHospital(id);
	}
	@Override
	public PageBean queryForPageH(int pageSize, int page,String hospitalName) {
		final String hql="from Hospital h where h.name like ?";
		int allRow =hospitalDao.getAllRowCount(hql,hospitalName);
		int totalPage=PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;//每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Hospital> list =hospitalDao.queryForPage(hql,offset, length,hospitalName);//"一页"的记录
		PageBean pageBean = pageBeanPropertyToPagebean(pageSize,
				currentPage, allRow, totalPage,list);
		return pageBean;
	}
	public PageBean queryForPageH2(int pageSize, int page,String property) {
		final String hql="from Hospital h where h.property like ?";
		int allRow =hospitalDao.getAllRowCount(hql,property);
		int totalPage=PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;//每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Hospital> list =hospitalDao.queryForPage(hql,offset, length,property);//"一页"的记录
		PageBean pageBean = pageBeanPropertyToPagebean(pageSize,
				currentPage, allRow, totalPage,list);
		return pageBean;
	}
	public PageBean queryForPageH3(int pageSize, int page,String area) {
		final String hql="from Hospital h where h.address like ?";
		int allRow =hospitalDao.getAllRowCount(hql,area);
		int totalPage=PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;//每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Hospital> list =hospitalDao.queryForPage(hql,offset, length,area);//"一页"的记录
		PageBean pageBean = pageBeanPropertyToPagebean(pageSize,
				currentPage, allRow, totalPage,list);
		return pageBean;
	}
	public PageBean queryForPageH4(int pageSize, int page,String rank) {
		final String hql="from Hospital h where h.rank like ?";
		int allRow =hospitalDao.getAllRowCount(hql,rank);
		int totalPage=PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, page);
		final int length = pageSize;//每页记录数
		final int currentPage = PageBean.countCurrentPage(page);
		List<Hospital> list =hospitalDao.queryForPage(hql,offset, length,rank);//"一页"的记录
		PageBean pageBean = pageBeanPropertyToPagebean(pageSize,
				currentPage, allRow, totalPage,list);

		return pageBean;
	}
	private PageBean pageBeanPropertyToPagebean(int pageSize,
			int currentPage,int allRow,int totalPage,List list){		
		PageBean pageBean = new PageBean();
		if(list!=null){
		 pageBean.setPageSize(pageSize);
		 pageBean.setCurrentPage(currentPage);
		 pageBean.setAllRow(allRow);
		 pageBean.setTotalPage(totalPage);
		 pageBean.setList(list);
		 pageBean.init();	 
		 }
		return pageBean;
		
	}
	}
