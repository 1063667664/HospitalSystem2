<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

<style type="text/css">
.t2 table td{
    border-left:1px solid #D7D7D7;
    border-top:1px solid #D7D7D7
    }

.button {
	background-color:#188808;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	color:#fff;
	/* margin-left: 10px; */
	border-color: #34ABD6;
}
.buttond {
	background-color:#FF993D;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	color:#fff;
	/* margin-left: 10px; */
	border-color: #E8D0E6;
}
</style>
</style>
<html>
 <body bgcolor="#FFFFFF"> 
   <%@include file="head.jsp"%>
  <div style="width:1000px;height:500px;border:1px solid #D7D7D7;margin-left:200px;margin-top:13px;">
  <div style="text-align:center;margin-top:10px;"><font color=red size=7>${tip} </font></div>
  <div style="margin-left:300px;"><font size=6 color=red>${RId}${tip2 }</font></div>
  <div style="margin-left:40px;"><input type="button" style="width:87px;height:40px;background:#E0F1FE;border:1px solid #0497FF;border-bottom:0px;font-size:16px;font-weight:bolder;color:#029AFF;" value="所有预约"/></div>
  <div style="border-bottom:1px solid #009AFF;width:820px;margin-left:126px;"></div>
  <table style="width:910px;text-align:center;border-collapse:collapse;border:solid 1px #a0c6e5;margin-left:40px;margin-top:15px;">
  <tr style="background:#E0F1FE;height:40px;border-bottom:solid 1px #a0c6e5;">
  <td style="border-right:solid 1px #a0c6e5;">订单号</td>
  <td style="border-right:solid 1px #a0c6e5;">就诊医生</td>
  <td style="border-right:solid 1px #a0c6e5;">就诊日期</td>
  <td style="border-right:solid 1px #a0c6e5;">预约费用</td>
  <td style="border-right:solid 1px #a0c6e5;">医院</td>
  <td style="border-right:solid 1px #a0c6e5;">预约状态</td>
  <td style="border-right:solid 1px #a0c6e5;">操作</td>
  </tr>
  <s:iterator value="re" id="registration" status="s"> 
  <tr style="height:35;border-bottom:solid 1px #a0c6e5;" id="tr<s:property value="#s.index+1"/>">
  <td style="border-right:solid 1px #a0c6e5;" id="<s:property value="#s.index+1"/>"><font size=3><s:property value="#registration.registrationId"/></font></td>
  <td style="border-right:solid 1px #a0c6e5;"><s:property value="#registration.doctorName"/></td>
  <td style="border-right:solid 1px #a0c6e5;"><s:property value="#registration.date"/></td>
  <td style="border-right:solid 1px #a0c6e5;"><s:property value="#registration.regfee"/>元</td>
  <td style="border-right:solid 1px #a0c6e5;"><s:property value="#registration.hospitalName"/>
  </td>
  <td style="border-right:solid 1px #a0c6e5;" >
     <input type="button" id="button<s:property value="#s.index+1"/>" class="button"
      onMouseOver="this.style.backgroundColor ='#7ACD00';" onMouseOut="this.style.backgroundColor ='#188808';"
       value="<s:property value="#registration.state"/>" data="<s:property value="#s.index+1"/>"/>
  </td>
  <td  style="border-right:solid 1px #a0c6e5;" onclick="">
       <button  id="delete<s:property value="#s.index+1"/>" class="buttond"  onMouseOver="this.style.backgroundColor ='#DDF700';" onMouseOut="this.style.backgroundColor ='#FF993D';"
         data="<s:property value="#s.index+1"/>" >删除</button></td>
  </tr>
  </s:iterator>
  </table>
  </div>
  </body>
  </html>