<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
    function back(id){
	   window.location.href ="<%=path%>/adminHospitalAction.action?pageIndex="+id;
    }
   </script>
  </head>
  
  <body>
     <div style="margin-top:10px;margin-left:5px;">
           <font color=#65C0EE size=5><s:property value="hospital.name"/></font><br>
           <font color=#818181 size=3>医院级别：</font> 
           <font color=#EF972B size=3><s:property value="hospital.rank"/></font><br>
           <font color=#818181 size=3>医院热线：</font> 
           <font color=#EF972B size=3><s:property value="hospital.telephone"/></font><br>
           <font color=#818181 size=3>医院性质：</font> 
           <font color=#EF972B size=3><s:property value="hospital.property"/></font><br>
           <font color=#818181 size=3>医院地址：</font> 
           <font color=#EF972B size=3><s:property value="hospital.address"/></font><br>
           <font color=#818181 size=3>医院简介：</font> 
           <font color=#EF972B size=3><s:property value="hospital.brief"/></font>
      </div>
      <input type="button" value="返回" onclick="back(<s:property value="pageIndex"/>)"
         style="background:#F7B52C;width:50;height:30;margin-left:5px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
     
  </body>
</html>
