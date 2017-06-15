<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String doctorId = request.getParameter("doctorId");
%>
<script type="text/javascript">
  function back(){
	  window.location.href="<%=path%>/doctorUser/doctor/right.jsp";
  }
  function save(){
	  if(document.form1.password1.value==""){
  		alert("密码不能为空");
  		return false;
  	 }
	  return true;
  }
</script>
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<body>
 <form action="changeDoctorPassword.action" name="form1" method="post" onsubmit="return save();">
   <div style="text-align:center;margin-top:100px;">
   <span ><font color=red><s:property value="changePasswordTip"/></font></span><br>
  <font color=#65C0EE size=5> 修改密码</font><br>
    新密码：<input type="text" id="password1" name="password1" 
			style="width:200px;height:30px;border-radius:5px;margin-top:20px;" value='<s:property value="password1"/>' />
					<br>
    确认新密码：<input type="text" id="password2"
					name="password2" style="width:200px;height:30px;border-radius:5px;margin-top:20px;" value='<s:property value="password2"/>'>
  <br>
   <input type="hidden" id="doctorId" name="doctorId" value="<%=doctorId%>"/>
   <input type="submit" value="修改" style="margin-top:10px;margin-left:-60px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;"  
   onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>&nbsp;
			     <input type="button" value="返回" onclick="back();"
         style="margin-top:10px;margin-left:30px;background:#F7B52C;width:50;height:30;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" /><br>
				
  </div>
  
   </form>
</body>
</html>