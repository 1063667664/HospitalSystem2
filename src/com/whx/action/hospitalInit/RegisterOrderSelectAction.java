package com.whx.action.hospitalInit;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.whx.dao.BookingDao;
import com.whx.dao.RegisterOrderDao;
import com.whx.service.UserService;
import com.whx.bean.Registration;
import com.whx.bean.User;

public class RegisterOrderSelectAction implements Action {
	private BookingDao bookingDao;
	private List<Registration> re;
	private RegisterOrderDao registerOrderDao;
	private User user;
	private UserService userService;
	private String hospitalName;
	private String date;
	public String getHospitalName() {
		return hospitalName;
	}
	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	private String tip;
	public BookingDao getBookingDao() {
		return bookingDao;
	}
	public void setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
	}
	public List<Registration> getRe() {
		return re;
	}
	public void setRe(List<Registration> re) {
		this.re = re;
	}
	public RegisterOrderDao getRegisterOrderDao() {
		return registerOrderDao;
	}
	public void setRegisterOrderDao(RegisterOrderDao registerOrderDao) {
		this.registerOrderDao = registerOrderDao;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		re=new ArrayList<Registration>();
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName=(String) request.getSession().getAttribute("userName");
		//查询该用户的所有预约挂号单
		re=bookingDao.findRegistrationByUserName(userName);
		return SUCCESS;
	}
	public String deleteRegistrtion()throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String RId=request.getParameter("RId");
		registerOrderDao.deleteRegisterById(Integer.parseInt(RId));
		tip="订单"+RId+"删除成功";
		return SUCCESS;
	}
	//缴费管理的删除订单
	public String deleteRegistrtionPay()throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String RId=request.getParameter("RId");
		registerOrderDao.deleteRegisterById(Integer.parseInt(RId));
		String userName=(String) request.getSession().getAttribute("userName");
		user=userService.findUserByUserName(userName);
		tip="订单"+RId+"删除成功";
		String state=request.getParameter("state");
		re=registerOrderDao.selectRegistrationOrder(userName, state);
		return SUCCESS;
	}
	
	public String selectRegistrationOrder() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName=(String) request.getSession().getAttribute("userName");
		user=userService.findUserByUserName(userName);
		hospitalName=request.getParameter("hospitalName");
		String state=request.getParameter("state");
		if(state==null||state.length()==0){
			state="未付款";
		}
	    date=request.getParameter("date");
		System.out.println("日期"+date);
		re=registerOrderDao.selectRegistrationOrderByParam(userName, hospitalName, date, state);
		System.out.println("结果"+re);
		return SUCCESS;
	}
	public String selectRegistrationOrderByState() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		//用户信息
		String userName=(String) request.getSession().getAttribute("userName");
		user=userService.findUserByUserName(userName);
		
		String state=request.getParameter("state");
		System.out.println("状态"+state);
		re=registerOrderDao.selectRegistrationOrder(userName, state);
		
		return SUCCESS;
	}

}
