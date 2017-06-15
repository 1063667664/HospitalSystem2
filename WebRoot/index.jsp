<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
  <img src="/Hospital_Guahao/upload/1480604196801.jpg" width="50px" height="50px" alt="whx"/>
    <form action="register.action" method="post" enctype="multipart/form-data">
    <div style="margin-left:130px;margin-top:13px;">
				<font style="color:red">*</font>头像：	
			 <input type="file" name="myFile" style="width:200px;height:30px;border-radius:5px;">
			 </input>
			 <img src="/Hospital_Guahao/upload/1480604196801.jpg" width="80px" height="100px"/>
			 </div>
			 <input type="submit" value="上传"/>
    </form>
  </body>
</html>
