package com.whx.action.user;

import java.io.IOException;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.Action;
import com.whx.bean.User;
import com.whx.dao.UserDao;
import com.whx.util.DateStringChange;

public class UpdateUserAction implements Action {
	private String userName;
	private String userRealname;
	private String sex;
    private String address;
    private String telephone;
    private String identificationId;
    private String birthday;
    private UserDao userDao;
    private String userId;
    private User user;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserRealname() {
		return userRealname;
	}

	public void setUserRealname(String userRealname) {
		this.userRealname = userRealname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getIdentificationId() {
		return identificationId;
	}

	public void setIdentificationId(String identificationId) {
		this.identificationId = identificationId;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		user=userDao.findUserById(Integer.parseInt(userId));
		user.setAddress(address);	
		user.setBirthday(new DateStringChange().StringToDate(birthday));
		user.setIdentificationId(identificationId);
		user.setSex(sex);
		user.setTel(telephone);
		user.setUserId(user.getUserId());
		//user.setUserName(userName);
		userDao.updateUser(user);
		return SUCCESS;
	}
	public String getUserInfo(){
		User user=new User();
		if(userId!=null&&userId.length()!=0){
		    user=userDao.findUserById(Integer.parseInt(userId));
		   System.out.print(user.getUserName());
		}
	    this.setUser(user);
		return  SUCCESS;
	}
	
	 

}
