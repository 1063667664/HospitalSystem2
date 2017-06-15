package com.whx.action.login;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.whx.bean.User;
import com.whx.service.UserService;
public class LoginAction extends ActionSupport{
	protected String userName;
	protected String userPwd;
	protected String newpwd1;
	protected String newpwd2;
	protected String safecode;
	protected UserService userService;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getNewpwd1() {
		return newpwd1;
	}
	public void setNewpwd1(String newpwd1) {
		this.newpwd1 = newpwd1;
	}
	public String getNewpwd2() {
		return newpwd2;
	}
	public void setNewpwd2(String newpwd2) {
		this.newpwd2 = newpwd2;
	}
	public String getSafecode() {
		return safecode;
	}
	public void setSafecode(String safecode) {
		this.safecode = safecode;
	}
	public String execute(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("userName", userName);
		if (session.getAttribute("securityCode") == null) {
			return ERROR;
		}
		// 获得图形校验码
	   String sf = (String) session.getAttribute("securityCode");
	    if(userName==null||userName.equals("")||userName.length()==0){
	    	 addActionError(getText("loginerror"));
	    	 return ERROR;
	    }   
	    if(sf.equals(safecode)){
	    	User u=	userService.findUser(userName, userPwd);
	    	 //如果用户名和密码查询结果为空，则用户名不存在或密码不正确。
	    	 if(u==null){
	 	    	addActionError(getText("loginerror"));
	 	    	System.out.println("whx---------"+safecode);
	 			return ERROR;
	 	    }
	 	    else{
	 	    	return SUCCESS;
	 	    }
	    }else{
		    	addActionError(getText("codeerror"));
				return ERROR;
	    }
	}

}
