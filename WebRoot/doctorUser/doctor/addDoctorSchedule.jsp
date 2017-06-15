<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
<title>新增排班</title>
</head>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" src="js/eye-base.js"></script> 
 <script type="text/javascript" language="javascript" src="js/eye-all.js"></script> 
<script type="text/javascript">
   function pageForward(id){
	   var pageIndex = document.getElementById('pageIndex').value;
	   var beginDateTime = document.getElementById('beginDateTime').value;
	   var endDateTime = document.getElementById('endDateTime').value;
	   window.location.href="<%=path%>/doctorScheduleAction.action?pageIndex="+pageIndex+"&doctorId="+id+"&beginDateTime="+beginDateTime+"&endDateTime="+endDateTime;
   }
  function dealWithRegistration(id,doctorId,pageIndex){
	  
	  var dateTime = document.getElementById('dateTime').value;
	  window.location.href="<%=path%>/dealWithRegistration.action?dateTime="+dateTime+"&registrationId="+id+"&doctorId="+doctorId+"&pageIndex="+pageIndex;
   } 
 function  check(){
	  if(document.getElementById('date').value==''){
		  alert("请选择排班日期")
		  return false;
	  }
	  else if(document.getElementById('mornOrAfternoon').value==''){
		  alert("请选择上下午")
		  return false;
	  } 
	  return true;
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
    <form action="addDoctorSchedule.action" method="post" onsubmit="return check();">
	<div>
		<font>选择排班表时间：</font>
		    <div style="padding-top:10px;">
				        开始时间:<input type="text" id="date" name="date"
					style="border-radius:5px;height:23px;" value="<s:property value="beginDateTime"/>"
					onClick="eye.datePicker.show(this);" /> <font color=red><s:property value="addScheduleTip"/></font><br>
				  <select name="mornOrAfternoon" id="mornOrAfternoon"
					style="width:165px;margin-top:10px;margin-left:68px;height:26px;border-radius:5px;font-size:15px;border:1;">
					<option value="" style="color: #b6b6b6" disabled selected>请选择上下午</option>
					<option value="morning" >上午</option>
					<option value="afternoon">下午</option>
				</select>	
			</div>
			<div style="margin-left:43px;margin-top:10px;">
				<input type="submit" id="queryRegOrderPay"
					style="width:80px;height:30px;margin-top:10px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;margin-left:30px;font-size:15px;font-weight:bolder;"
					value="确定" onclick="query(<s:property value="doctorId"/>);"
					onMouseOver="this.style.backgroundColor='#EF972B';"
					onMouseOut="this.style.backgroundColor ='#0099FE';"
					/>
			</div>
	</div>
	<input type="hidden" name="doctorId" value="<s:property value="doctorId"/>"/>
	</form>
</body>
</html>
