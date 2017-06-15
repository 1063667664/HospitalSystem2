package com.whx.action.hospitalInit;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.whx.bean.User;
import com.whx.dao.BookingDao;
import com.whx.bean.Registration;

public class BookingAction implements Action {
	private BookingDao bookingDao;
    private int balance;
    private String state;
    private String tip;
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName=(String) request.getSession().getAttribute("userName");
		String regfee=request.getParameter("regfee");
		String date=request.getParameter("date");
		User user=bookingDao.findByName(userName);
		balance=user.getBalance();
		if(regfee==null||regfee.isEmpty()||Integer.parseInt(regfee)>balance){
			tip="你的积分不足，支付失败，请赶快充值";
			return INPUT;
		}
		else{
			tip="付款成功";
			state="已付款";
	    Registration re=new Registration();	
	    re=bookingDao.findByUserName(userName,date);
	    re.setState(state);
	    bookingDao.UpdateRegistrationSate(re);
		user.setBalance(balance-Integer.parseInt(regfee));
		bookingDao.UpdateUserBalance(user);
		return SUCCESS;
		}
	}
	public BookingDao getBookingDao() {
		return bookingDao;
	}
	public void setBookingDao(BookingDao bookingDao) {
		this.bookingDao = bookingDao;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	

}
