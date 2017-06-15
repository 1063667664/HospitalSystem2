<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
    function back(){
	   window.location.href ="<%=path%>/adminHospitalAction.action?";
    }
    function verifyHospitalInfo(){
    	if(document.form1.name.value==""){
    		alert("医院名称不能为空");
    		return false;
    	}
    	else if(document.form1.myFile.value==""){
    		alert("请选择医院头像");
    		return false;
    	}
    	else if(document.form1.telephone.value==""){
    		alert("医院电话热线不能为空");
    		return false;
    	}
    	else if(!validate(document.form1.telephone.value)){
    		alert("医院电话热线格式不符合要求");
    		return false;
    	}
    	else if(document.form1.address.value==""){
    		alert("医院地址不能为空");
    		return false;
    	} 
    	return true;
    }
    function validate(telephone){
		 var reg = new RegExp("/^0[\d]{2,3}-[\d]{7,8}$/");
		 if((/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(telephone.trim()))){
			 return true;
		 }
		 else{
			 return false
		 }
	 }
   </script>
   <style type="text/css">
   #shuoming {
	color: blue;
	margin-left: 40px;
	margin-top: 30px;
	border-bottom: 1px solid #D7D7D7;
	</style>
  </head>
  
  <body>
     <div style="margin-top:10px;margin-left:5px;">
              <div id="shuoming">
				<b>新增医院信息</b><font style="color:red">（*号为必填）</font>
				&nbsp;<font style="color:red"><s:property value="addHospitalTip"/></font>
			</div>
            <form action="adminHospitalAddAction.action" name="form1" method="post" 
            enctype="multipart/form-data" onsubmit="return verifyHospitalInfo();">
            <div style="margin-left:80px;margin-top:30px;">
				<font color=red>*</font> 医院名称：<input type="text" id="hospitalName"
					name="name" style="width:200px;height:30px;border-radius:5px;">
			</div>
			<div style="margin-left:80px;margin-top:13px;">
				<font style="color:red">*</font>医院图像： <input type="file" name="myFile" id="myFile"
					style="width:200px;height:30px;border-radius:5px;"> </input>
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font style="color:red">*</font>医院级别： <select name="rank"
					style="width:200px;border-radius:5px;height:30px;">
					<option value="一级医院">一级医院</option>
					<option value="二级医院">二级医院</option>
					<option value="三级医院">三级医院</option>
					<option value="特等医院">特等医院</option>
				</select>
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医院热线：<input type="text" id="hospitalTelephone"
					name="telephone" style="width:200px;height:30px;border-radius:5px;">
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font style="color:red">*</font>医院性质： <select name="property"
					style="width:200px;border-radius:5px;height:30px;">
					<option value="公立医院">公立医院</option>
					<option value="私立医院">私立医院</option>
				</select>
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医院地址：<input type="text" id="hospitalAddress"
					name="address" style="width:200px;height:30px;border-radius:5px;">
			</div>
			<div style="margin-left:80px;margin-top:10px;">
				<font color=red>*</font> 医院简介：<br>
				<textArea  id="hospitalBrief"
					name="brief" style="margin-top:5px;width:290px;height:150px;border-radius:5px;">
					</textArea>
			</div>
			     <input type="submit" value="新增" style="margin-top:10px;margin-left:130px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;"/>&nbsp;
			     <input type="button" value="返回" onclick="back()"
         style="margin-top:10px;margin-left:210px;background:#F7B52C;width:50;height:30;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" /> 
           </form>
      </div>
   
     
  </body>
</html>
