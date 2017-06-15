package com.admin.mml.action;

import java.util.List;

import com.opensymphony.xwork2.Action;
import com.whx.bean.User;
import com.whx.dao.UserDao;


public class AdminUserAction implements Action{
	private UserDao userDao;
	//�û�Id
	private Integer userId;
	//��ǰҳ
	private Integer pageIndex;
	//�ܼ�¼��
	private Integer count;
	//��ҳ��
	private Integer totalPages;
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
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

	private List <User> uList;
	public List<User> getuList() {
		return uList;
	}

	public void setuList(List<User> uList) {
		this.uList = uList;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public String execute() throws Exception {
		int pageSize = 10;
		if(pageIndex==null){
		  pageIndex=1;
		}
		uList= userDao.findAllUser(pageSize, pageIndex);
		count = userDao.getTotalCount();
		totalPages =getTotalPages(count,10);
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
	public  String deleteUserByUserId(){
		//ɾ��User
		userDao.deleteUserByUserId(userId);
		//ɾ���󷵻��б���ҳ
		int pageSize = 10;
		if(pageIndex==null){
		  pageIndex=1;
		}
		uList= userDao.findAllUser(pageSize, pageIndex);
		count = userDao.getTotalCount();
		totalPages =getTotalPages(count,10);
		return SUCCESS;
	}
}
