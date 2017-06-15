package com.whx.action.validators;
import com.opensymphony.xwork2.ActionSupport;
public class LoginValidate extends ActionSupport {
	private String name;
	private String password;
	private String safecode;
	public String getSafecode() {
		return safecode;
	}
	public void setSafecode(String safecode) {
		this.safecode = safecode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
