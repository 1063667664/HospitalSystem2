<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/candanlan.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
</head>
<body bgcolor="#FFFFFF">
	<%@include file="head.jsp"%>
	<div id="backIt"
		style="width:40;height:128px;position:absolute;top:230.2px;margin-left:180;position:fixed;background-color:#A6BDC5;text-align:center;">
		<img src="images/hospital/back.PNG;"
			style="padding-left:3px;width:25px;height:25;text-align:center;" /> 
			<font
			size=2 color=#DEEBF3 > 选<br> 其<br> 他<br> 医<br>
			院
		</font>
	</div>
	<div
		style="width:1000px;height:850;margin-left:200px;border:0.1px solid #CBCBCB;margin-top:10;">
		<div
			style="height:100%;width:32%;float:left;border-right:0.1px solid #DADADA;float:left;">
			<div style="margin-left:40px;margin-top:25px;">
				<font size=2 color=#FF8D75><s:property value="hospital.name" /></font>
				<img src="<s:property value="hospital.path"/>;"
					style="width:200px;height:140px;border:1px #D7D7D7 solid;margin-top:10px;" />
				<div style="padding-top:8px">
					<font size=2 color=#333333 mrgin-top=10px>类型：${device.type}</font>
				</div>
				<div style="padding-top:8px">
					<font size=2 color=#333333>地址：<s:property
							value="hospital.address"></s:property></font>
				</div>
				<div style="padding-top:8px">
					<font size=2 color=#333333>电话：<s:property
							value="hospital.telephone" /></font>
				</div>
			</div>
			<div style="margin-top:25px;margin-left:40px;width:200;">
				<font size=2 color=#333333>简介:</font> <br>
				<font color=#333333><s:property value="hospital.brief" /></font>
			</div>
		</div>
		<div
			style="height:100%;width:1.5%;background:-webkit-gradient(linear, 100% 0%, 0% 0%, from(#FFFFFF), to(#EDEDED));border:0px;float:left;"></div>
		<div style="float:left;">
			<div style="height:120px;padding-top:20px;padding-left:20px;">
				<font color=#FF8D3F size=2> *温馨提示：<br /> 1.标灰的科室暂无号源。<br>
					2.预约无需预扣挂号费，只需就诊当日医院窗口支付<br>
				</font>
				<div style="margin-top:15;">
					<input type="text" id="search_key" name="search_key"
						placeholder="请输入医生名称"
						style="width:300px;height:30px;border:2px solid #0090DB" /> <input
						type="button" value="搜索"
						style="font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;">
				</div>
			</div>
			<div style="width:650px;border:0.1px solid #D7D7D7;"></div>
		
				<s:iterator value="listDepartment" status="item">
				<div
				style="height:40px;line-height:40px;border-bottom:#D7D7D7 1px dashed;">
			    <a href="/Hospital_Guahao/doctorAction.action?firstResult=0&departmentName=<s:property value="name"/> & 
			  hospitalId=<s:property value="hospital.hospitalId"/>"  style="text-decoration: none;color:#0093D0;" />
			     <font
					size=2><s:property value="name"/></font></a>
			    </div>
			</s:iterator>
				<div
				style="height:40px;line-height:40px;border-bottom:#D7D7D7 1px dashed;">
                          <font size=2 color=#9F9FB2>岭南名医门诊</font>
                      
   </div>
			</div>
	</div>
</body>

</html>
