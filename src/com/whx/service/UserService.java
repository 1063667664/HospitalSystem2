package com.whx.service;
import com.whx.dao.UserDao;
import com.whx.bean.User;
public class UserService {
	private UserDao userDao;
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public User findUser(String name, String password) {
		return userDao.findUser(name, password);
	}
	public User findUserByUserName(String userName){
		return userDao.findUserByName(userName);
	}
	public boolean isUserNameExit(String userName){
		return userDao.isUserNameExit(userName);	
	}
	public void addRegisterUser(User user){
		 userDao.addRegisterUser(user);
	}
	public void updateUser(User user){
		userDao.updateUser(user);
	}
	public User findUserById(Integer userId){
		return userDao.findUserById(userId);
	}
}
