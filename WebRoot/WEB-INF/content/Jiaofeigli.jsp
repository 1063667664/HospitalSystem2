<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<style type="text/css">
  .t2 table td{border-left:1px solid #D7D7D7;border-top:1px solid #D7D7D7}
</style>
<script type="text/javascript" src="js/candanlanC.js"></script>
<html>
 <body bgcolor="#FFFFFF"> 
  <%@include file="head.jsp"%>
    <form action="bookingAction.action" method="post">
  <div style="margin-left:200px;margin-top:12px;border:1px solid #D7D7D7;height:630px;width:1000px;">
  <div style="width:800;height:70px;border-bottom:1px solid #E3E3E3;margin-left:50px;">
               <div style="padding-top:45px;"><font color=#0099FE><b>预约支付</b></font><font color="red" >&nbsp;<b>${tip }</b></font></div>
  </div>
  <div style="margin-left:70px;">
  <br/>
     <div ><font color=#019865>恭喜你，号源锁定成功！</font></div>
     <div style="padding-top:8px;"><font color=#333333 size=2>就诊用户： ${registeration.userName}</font></div>
    <div style="padding-top:8px;"><font color=#333333 size=2>医院名称：${registeration.hospitalName}</font></div>
   <div style="padding-top:8px;"><font color=#333333 size=2>科室名称：${registeration.departmentName}</font></div>
 <div style="padding-top:8px;"><font color=#333333 size=2>医生名字：${registeration.doctorName}</font></div>
 <div style="padding-top:8px;"><font color=#333333 size=2>就医时间：  ${registeration.date}</font></div>
 <div style="padding-top:8px;"><font color=#333333 size=2>&nbsp;挂号费：<font color=#FF0000 ><b>${registeration.regfee}</b></font>元</font></div>
 <div style="margin-top:10px;">
    积分支付:<font color=red>(*请确保积分充足)</font><br>
  &nbsp;<div style="margin-top:5px;float:left;"><input type="radio" /></div>
  <div style="float:left;"><img src="images/hospital/jifen.PNG" alt="jifen"/></div>
 </div>
 <div style="margin-top:20px;">
    网银支付<font color=red>(*暂时不可用,请用积分支付)：</font><br>
 <img src="images/hospital/WY.PNG" alt="wytp"/>
 </div>
  </div>
   <input type="hidden" name="regfee" value="${registeration.regfee}"/>
   <input type="hidden" name="date" value="${registeration.date}"/>
   <div style="margin-left:88.5px;"><input type="submit" style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;font-size:16px;font-weight:bolder;"value="确认支付"></div>
  </div>
  </form>
  </body>
  </html>
