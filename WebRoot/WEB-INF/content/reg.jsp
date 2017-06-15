<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/register.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/register.js"></script>
</head>
<body>
<body bgcolor="#f0f0f0">
	<form action="registerAddUserAction.action" method="post"
		enctype="multipart/form-data">
		<div id="img_header">
			<img alt="whx" src="images/header.jpg" />
		</div>
		<div style="width:1500;height:20px;background:#0099FF;"></div>
		<div id="register">
			<div id="shuoming">
				<b>注册信息</b><font style="color:red">（*号为必填）</font>
			</div>
			<div style="margin-left:130px;margin-top:45px;">
				<font color=red>*</font> 用户名：<input type="text" id="userName"
					name="userName" style="width:200px;height:30px;border-radius:5px;">
				<span id="nametip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>登录密码： <input type="password"
					name="password" id="password"
					style="width:200px;height:30px;border-radius:5px;"> 
					<span id="passwordtip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>确认密码： <input type="password"
					name="ackpassword" id="ackpassword"
					style="width:200px;height:30px;border-radius:5px;"> <span
					id="ackpasswordtip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>真实姓名： <input type="text"
					name="realName" id="realName"
					style="width:200px;height:30px;border-radius:5px;"> <span
					id="realNameTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>身份证号: <input type="text"
					name="idcard" id="idcard"
					style="width:200px;height:30px;border-radius:5px;color:#333333;"><span
					id="idCardTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>详细地址: <input type="text"
					name="address" id="address"
					style="width:200px;height:30px;border-radius:5px;"> <span
					id="addressTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>手机号: <input type="text"
					name="telephone" id="telephone"
					style="width:200px;height:30px;border-radius:5px;"><span
					id="telephoneTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>性别： <select name="sex"
					style="width:200px;border-radius:5px;height:30px;">
					<option value="男">男</option>
					<option value="女">女</option>
				</select>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
                 <font style="color:red">*</font>邮箱:<input type="text" name="email" 
                 id="email" style="width:200px;height:30px;border-radius:5px;"/>
            </div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>头像： <input type="file" name="myFile" id="myFile"
					style="width:200px;height:30px;border-radius:5px;"> </input>
					<span
					id="myFileTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>图形验证码 : <input type="text"
					name="verifyCode" id="verifyCode"
					style="width:200px;height:30px;border-radius:5px;"> <img
					src="SecurityCodeImageAction" id="Verify" style="cursor:hand;"
					alt="看不清，换一张" /> <span id="verifyCodeTip"></span>
			</div>
			<div style="margin-left:130px;margin-top:13px;">
				<input type="submit"
					style="width:100px;height:40px;background:#FFB336;color:#FFFFFF;border-color:#FFB336;border-radius:5px;font-size:16px;font-weight:bolder;"
					value="注册" />
			</div>
		</div>
	</form>
	<jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
