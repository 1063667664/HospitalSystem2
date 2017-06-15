package com.whx.validCode;
import java.io.ByteArrayInputStream;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class ValidCodeAction extends ActionSupport {
	private static final long serialVersionUID = 5633780176793520460L;
	//Í¼Æ¬Á÷
	private ByteArrayInputStream imageStream;
	@Override
	public String execute()throws Exception {
		HttpServletRequest request=ServletActionContext.getRequest();
		String securityCode = SecurityCode.getSecurityCode();
		imageStream = SecurityImage.getImageAsInputStream(securityCode);
		request.getSession().setAttribute("securityCode", securityCode);	
		return SUCCESS;	
	}
	public ByteArrayInputStream getImageStream() {
		return imageStream;
	}
	public void setImageStream(ByteArrayInputStream imageStream) {
		this.imageStream = imageStream;
	}
}
