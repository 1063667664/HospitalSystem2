<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="error.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML>
  <HEAD>
</HEAD>
<font color=red><s:property value="#doctor.name"/></font>
<FRAMESET border=0 frameSpacing=0 rows=140,* frameBorder=NO>
    <FRAME name=topFrame src="<%=path%>/toploginDoctor.action?doctorId=<s:property value="doctor.doctorId"/>" noResize scrolling=no/>
    <FRAMESET border=0 name=content frameSpacing=0 frameBorder=0 cols=192,*>
	    <FRAME name=BoardMenu marginWidth=0 marginHeight=0 src="<%=path %>/leftMenuloginDoctor.action?doctorId=<s:property value="doctor.doctorId"/>" noResize scrolling=no target="main"/>
	    <FRAME name=main marginWidth=0 marginHeight=0 src="<%=path %>/doctorUser/doctor/right.jsp" noResize/>
    </FRAMESET>
</FRAMESET> 
</HTML>