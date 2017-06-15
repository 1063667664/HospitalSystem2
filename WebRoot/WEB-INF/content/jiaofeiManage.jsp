<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<style type="text/css">
.t2 table td {
	border-left: 1px solid #D7D7D7;
	border-top: 1px solid #D7D7D7
}
.buttondelete{
    background-color:#FF993D;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	color:#fff;
	/* margin-left: 10px; */
	border-color: #E8D0E6;
}
.buttonPay {
	background-color:#188808;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	color:#fff;
	/* margin-left: 10px; */
	border-color: #34ABD6;
}
</style>
<script type="text/javascript" src="js/jiaofeiM.js"></script>
<script type="text/javascript" language="javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" language="javascript" 
	 src="js/eye-base.js"></script> 
 <script type="text/javascript" language="javascript" src="js/eye-all.js"></script> 
<html>
<head>
</head>
<body bgcolor="#FFFFFF">
<%@include file="head.jsp"%>
	<div
		style="width:1000px;margin-left:200px;margin-top:13px;border:1px solid #D7D7D7;">
		<div style="margin-top:38px;margin-left:100px;">
			<div style="padding-top:10px;">
				<font color=#FF6700 size=4>用户姓名：<s:property value="user.userRealname"/></font>
			</div>
			<div style="padding-top:10px;">证件号：<s:property value="user.identificationId"/>&nbsp;&nbsp;&nbsp;手机号：<s:property value="user.tel"/></div>
			<div style="padding-top:10px;">
				<font color=red>*</font>医院：<input type="text" id="hospitalName"
					style="border-radius:5px;height:28px;" value="<s:property value="hospitalName"/>"/>
			</div>
			<div style="padding-top:10px;">
				时 间:<input type="text" id="begin-time"
					style="border-radius:5px;height:28px;" value="<s:property value="date"/>"
					onClick="eye.datePicker.show(this);" />
			</div>
			<div style="margin-left:43px;margin-top:10px;">
				<input type="button" id="queryRegOrderPay"
					style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;font-size:15px;font-weight:bolder;"
					value="查询" onclick="query();"/>
			</div>
			<div
				style="border-bottom:1px solid #009AFF;width:40px;margin-top:70px;height:0 px;"></div>
			<div style="margin-left:40px;margin-top:-40px;">
				<input type="button" id="goingPaid"
					style="width:87px;height:40px;background:#E0F1FE;border:1px solid #0497FF;border-bottom:0px;font-size:16px;font-weight:bolder;color:#029AFF;"
					value="未付款" onclick="goingPaid();"/>
				<input type="button"  id="hadPaid"
					style="width:87px;height:40px;background:#E0F1FE;border:1px solid #0497FF;border-bottom:0px;font-size:16px;font-weight:bolder;color:#029AFF;"
					value="已付款"  onclick="hadPaid();"/>
			</div>
			<div
				style="border-bottom:1px solid #009AFF;width:680px;margin-left:126px;"></div>
			<table
				style="width:800px;margin-top:20px;text-align:center;border-collapse:collapse;border:solid 1px #a0c6e5;">
				 
				<tr
					style="background:#E0F1FE;height:40px;border-bottom:solid 1px #a0c6e5;">
					<td style="border-right:solid 1px #a0c6e5;width:80px;">订单号</td>
					<td style="border-right:solid 1px #a0c6e5;width:90px;">就诊医生</td>
					<td style="border-right:solid 1px #a0c6e5;">就诊日期</td>
					<td style="border-right:solid 1px #a0c6e5;width:90px;">预约费用</td>
					<td style="border-right:solid 1px #a0c6e5;">医院</td>
					<td style="border-right:solid 1px #a0c6e5;width:90px;">预约状态</td>
					<td style="border-right:solid 1px #a0c6e5;width:50px;">操作</td>		
				</tr>
				<s:iterator value="re" id="registration" status="s">
				<tr>
				<td style="border:solid 1px #a0c6e5;"><s:property value="#registration.registrationId"/></td>
				<td style="border:solid 1px #a0c6e5;"><s:property value="#registration.doctorName"/></td>
				<td style="border:solid 1px #a0c6e5;"><s:property value="#registration.date"/></td>
				<td style="border:solid 1px #a0c6e5;"><s:property value="#registration.regfee"/></td>
				<td style="border:solid 1px #a0c6e5;"><s:property value="#registration.hospitalName"/></td>
				<td style="border:solid 1px #a0c6e5;">
				<input type="button"  class="buttonPay"
                onMouseOver="this.style.backgroundColor ='#7ACD00';" onMouseOut="this.style.backgroundColor ='#188808';"
                value="<s:property value="#registration.state"/>" 
                onclick="toPaid('<s:property value="#registration.registrationId"/>')"/>
				</td>
				<td style="border:solid 1px #a0c6e5;">
				<button  id="<s:property value="#registration.registrationId"/>" 
				class="buttondelete" 
				onclick="deleteOrder('<s:property value="#registration.registrationId"/>','<s:property value="#registration.state"/>');"
				 onMouseOver="this.style.backgroundColor ='#DDF700';" onMouseOut="this.style.backgroundColor ='#FF993D';"
                      >删除</button>
				</td>
				</tr>
				</s:iterator>

			</table>
		</div>
	</div>

</body>
</html>
