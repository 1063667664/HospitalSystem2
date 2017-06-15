<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
  function back(){
	  var hospitalId =document.getElementById('hiddenHospitalId').value;
	  var pageIndex =document.getElementById('hiddenPageIndex').value;
	  window.location.href="<%=path%>/findAllDepsById.action?hospitalId="+hospitalId+"&pageIndex="+pageIndex;
  }
  function save(){
	  if(document.form1.name.value==""){
  		alert("科室名称不能为空");
  		return false;
  	 }
	  $("#hospitalId").attr("disabled",false);
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
 <form action="addDepartment.action" name="form1" method="post" onsubmit="return save();">
   <div style="text-align:center;margin-top:100px;">
   <span ><font color=red><s:property value="addDeptTip"/></font></span><br>
  <font color=#65C0EE size=5> 新增科室</font><br>
    医院 ID：<input type="text" id="hospitalId" name="hospitalId" 
			style="width:200px;height:30px;border-radius:5px;margin-top:20px;" value='<s:property value="hospitalId"/>' disabled="true"/>
					<br>
    科室名称：<input type="text" id="departmentName"
					name="name" style="width:200px;height:30px;border-radius:5px;margin-top:20px;" value='<s:property value="name"/>'>
  <br>
   <input type="submit" value="新增" style="margin-top:10px;margin-left:-60px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;"/>&nbsp;
			     <input type="button" value="返回" onclick="back();"
         style="margin-top:10px;margin-left:30px;background:#F7B52C;width:50;height:30;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" /><br>
				
  </div>
   <input type="hidden" id="hiddenHospitalId" value="<s:property value="hospitalId"/>"/>
      <input type="hidden" id="hiddenPageIndex" value="<s:property value="pageIndex"/>"/>
   </form>
</body>
</html>