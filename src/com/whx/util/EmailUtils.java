package com.whx.util;

import java.io.IOException;  
import java.io.InputStream;  
import java.util.Date;  
import java.util.Properties;  
import javax.mail.Authenticator;  
import javax.mail.Message.RecipientType;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
import com.whx.bean.User;
public class EmailUtils {
	
	private static final String FROM = "2059657480@qq.com";
	
	/** 
     * 注册成功后,向用户发送帐户激活链接的邮件 
     * @param user 未激活的用户 
     */ 
	public static void sendAccountActivateEmail(User user){
		Session session = getSession();
		session.setDebug(true);
		MimeMessage message = new MimeMessage(session);
		  try {  
	            message.setSubject("挂号系统帐户激活邮件");  
	            message.setSentDate(new Date());  
	            message.setFrom(new InternetAddress(FROM));  
	            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
	            message.setContent("<a href='" + GenerateLinkUtils.generateActivateLink(user)+"'>点击激活挂号系统帐户</a>","text/html;charset=utf-8");  
	            // 发送邮件  
	            Transport.send(message);  
	        } catch (Exception e) {  
	            e.printStackTrace();  
	        }  
	    } 
	 /** 
     * 发送重设密码链接的邮件 
     */  
    public static void sendResetPasswordEmail(User user) {  
        Session session = getSession();  
        MimeMessage message = new MimeMessage(session);  
        try {  
            message.setSubject("找回您的帐户与密码");  
            message.setSentDate(new Date());  
            message.setFrom(new InternetAddress(FROM));  
            message.setRecipient(RecipientType.TO, new InternetAddress(user.getEmail()));  
            message.setContent("要使用新的密码, 请使用以下链接启用密码:<br/><a href='" + GenerateLinkUtils.generateResetPwdLink(user) +"'>点击重新设置密码</a>","text/html;charset=utf-8");  
            // 发送邮件  
            Transport.send(message);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
    }  
      
    public static Session getSession() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.qq.com");
		props.setProperty("mail.smtp.port", "25");
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.smtp.starttls.enable", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				
				return new PasswordAuthentication(FROM, "yxmrlwukrszdbcia");
			}
			
		});
		return session;
	}
	
}
