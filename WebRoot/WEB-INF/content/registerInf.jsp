<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<style type="text/css">
  .t2 table td{border-left:1px solid #D7D7D7;border-top:1px solid #D7D7D7}
</style>
  <script type="text/javascript" src="js/candanlanC.js">
  </script>
  <script type="text/javascript">
   function checksubmit(){
	   if(document.form1.tip3.value!=""){
		  return false; 
	   }
	   return true;
   }
  </script>
</script>
<html>
<%@include file="head.jsp"%>
 <body bgcolor="#FFFFFF"> 
 <form action="Registration.action"  name="form1"  method="get" onsubmit="return checksubmit();">
 <input type="hidden" name="doctorId" value="<s:property value="doctor.doctorId"/>"/>
  <div style="width:1000px;height:400px;border:1px solid #D7D7D7;margin-left:200px;margin-top:13px;">
  <div style="border-bottom:1px solid #D7D7D7;height:70px;margin-left:50px;">
      <div style="padding-top:41px;"><font color=#4F99FE><b>号源预约</b></font>&nbsp;
        <font color="red">欢迎你,<%=session.getAttribute("userName")%></font>&nbsp;
          <font color=red>${tip3}</font></div>
          <input type="hidden" name="tip3" value="${tip3}" />
  </div>
  <div style="padding-top:30px;margin-left:70px;">
  <table class="t2" style="width:900px;border-collapse:collapse;" >
  <tr><td colspan=5><b>挂号信息确认</b></td></tr>
  <tr style="text-align:center;background:#E0F1FE;height:35px;border:solid 1px #a0c6e5;">
  <td style="border:solid 1px #a0c6e5;">医院名称</td><td style="border:solid 1px #a0c6e5;">科室名称</td><td style="border:solid 1px #a0c6e5;">医生姓名</td><td style="border:solid 1px #a0c6e5;">就医时间</td><td width="20%">挂号费</td>
  </tr>
  <tr style="border:solid 1px #a0c6e5;font-size:18px;height:40px;">
  <td style="border-right:solid 1px #a0c6e5;"><s:property value="doctor.hospital.name"/><input type="hidden" value="<s:property value="doctor.hospital.name"/>" name="hospitalName"/></td>
  <td style="border-right:solid 1px #a0c6e5;">&nbsp;<s:property value="doctor.department.name"/><input type="hidden" value="<s:property value="doctor.department.name"/>" name="departmentName"/></td>
  <td style="border-right:solid 1px #a0c6e5;">&nbsp;<s:property value="doctor.name"/><input type="hidden" value="<s:property value="doctor.name"/>" name="doctorName"/></td>
  <td style="border-right:solid 1px #a0c6e5;">&nbsp; <s:property value="date"/><input type="hidden" value="<s:property value="date"/>" name="date"/><s:property value="time1"/><input type="hidden" value="<s:property value="time1"/>" name="time"/></td>
  <td>&nbsp; &nbsp; &nbsp;<font color=red> <s:property value="doctor.regfee"/><input type="hidden" value="<s:property value="doctor.regfee"/>" name="regfee"/>元</font></td>
  </tr>
  </table>
 <div style="margin-top:10px;"><font color=#999999 size=4><font color=red>*</font>温馨提示：在本网站预约挂号所缴纳的挂号费用均按自费标准收取，暂不支持医保、公费人员挂号费用的减免优惠。</font></div>
  <div style="margin-top:40px;margin-left:300px;"><input type="submit" value="提交挂号单" style="width:100px;height:40px;background:#2FACFF;font-size:14px;color:#FFFFFF;border:0px;border-radius:5px;"/>
    <span ><font color=#FF8D3F size=4 onclick="window.location.href='http://localhost:8080/Hospital_Guahao/hospitalInitAction.action';" onMouseOver="this.style.color='#19A2FE';" onMouseOut="this.style.color='#FF8D3F';"> 《返回重新挂号 </font></span></div>
  </div>
  </form>
</html>