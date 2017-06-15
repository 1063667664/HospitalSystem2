<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	    
		<script language="javascript">
		function check1()
		{                                                                                         
		     if(document.loginForm.userName.value=="")
			 {
		    	
			 	alert("请输入用户名");
				document.loginForm.userName.focus();
				return false;
			 }
			 if(document.loginForm.userPw.value=="")
			 {
			 	alert("请输入密码");
				document.loginForm.userPw.focus();
				return false;
			 }
			 document.getElementById("indicator").style.display="block";
			 
		}
		
	    </script>
	
	<style type="text/css">
		* {
			margin:0;
			padding:0;
		}
		html {
			width:100%;
			height:100%;
			overflow-x:hidden;
		}
		body {
			height:100%;
			margin:0;
			padding:0;
			font-size:10pt;
			background:#F1F1F1;
			color:#333;
			overflow:auto;
			overflow-x:hidden;
		}
		body#login {
			background: url(/Hospital_Guahao/images/admin.jpg) repeat-x scroll 0 0;
		}
		body#index {
			border-left:200px solid #0065AF;
		}
		body#page {
			padding:20px;
			height:auto;
			border-top:60px solid #0065AF;
		}
		a {
			color:#0D324F;
		}
		
		textarea,select {
			background:#F4F4F4;
			border:1px solid #A5ACB2;
		}
		
		h1 {
			position:absolute;
			width:1000%;
			color:#FFF;
			font-size:12pt;
			top:0;
			left:0;
			padding:23px 0 16px 20px;
			background:#0065AF;
			border-bottom:3px solid #FFF;
		}
		h2 {
			font-size:12px;
			padding:8px;
			color:#333;
		}
		p {
			margin:10px auto;
		}
		/**/
		#loginForm {
			width:400px;
			height:250px;
			position:absolute;
			top:50%;
			left:50%;
			margin:-150px 0 0 -200px;
			background:#FFF;
			border:5px solid #999;
		}
		#loginForm h3 {
			background:#000;
			color:#FFF;
			margin:0 0 30px 0;
			line-height: 30px;
			cursor: pointer;
			padding:14px 0 8px 0px;
		}
	</style>
	
  </head>
  
  <body id="login">
	<form action="<%=path%>/adminLoginAction.action" id="loginForm" name="loginForm" method="post" onsubmit="return check1();">
		<h3><img  src="<%=path %>/img/group.png" style="vertical-align:middle;height:20px;"/>&nbsp;挂号系统管理员登陆</h3>
		<table align="center" border="0" cellpadding="9" cellspacing="9">
			<tr align='center'>
				<td style="width: 50px;font-family: 微软雅黑;" align="left">
					账号：										    
				</td>
				<td align="left">
					<input name="name" type="text" style="width: 200px;height: 20px;" value="${userName}"/>
				</td>
			</tr>
			<tr align='center'>
				<td style="width: 50px;font-family: 微软雅黑;" align="left">
					密码：										    
				</td>
				<td align="left">
					<input name="password" type="password" style="width: 200px;height: 20px;" value="${userPw}"/>
				</td>
			</tr>
			<tr align='center'>
			   <td style="width: 50px;" align="left"></td>
			   <td align="left">
			      <input type="submit" value="登陆" style="width: 80px;font-family: 微软雅黑;" />&nbsp; 
			      <input type="reset" value="重置" style="width: 80px;font-family: 微软雅黑;"/>&nbsp;
			      <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none"/>
			   </td>   
			</tr>
			
		</table>
		<span style="text-align:center;"><font color=red>${message}</font></span>
	</form>
  </body>
</html>