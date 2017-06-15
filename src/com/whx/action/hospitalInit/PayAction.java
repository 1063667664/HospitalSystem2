package com.whx.action.hospitalInit;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.whx.dao.PayDao;
import com.whx.dao.RegisterOrderDao;
import com.whx.dao.UserDao;
import com.whx.service.UserService;
import com.whx.bean.User;
import com.whx.bean.Registration;

public class PayAction implements Action {
	private PayDao payDao;
	private UserService userService;
	private Registration registeration;
	private String tip2;
	private String RId;
    private User user;
    List<Registration> re;
    public List<Registration> getRe() {
		return re;
	}
	public void setRe(List<Registration> re) {
		this.re = re;
	}
	private RegisterOrderDao registerOrderDao;
	public RegisterOrderDao getRegisterOrderDao() {
		return registerOrderDao;
	}
	public void setRegisterOrderDao(RegisterOrderDao registerOrderDao) {
		this.registerOrderDao = registerOrderDao;
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
	public PayDao getPayDao() {
		return payDao;
	}
	public void setPayDao(PayDao payDao) {
		this.payDao = payDao;
	}
	public Registration getRegisteration() {
		return registeration;
	}

	public void setRegisteration(Registration registeration) {
		this.registeration = registeration;
	}
	public String getTip2() {
		return tip2;
	}
	public void setTip2(String tip2) {
		this.tip2 = tip2;
	}
	public String getRId() {
		return RId;
	}
	public void setRId(String rId) {
		RId = rId;
	}
	@Override
	public String execute() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
	    RId=request.getParameter("RId");
	    
	    registeration=payDao.queryById(Integer.parseInt(RId));
	    String state=registeration.getState();
	    if(state.equals("已付款")){
	    	tip2="该订单你已付款";
	    	return INPUT;
	    }
	    else{
	    return SUCCESS;
	    }
	}
	public String userJiaofei() throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName=(String) request.getSession().getAttribute("userName");
		user=new User();
		user=userService.findUserByUserName(userName);
		re=registerOrderDao.selectRegistrationOrder(userName, "未付款");
		return SUCCESS;
	}
}
