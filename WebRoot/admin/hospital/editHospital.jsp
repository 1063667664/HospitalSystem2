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
    function back(id){
	   window.location.href ="<%=path%>/adminHospitalAction.action?pageIndex="+id;
    }
    function edit(){
    	 $('#name').attr("disabled",false);
    	  $('#hospitalBrief').attr("disabled",false);
    	  $('#property').attr("disabled",false);
    	  $('#address').attr("disabled",false);
    	  $('#telephone').attr("disabled",false);
    	  $('#rank').attr("disabled",false);
    	  $('#myFile').attr("disabled",false);
    	  $('#savebtn').attr("disabled",false);
    }
    function verifyHospitalInfo(){
    	if(document.form1.name.value==""){
    		alert("医院名称不能为空");
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
    function save(){
    	if(!verifyHospitalInfo()){
    		return false;
    	}
      $('#name').attr("disabled",false);
  	  $('#hospitalBrief').attr("disabled",false);
  	  $('#property').attr("disabled",false);
  	  $('#address').attr("disabled",false);
  	  $('#telephone').attr("disabled",false);
  	  $('#rank').attr("disabled",false);
  	 $('#myFile').attr("disabled",false);
  	  return true;
    }
   </script>
  </head>
  
  <body>
   <form action="editHospital.action" method="post" name="form1" enctype="multipart/form-data" onsubmit="return save();" >
  <div style="float:left;">
     <div style="margin-left:15px;">
           <font color=#818181 size=4>医院名称：</font> 
             <input type="text"  value="<s:property value="hospital.name"/>" id="name"
					name="name" style="width:200px;height:25px;border-radius:5px;color:#65C0EE ;font-size:15px;" disabled="true"><br>
           <font color=#818181 size=4>医院级别：</font> 
           <select name="rank" id="rank"
					style="width:200px;border-radius:5px;height:25px;color:#EF972B;font-size:15px;" disabled="true">
					<option value="特等医院" <s:if test="%{hospital.rank.equals('特等医院')}"> selected</s:if> >特等医院</option>
					<option value="一级医院" <s:if test="%{hospital.rank.equals('一级医院')}"> selected</s:if> >一级医院</option>
				<option value="二级医院" <s:if test="%{hospital.rank.equals('二级医院')}"> selected</s:if> >二级医院</option>
				<option value="三级医院" <s:if test="%{hospital.rank.equals('三级医院')}"> selected</s:if> >三级医院</option>
				</select><br>
           <font color=#818181 size=4>医院热线：</font> 
            <input type="text"  value="<s:property value="hospital.telephone"/>"
			id="telephone"	name="telephone" style="width:200px;height:25px;border-radius:5px;color:#EF972B;font-size:15px;" disabled="true"><br>
           <font color=#818181 size=4>医院性质：</font> 
           <select name="property" id="property"
					style="width:200px;border-radius:5px;height:25px;color:#EF972B;font-size:15px;" disabled="true">
					请选择上下午
					<option value="公立医院" <s:if test="%{hospital.property.equals('公立医院')}"> selected</s:if> >公立医院</option>
					<option value="私立医院" <s:if test="%{hospital.property.equals('私立医院')}"> selected</s:if> >私立医院</option>
				</select>
           <%--  <input type="text"  value="<s:property value="hospital.property"/>" id="property"
					name="property" style="width:200px;height:25px;border-radius:5px;color:#EF972B;font-size:15px;" disabled="true"> --%><br>
           <font color=#818181 size=4>医院地址：</font> 
           <input type="text"  value="<s:property value="hospital.address"/>"
				id="address"	name="address" style="width:200px;height:25px;border-radius:5px;color:#EF972B;font-size:15px;" disabled="true"><br>
          <font color=#818181 size=4>医院图像：</font> 
           <input type="file" name="myFile" id="myFile"
					style="width:200px;height:25px;border-radius:5px;color:#EF972B;font-size:15px;" value="<s:property value="hospital.path"/>" disabled="true"><br>
           <font color=#818181 size=4>医院简介：</font> <br>
           <textArea type="text"  id="hospitalBrief" name="brief"  style="color:#EF972B;overflow-x:hidden;overflow-y:hidden;font-size:15px;margin-top:5px;width:290px;height:150px;border-radius:5px;"  disabled="true"><s:property value="hospital.brief"/>
		   </textArea>
           <input type="hidden" name="hospitalId" value="<s:property value="hospital.hospitalId"/>"/>
            <input type="hidden" name="pageIndex" value="<s:property value="pageIndex"/>"/>
         
      </div>
      <div>
      <input type="button" value="编辑" onclick="edit();"
         style="background:#F7B52C;width:40;height:30;margin-left:15px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
				<input type="submit" value="保存" id="savebtn"
         style="background:#F7B52C;width:40;height:30;margin-left:110px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"  disabled="true"/>
				 <input type="button" value="返回" onclick="back(<s:property value="pageIndex"/>)"
         style="background:#F7B52C;width:40;height:30;margin-left:210px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
				</div>
				</div>
		<div id="headImg" style="margin-top:20px;margin-left:320px;">
          <img src="<s:property value="hospital.path"/>" width="100px" height="120px" alt="hositalImg"/>
       
    </div>
    </form>
  </body>
</html>
