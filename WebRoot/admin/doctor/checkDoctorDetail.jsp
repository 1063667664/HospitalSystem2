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
	   window.location.href="<%=path%>/checkDoctorsByHospitalId.action?hospitalId="+id;
    }
   </script>
  </head>
  
  <body>
     <div style="margin-top:50px;text-align:center;">
          <span> <font color=#65C0EE size=5><s:property value="doctor.name"/></font></span>
          <div style="margin-top:10px;"> <font color=#818181 size=3>所在的医院：</font> 
           <font color=#EF972B size=3><s:property value="doctor.hospital.name"/></font></div>
          <div style="margin-top:10px;"><font color=#818181 size=3>所在的科室：</font> 
           <font color=#EF972B size=3><s:property value="doctor.department.name"/></font></div>
            <div style="margin-top:10px;"><font color=#818181 size=3>所在的科室号：</font> 
           <font color=#EF972B size=3><s:property value="doctor.department.departmentId"/></font></div>
           <div style="margin-top:10px;"> <font color=#818181 size=3>医生登陆ID号：</font> 
           <font color=#EF972B size=3><s:property value="doctor.doctorId"/></font></div>
          <div style="margin-top:10px;"> <font color=#818181 size=3>医生性别：</font> 
           <font color=#EF972B size=3><s:property value="doctor.sex"/></font></div>
          <div style="margin-top:10px;"><font color=#818181 size=3>医生级别：</font> 
           <font color=#EF972B size=3><s:property value="doctor.academicTitle"/></font></div>
           <div style="margin-top:10px;"><font color=#818181 size=3>挂号单价：</font> 
           <font color=#EF972B size=3><s:property value="doctor.regfee"/>元</font></div>
           <div style="margin-top:10px;"><font color=#818181 size=3>医生专长/简介：</font> <br>
           <font color=#EF972B size=3><s:property value="doctor.speciality"/></font></div>
           <input type="button" value="返回" onclick="back(<s:property value="hospitalId"/>)"
            style="background:#F7B52C;margin-left:-42px;font-weight:bolder;margin-top:10px;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;" 
            onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
      </div>   
  </body>
</html>
