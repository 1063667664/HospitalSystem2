package com.whx.action.register;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.bean.User;
import com.whx.service.UserService;
import com.whx.util.EmailUtils;
import com.whx.util.GenerateLinkUtils;

public class RegisterAddUserAction extends ActionSupport {
	private static final int BUFFER_SIZE = 16 * 1024;
	private static Map<String, User> users = new HashMap<String, User>();
	private String userName;
	private String password;
	private String realName;

	public static Map<String, User> getUsers() {
		return users;
	}

	public static void setUsers(Map<String, User> users) {
		RegisterAddUserAction.users = users;
	}

	private String idcard;
	private String address;
	private String telephone;
	private String imageUrl;
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	private String sex;
	private File myFile; // 上传文件
	private String myFileFileName; // 上传文件名
	private UserService userService;

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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
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

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public String getMyFileFileName() {
		return myFileFileName;
	}

	public void setMyFileFileName(String myFileFileName) {
		int pos = myFileFileName.lastIndexOf(".");
		this.myFileFileName = new Date().getTime()
				+ myFileFileName.substring(pos);
	}

	public String execute() throws Exception {
		String path = ServletActionContext.getServletContext().getRealPath(
				"/upload");
		File f = new File(new File(path), this.getMyFileFileName());
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdir();
		}
		uploadImages(myFile, f);
		User user = new User();
		user.setAddress(address);
		user.setBirthday(getBirthdayFromIDCard(idcard));
		user.setIdentificationId(idcard);
		user.setSex(sex);
		user.setTel(telephone);
		user.setUserName(userName);
		user.setUserPwd(password);
		user.setUserRealname(realName);
		user.setBalance(50);
		user.setImageUrl(ServletActionContext.getRequest().getContextPath()
				+ "/upload/" + this.getMyFileFileName());
		user.setActivated("0");
		user.setEmail(email);
		// 添加用户到map中保存，用户名唯一，所以拿用户名做key。
		users.put(user.getUserName(), user);
		// userService.addRegisterUser(user);

		EmailUtils.sendAccountActivateEmail(user);

		// userService.addRegisterUser(user);
		return SUCCESS;
	}

	public String activateAccount() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String userName = request.getParameter("userName");

		User user = users.get(userName);
		if (user != null) {
			boolean b = GenerateLinkUtils.verifyCheckcode(user, request);
			if (b == true) {
				user.setActivated("1");
				userService.addRegisterUser(user);
				request.getSession().setAttribute("userName", userName);
				return SUCCESS;
			} else  {
				user.setActivated("0");
				return INPUT;
			}		
		}
		return INPUT;
	}

	public Date getBirthdayFromIDCard(String idcard) throws Exception {
		String birth = "";
		if (!(idcard == null || idcard.length() == 0)) {
			birth = idcard.substring(6, 14);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String formatBirth = birth.substring(0, 4) + "-"
					+ birth.substring(4, 6) + "-" + birth.substring(6);
			date = sdf.parse(formatBirth);
			return date;
		} else {
			return null;
		}
	}

	private void uploadImages(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
