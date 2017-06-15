<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>My JSP 'head.jsp' starting page</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript" src="js/candanlan.js"></script>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
    <div id="img_header" style="background:url(images/header.jpg)no-repeat ;height:125px;">
      <div id="userNameDiv" style="margin-left:920px;padding-top:50px;color:#FE9B3D;">
                      <%=session.getAttribute("userName")==null?"请登录":"欢迎你,"+session.getAttribute("userName") %></div>
      <input type="hidden" id="userName" value="<%=session.getAttribute("userName") %>"/>
       </div>
<div
		style="width:100%;height:40px;border:0px solid #000;background-color:#0196FD;line-height:40px">
		<div style="margin-left:200px;">
			<table style="width:1000px;">
				<tr>
					<td id="shouy"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>首页</b></font></td>
					<td id="hospitalSearch"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>按医院挂号</b></font></td>
					<td id="jiaofei"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>缴费管理</b></font></td>
					<td id="yuyue"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>预约管理</b></font></td>
					<td id="zhongxin"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>个人中心</b></font></td>
					<td id="zhinan"><font color=FFFFFF size=4
						onMouseOver="this.style.backgroundColor ='#F7F7F7';this.style.color='#0080EF';"
						onMouseOut="this.style.backgroundColor ='#0196FD';this.style.color='#ffffff';"><b>预约指南</b></font></td>
				</tr>
			</table>
		</div>
	</div> 
<div style="width:998px;height:35px;border:0px solid #000;margin-left:200px;background-color:#F8F8F8;border:1px solid #B5B196;border-radius:0px 0px 5px 5px ;"></div>
  </body>
</html>
