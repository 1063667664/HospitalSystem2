<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>处理就诊单</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" src="js/eye-base.js"></script> 
 <script type="text/javascript" language="javascript" src="js/eye-all.js"></script> 
<script type="text/javascript">
   function pageForward(id){
	   var pageIndex = document.getElementById('pageIndex').value;
	   var dateTime = document.getElementById('dateTime').value;
	   window.location.href="<%=path%>/registrationDoctorList.action?pageIndex="+pageIndex+"&doctorId="+id+"&dateTime="+dateTime;
   }
   function query(id){
	   var dateTime = document.getElementById('dateTime').value;
	   window.location.href="<%=path%>/registrationDoctorList.action?dateTime="+dateTime+"&doctorId="+id;
   }
  function dealWithRegistration(id,doctorId,pageIndex){
	  
	  var dateTime = document.getElementById('dateTime').value;
	  window.location.href="<%=path%>/dealWithRegistration.action?dateTime="+dateTime+"&registrationId="+id+"&doctorId="+doctorId+"&pageIndex="+pageIndex;
   } 
 </script>
<style type="text/css">
.reg {
	font-size: 15px;
	color: #333333;
	text-align: center;
	margin-left: 5px;
	margin-top: 10px;
	borderColor: #D7D7D7;
	
  }
   a{
    text-decoration:none;
    color:blue;
   }
</style>
<body>
	<div>
		<font>筛选：</font>
		    <div style="padding-top:10px;">
				挂号时间:<input type="text" id="dateTime" name="dateTime"
					style="border-radius:5px;height:23px;" value="<s:property value="dateTime"/>"
					onClick="eye.datePicker.show(this);" />
			</div>
			<div style="margin-left:43px;margin-top:10px;">
				<input type="button" id="queryRegOrderPay"
					style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;margin-left:30px;font-size:15px;font-weight:bolder;"
					value="查询" onclick="query(<s:property value="doctorId"/>);"/>
			</div>
	</div>

  <table class="reg" cellspacing=0 border= 1 width= 98% cellPadding= 1>
			<tr bgcolor=#EBEBEB height=30>
				<td><font>序号</font></td>
				<td><font>就诊单号</font></td>
				<td><font>姓名</font></td>
				<td><font>挂号时间</font></td>
				<td><font>挂号单状态</font></td>
				<td><font>操作</font></td>
			</tr>
		<s:iterator value="rList" id="registration" status="st">
		<tr>
		<td><s:property value="#st.index+1"/></td>
		<td><s:property value="#registration.registrationId"/></td>
		<td><s:property value="#registration.userName"/></td>
		<td><s:property value="#registration.date"/></td>
		<td><font color=red><s:property value="#registration.state"/></font></td>
				<td><input type="button" value="就诊"
					style="border-radius: 2px; font-weight: bolder; font-size: 13px; border: 3px solid #0090DB; background: #0090DB; color: #FFEDF1;"
					onclick="dealWithRegistration(<s:property value="#registration.registrationId"/>,<s:property value="#registration.doctorId"/>,<s:property value="pageIndex"/>)"
					onMouseOver="this.style.backgroundColor='#EF972B';"
					onMouseOut="this.style.backgroundColor ='#0090DB';" /></td>
			</tr>
		</s:iterator>
	</table>
	 <div id="page" style="text-align:center;margin-top:5px;">
           当前第<s:property value="pageIndex"/>页&nbsp;&nbsp;
     <s:if test="%{pageIndex== 1}">
				<td>首页&nbsp;&nbsp;上一页&nbsp;&nbsp;</td>
	 </s:if>
	 <s:else>
			<td><a
				href="<%=path%>/registrationDoctorList.action?pageIndex=1&doctorId=<s:property value="doctorId"/>&dateTime=<s:property value="dateTime"/>">首页</a></td>
			<td><a
               href="<%=path%>/registrationDoctorList.action?pageIndex=<s:property value="%{pageIndex-1}"/>&doctorId=<s:property value="doctorId"/>&dateTime=<s:property value="dateTime"/>">上一页</a></td>
	 </s:else>
	 <s:if test="%{pageIndex != totalPages}">
				<td><a
					href="<%=path%>/registrationDoctorList.action?pageIndex=<s:property value="%{pageIndex+1}"/>&doctorId=<s:property value="doctorId"/>&dateTime=<s:property value="dateTime"/>">下一页</a></td>
				<td><a
					href="<%=path%>/registrationDoctorList.action?pageIndex=<s:property value="totalPages"/>&doctorId=<s:property value="doctorId"/>&dateTime=<s:property value="dateTime"/>">最后一页</a></td>
			</s:if>
	 <s:else>
			<td>下一页&nbsp;&nbsp;最后一页&nbsp;&nbsp;</td>
	 </s:else>
           共<s:property value="totalPages"/>页&nbsp;&nbsp;
           共<s:property value="count"/>条记录&nbsp;&nbsp;     
      <input type="text" name="pageIndex" id="pageIndex" style="width:25px;"/>&nbsp;
      <input type="button" value="go" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;" onclick="pageForward(<s:property value="doctorId"/>)">
      </div>
</body>
</html>
