<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'Reg_success_tip.jsp' starting page</title>

</head>
<body>
	<div id="img_header">
		<img alt="whx" src="images/header.jpg" />
	</div>
	<div style="text-align:center;margin-top:100px;">
		<img src="images/regSuccess.png" style="vertical-align:middle;"
			width=40px height=50px /> <%=session.getAttribute("userName") %>恭喜你，修改密码成功 ！<br>
	</div>
	<div>
		<input type="button"
			style="width:100px;height:40px;background:#FFB336;color:#FFFFFF;border-color:#FFB336;border-radius:5px;font-size:16px;font-weight:bolder;margin-left:46%;"
			value="返回登录"  onclick="window.location.href='/Hospital_Guahao/login.jsp'"/>
	</div>
</body>
</html>
