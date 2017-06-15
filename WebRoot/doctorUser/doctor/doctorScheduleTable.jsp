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
	   var beginDateTime = document.getElementById('beginDateTime').value;
	   var endDateTime = document.getElementById('endDateTime').value;
	   window.location.href="<%=path%>/doctorScheduleAction.action?pageIndex="+pageIndex+"&doctorId="+id+"&beginDateTime="+beginDateTime+"&endDateTime="+endDateTime;
   }
   function query(id){
	   var beginDateTime = document.getElementById('beginDateTime').value;
	   var endDateTime = document.getElementById('endDateTime').value;
	   window.location.href="<%=path%>/doctorScheduleAction.action?doctorId="+id+"&beginDateTime="+beginDateTime+"&endDateTime="+endDateTime;
   }
 function concellDoctorSchedule(doctorId,periodId){
	 if(confirm('您确定要取消该排班吗？'))
     {
	  window.location.href="<%=path%>/deleteDoctorSchedule.action?doctorId="+doctorId+"&periodId="+periodId;   
     }
  }
  function forwardAddPage(id){
	  window.location.href="<%=path%>/forwardToAddSchedulePage.action?doctorId="+id;
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
		<font>排班表时间筛选：</font>
		    <div style="padding-top:10px;">
				        开始时间:<input type="text" id="beginDateTime" name="beginDateTime"
					style="border-radius:5px;height:23px;" value="<s:property value="beginDateTime"/>"
					onClick="eye.datePicker.show(this);" />  -&nbsp;
					结束时间:<input type="text" id="endDateTime" name="endDateTime"
					style="border-radius:5px;height:23px;" value="<s:property value="endDateTime"/>"
					onClick="eye.datePicker.show(this);" />
			</div>
			<div style="margin-left:43px;margin-top:10px;">
				<input type="button" id="queryRegOrderPay"
					style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;margin-left:30px;font-size:15px;font-weight:bolder;"
					value="查询" onclick="query(<s:property value="doctorId"/>);"
					onMouseOver="this.style.backgroundColor='#EF972B';"
					onMouseOut="this.style.backgroundColor ='#0099FE';"
					/>
			</div>
	</div>

  <table class="reg" cellspacing=0 border= 1 width= 98% cellPadding= 1>
			<tr bgcolor=#EBEBEB height=31>
				<td><font>序号</font></td>
				<td><font>排班日期</font></td>
				<td><font>排班时间段</font></td>
				<td><font>操作</font></td>
			</tr>
		<s:iterator value="pList" id="period" status="st">
		<tr height=32>
		<td><s:property value="#st.index+1"/></td>
		<td><s:date name="#period.date" format="yyyy-MM-dd" /></td>
		<td><s:property value="#period.beginTime"/>-<s:property value="#period.endTime"/></td>
		
				<td><input type="button" value="取消排班"
					style="border-radius: 2px; font-weight: bolder; font-size: 13px; border: 3px solid #0099FE; background: #0099FE; color: #FFEDF1;"
					onclick="concellDoctorSchedule(<s:property value="doctorId"/>,<s:property value="#period.periodId"/>)"
					onMouseOver="this.style.backgroundColor='#EF972B';"
					onMouseOut="this.style.backgroundColor ='#0099FE';" />
				</td>
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
				href="<%=path%>/doctorScheduleAction.action?pageIndex=1&doctorId=<s:property value="doctorId"/>&beginDateTime=<s:property value="beginDateTime"/>&endDateTime=<s:property value="endDateTime"/>">首页</a></td>
			<td><a
               href="<%=path%>/doctorScheduleAction.action?pageIndex=<s:property value="%{pageIndex-1}"/>&doctorId=<s:property value="doctorId"/>&beginDateTime=<s:property value="beginDateTime"/>&endDateTime=<s:property value="endDateTime"/>">上一页</a></td>
	 </s:else>
	 <s:if test="%{pageIndex != totalPages}">
				<td><a
					href="<%=path%>/doctorScheduleAction.action?pageIndex=<s:property value="%{pageIndex+1}"/>&doctorId=<s:property value="doctorId"/>&beginDateTime=<s:property value="beginDateTime"/>&endDateTime=<s:property value="endDateTime"/>">下一页</a></td>
				<td><a
					href="<%=path%>/doctorScheduleAction.action?pageIndex=<s:property value="totalPages"/>&doctorId=<s:property value="doctorId"/>&beginDateTime=<s:property value="beginDateTime"/>&endDateTime=<s:property value="endDateTime"/>">最后一页</a></td>
			</s:if>
	 <s:else>
			<td>下一页&nbsp;&nbsp;最后一页&nbsp;&nbsp;</td>
	 </s:else>
           共<s:property value="totalPages"/>页&nbsp;&nbsp;
           共<s:property value="count"/>条记录&nbsp;&nbsp;     
      <input type="text" name="pageIndex" id="pageIndex" style="width:25px;"/>&nbsp;
      <input type="button" value="go" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;" onclick="pageForward(<s:property value="doctorId"/>)">
      </div>
      <input type="button" value="新增排班" onclick="forwardAddPage(<s:property value="doctorId"/>)"
      style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;margin-left:30px;font-size:15px;font-weight:bolder;"  
             onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0099FE';"/>
</body>
</html>
