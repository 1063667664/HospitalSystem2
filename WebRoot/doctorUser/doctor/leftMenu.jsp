<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
	<meta http-equiv="X-UA-Compatible" content="IE=8" />
	
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>	 
    <style type="text/css">
        html
        {
            _overflow-x: hidden;
            height: 100%;
        }
        body
        {
            background-color: #D9F3FF;
            padding: 0px;
            margin: 0px;
            height: 100%;
        }
        ul
        {
            margin: 0px;
            padding: 0px;
        }
        li
        {
            list-style: none;
            margin: 0px;
            padding: 0px;
        }
    </style>
  </head>
  <body style="margin: 0px;">
        <div id="Menu" style="width: 190px; float: left; margin: 2px 0px 0px 2px; _margin-left: 2.5px;overflow: hidden;">
            <div style="margin-left: 2px; width: 180px; height: 25px; vertical-align: middle;line-height: 25px; font-size: 16px; font-weight: bold; color: White;font-family: 微软雅黑; background-image: url('<%=path %>/images/menutop.png')"> <!-- 管理菜单 -->
            </div>
            <ul id="identifier">
                            <img style='vertical-align:middle' src="<%=path %>/img/group.png" />&nbsp;管理菜单栏
				<li>
				    &nbsp;<img style='vertical-align:middle' src="<%=path %>/img/group.png" />
				    &nbsp;<a target="main" href="<%=path%>/checkUserDoctor.action?doctorId=<s:property value="doctor.doctorId"/>" style="text-decoration:none;color:blue;">查看个人信息</a>   			
				</li>
				<li>
				    &nbsp;<img style='vertical-align:middle' src="<%=path %>/img/group.png" />
				    &nbsp;<a target="main" href="<%=path %>/forwardToEditPage.action?doctorId=<s:property value="doctor.doctorId"/>" style="text-decoration:none;color:blue;">修改个人信息</a>   			
				</li>
				<li>
				    &nbsp;<img style='vertical-align:middle' src="<%=path %>/img/group.png" />
				    &nbsp;<a target="main" href="<%=path%>/doctorUser/doctor/changeDoctorPassword.jsp?doctorId=<s:property value="doctor.doctorId"/>" style="text-decoration:none;color:blue;">修改密码</a>	   			
				</li>
				
				<li>
				    &nbsp;<img style='vertical-align:middle' src="<%=path %>/img/group.png" />
				    &nbsp;<a target="main" href="<%=path %>/registrationDoctorList.action?doctorId=<s:property value="doctor.doctorId"/>" style="text-decoration:none;color:blue;">看病就诊</a> 			
				</li>
				<li>
				    &nbsp;<img style='vertical-align:middle' src="<%=path %>/img/group.png" />
				    &nbsp;<a target="main" href="<%=path %>/doctorScheduleAction.action?doctorId=<s:property value="doctor.doctorId"/>" style="text-decoration:none;color:blue;">个人排班</a> 			
				</li>		
            </ul>     
        </div>
</body>
</html>
