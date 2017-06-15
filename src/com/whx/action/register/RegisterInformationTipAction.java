package com.whx.action.register;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.service.UserService;
//处理注册的action
public class RegisterInformationTipAction extends ActionSupport{
	private static final int BUFFER_SIZE = 16 * 1024;
	private File myFile; //上传文件
	private String  myFileFileName;  //上传文件名
	private String imageFileName;
	private  UserService userService;
	private String tip;
	private String passwordTip;  //提示密码是否正确
	private String rePasswordTip;  //提示两次密码是否一致 
	private String realNameTip; //提示真实姓名格式是否正确
	private String idCardTip;  //提示身份证格式是否正确
	private String addressTip; //提示地址是否正确
	private String telephoneTip; //提示手机号码是否正确
	private String verifyCodeTip; //提示验证码是否正确
	private String myFileTip; //提示用户是否已选择文件
	public String getVerifyCodeTip() {
		return verifyCodeTip;
	}
	public String getMyFileTip() {
		return myFileTip;
	}
	public void setMyFileTip(String myFileTip) {
		this.myFileTip = myFileTip;
	}
	public void setVerifyCodeTip(String verifyCodeTip) {
		this.verifyCodeTip = verifyCodeTip;
	}
	public String getRealNameTip() {
		return realNameTip;
	}
	public String getTelephoneTip() {
		return telephoneTip;
	}
	public void setTelephoneTip(String telephoneTip) {
		this.telephoneTip = telephoneTip;
	}
	public String getAddressTip() {
		return addressTip;
	}
	public void setAddressTip(String addressTip) {
		this.addressTip = addressTip;
	}
	public String getIdCardTip() {
		return idCardTip;
	}
	public void setIdCardTip(String idCardTip) {
		this.idCardTip = idCardTip;
	}
	public void setRealNameTip(String realNameTip) {
		this.realNameTip = realNameTip;
	}
	public String getRePasswordTip() {
		return rePasswordTip;
	}
	public void setRePasswordTip(String rePasswordTip) {
		this.rePasswordTip = rePasswordTip;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
	public String getPasswordTip() {
		return passwordTip;
	}
	public void setPasswordTip(String passwordTip) {
		this.passwordTip = passwordTip;
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public File getMyFile() {
		return myFile;
	}
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}
	private  static void copy(File src,File dst){
		try {
			InputStream in = null ;
			OutputStream out = null ;
			try {
			in = new BufferedInputStream( new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream( new FileOutputStream(dst), BUFFER_SIZE);
			byte [] buffer = new byte [BUFFER_SIZE];
			while (in.read(buffer) > 0 ) {
			out.write(buffer);
			}
			} finally {
			if ( null != in) {
			in.close();
			}
			if ( null != out) {
			out.close();
			}
			}
			} catch (Exception e) {
			e.printStackTrace();
			}
			}
	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		System.out.println("pos****"+pos);
		 return fileName.substring(pos);
		}
	public String execute() {
		imageFileName = new Date().getTime() + getExtention(myFileFileName);
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath("uploadImages" ) + "/" + imageFileName);
		copy(myFile, imageFile);	
		return SUCCESS;
	}
	public String isUserNameFit(){
		String userName=ServletActionContext.getRequest().getParameter("userName");
		System.out.println("用户名"+userName);
		if(userName==null||userName.trim().length()==0){
			setTip("用户名不能为空");
		}
		else if(userService.isUserNameExit(userName)){
			setTip("该用户已存在");
		}
		else if(!userName.matches("[a-zA-Z0-9]{3,11}")){
			setTip("用户名只能由3-12位数字或字母组成");
		} 
		else{
			setTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(tip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return null;
	}
	public String isPasswordFit(){
		String password=ServletActionContext.getRequest().getParameter("password");
		System.out.println("密码"+password);
		if(password==null||password.trim().length()==0){
			this.setPasswordTip("密码不能为空");
		}
		else if(!password.matches("^.{6,20}$")){
			this.setPasswordTip("用户名只能由6-12位数字或字母组成");
		}
		else{
			this.setPasswordTip("√");
		}
			try {
				ServletActionContext.getResponse().setCharacterEncoding("utf-8");
				ServletActionContext.getResponse().getWriter().print(passwordTip);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		return null;
	}
	public String isTheTwoPasswordsSame(){
		String password=ServletActionContext.getRequest().getParameter("password");
		String ackpassword=ServletActionContext.getRequest().getParameter("ackpassword");
		System.out.println("确认密码"+ackpassword);
		if(ackpassword==null||ackpassword.trim().length()==0){
			this.setRePasswordTip("确认密码不能为空");
		}
		else if(!ackpassword.equals(password)){
			this.setRePasswordTip("两次密码不一致");
		}
		else{
			this.setRePasswordTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(rePasswordTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isRealNameFormatRight(){
		String realName=ServletActionContext.getRequest().getParameter("realName");
		if(realName==null||realName.trim().length()==0){
			this.setRealNameTip("真实姓名不能为空");
		}
		else if(!realName.matches("[\u4e00-\u9fa5]{2,4}")){
			this.setRealNameTip("真实姓名只能由两个至四个中文字组成");
		}
		else {
			this.setRealNameTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(realNameTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isIDCardFormatRight(){
		String IDCard=ServletActionContext.getRequest().getParameter("IDCard");
		if(IDCard==null||IDCard.trim().length()==0){
			this.setIdCardTip("身份证不能为空");
		}
		else if(!IDCard.matches("(\\d{14}[0-9a-zA-Z])|(\\d{17}[0-9a-zA-Z])")){
			this.setIdCardTip("请输入15或18位身份证号码");		
		}
		else {
			this.setIdCardTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(idCardTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isAddressFormatRight(){
		String address=ServletActionContext.getRequest().getParameter("address");
		if(address==null||address.trim().length()==0){
			this.setAddressTip("地址不能为空");
		}
		else{
			this.setAddressTip("√");	
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(addressTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isTelephoneFormatRight(){
		String telephone=ServletActionContext.getRequest().getParameter("telephone");
		if(telephone==null||telephone.trim().length()==0){
			this.setTelephoneTip("手机号码不能为空");
		}
		else if(!telephone.matches("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$")){
			this.setTelephoneTip("手机号码格式不正确");
		}
		else{
			this.setTelephoneTip("√");	
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(telephoneTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isVerifyCodeRight(){
		String verifyCode=ServletActionContext.getRequest().getParameter("verifyCode");
		HttpSession session=ServletActionContext.getRequest().getSession();
		if(verifyCode==null||verifyCode.length()==0){
			this.setVerifyCodeTip("验证码不能为空");
		}
		else if(!session.getAttribute("securityCode").equals(verifyCode)){
			this.setVerifyCodeTip("验证码不正确");
		}
		else{
			this.setVerifyCodeTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(verifyCodeTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public String isFileNotNull(){
		String myFileName=ServletActionContext.getRequest().getParameter("myFileName");
		System.out.print("文件名******"+myFileName);
		String suffixName="";
		if(!(myFileName==null||myFileName.length()==0)){
		 suffixName=myFileName.substring(myFileName.lastIndexOf("."));
		}	
		if(myFileName==null||myFileName.length()==0){
			this.setMyFileTip("请上传头像");
			
		}
		else if(!suffixName.matches(".(jpg|png|gif|PNG)")){
			
			this.setMyFileTip("图片后缀名不对");
		}
		else {
			System.out.print("文件名--------"+myFileName);
			this.setMyFileTip("√");
		}
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			ServletActionContext.getResponse().getWriter().print(myFileTip);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

}
