<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="error.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/admin/doctorValidate.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
   function pageForward(){
	   var pageIndex = document.getElementById('pageIndex').value;
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex="+pageIndex+"&hospitalId="+hospitalId;
   }
   function checkDepartment(id){
	   window.location.href="<%=path%>/findAllDepsById.action?hospitalId="+id;
	   
   }
   function hospitalCheck(id){
	   var pageIndex = document.getElementById('hiddenPageIndex').value;
	   window.location.href ="<%=path%>/checkHospitalDetail.action?hospitalId="+id+"&pageIndex="+pageIndex;
   }
   function addHospital(){
	   window.location.href ="<%=path%>/admin/hospital/addHospital.jsp";
   }
   function editHospital(id){
	   var pageIndex = document.getElementById('hiddenPageIndex').value;
	   window.location.href="<%=path%>/checkEditHospital.action?hospitalId="+id+"&pageIndex="+pageIndex;
   }
   function addDoctor(id){
	   window.location.href ="<%=path%>/forwardAddDoctorPage.action?hospitalId="+id;
   }
   function checkDepartment(){
	   document.getElementById('deptIDName').style.display="block";
   }
   function check(){
	   if(!saveInfo()){
		   return false;
	   }
	   $('#hospitalId').attr("disabled",false);
	   return true;
   }
   function back(){
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href="<%=path%>/checkDoctorsByHospitalId.action?hospitalId="+hospitalId;
   }
   
   </script>
   <style type="text/css">
   a{
    text-decoration:none;
    color:blue;
   } 
   #shuoming {
	color: blue;
	margin-left: 40px;
	margin-top: 10px;
	border-bottom: 1px solid #D7D7D7;
   </style>
</HTML>
  <head>
  </head>
  <body>
  <font color=#65C0EE size=5><s:property value="hositalName"/>(新增医生)</font>
  <br>
  <form action="addDoctor.action" method="post" onsubmit="return check();">
             <div id="shuoming">
				<b>新增医生信息</b><font style="color:red">（*号为必填）</font>
				&nbsp;<font style="color:red"><s:property value="addDoctorTip"/></font>
			</div>
			<div id="addDocleft" style="float:left">
			 <div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医院ID号：<input type="text" id="hospitalId"
				    value="<s:property value="hospitalId"/>"
					name="hospitalId" style="width:200px;height:25px;border-radius:5px;" disabled="true">			
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 科室ID号：<input type="text" id="departmentId"
				    value="<s:property value="departmentId"/>"
					name="departmentId" style="width:200px;height:25px;border-radius:5px;" >			
			</div>
			<div style="margin-left:80px;margin-top:10px;">
			<font color=red>*</font> 医生性别：
			<select name="sex" id="sex"
					style="width:200px;border-radius:5px;height:25px;font-size:15px;" >
					<option value="男"  >男</option>
					<option value="女" >女</option>
				</select>
				</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医生名字：<input type="text" id="name"
				    value="<s:property value="name"/>"
					name="name" style="width:200px;height:25px;border-radius:5px;" >			
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医生级称：<input type="text" id="academicTitle"
				    value="<s:property value="academicTitle"/>"
					name="academicTitle" style="width:200px;height:25px;border-radius:5px;" >			
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 挂号单价(元)：<input type="text" id="regfee"
				    value="<s:property value="regfee"/>"
					name="regfee" style="width:200px;height:25px;border-radius:5px;" >			
			</div>
			<div style="margin-left:80px;margin-top:10px;">
			<font color=red>*</font>医生简介/专长：<br>
			<textArea type="text"  id="speciality" name="speciality"  style="font-size:15px;margin-top:5px;width:290px;height:100px;border-radius:5px;"></textArea>
			</div>
			<input type="submit" value="新增" style="margin-left:80px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;"
                onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>
				<input type="button" value="查看科室ID号" onclick="checkDepartment();"
                style="margin-left:190px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:110;position:absolute;background:#0090DB;color:#FFEDF1;"
                onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>
				<input type="button" value="返回" onclick="back();"
                style="margin-left:310px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:110;position:absolute;background:#0090DB;color:#FFEDF1;"
                onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>
			</div>
			<div style="color:red;display:none;" id="deptIDName">
			<s:iterator value="departmentLists" id="dept" status="item">
			       <s:property value="#dept.name"/>-><s:property value="#dept.departmentId"/>&nbsp;
			</s:iterator>
			</div>
      
      <input type="hidden" id="hospitalId" value="<s:property value="hospitalId"/>"/>
      <input type="hidden" id="hiddenPageIndex" value="<s:property value="pageIndex"/>"/>
      
  </form>
 </body>
 </html>