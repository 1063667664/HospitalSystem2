package com.admin.mml.action;

import com.opensymphony.xwork2.Action;

public class AdminLoginAction implements Action {
	
	private String userName;
	private String userPw;
    private  String  message;
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(!userName.equals("admin")){
			this.setMessage("ÓÃ»§Ãû´íÎó");
			return INPUT;
		}
		else if(!userPw.equals("admin")){
			this.setMessage("ÃÜÂë´íÎó");
			return INPUT;
		}
		return SUCCESS;
	}

}
