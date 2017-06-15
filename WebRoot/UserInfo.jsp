<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
  .t2 table td{border-left:1px solid #D7D7D7;border-top:1px solid #D7D7D7}
</style>
<script type="text/javascript" src="js/gerenzhongxin.js"></script> 
<html>
 <body bgcolor="#FFFFFF"> 
  <%@include file="head.jsp"%>
  <div style="width:1000px;height:500px;margin-left:200px;margin-top:13px;border:1px solid #D7D7D7;">
    <form action="updateUserAction" method="post" >
   <div style="width:800;height:70px;border-bottom:1px solid #E3E3E3;margin-left:50px;">
         <div style="padding-top:45px;"><font color=#0099FE><b>个人信息</b></font>
         <font color=red size=2> (*充值积分时，一积分等于一块钱)</font>
        <font color=red>&nbsp;${tip5 }</font></div>
  </div>
   <div style="float:left;">
  <div style="margin-left:88px;margin-top:20px;"><font color=#019865 size=4><b>欢迎你，<s:property value="user.userRealname"/></b></font></div>
   <div style="margin-left:88px;margin-top:10px;">用户名：
          <input type="text" name="userName" value="<s:property value="user.userName"/>" style="color:#FF9600;height:25px;border-radius:5px;" readOnly="true" /></div>
   <div style="margin-left:88px;margin-top:10px;">真实姓名：
    <input type="text" name="userRealname" value="<s:property value="user.userRealname"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
   <div style="margin-left:88px;margin-top:10px;">性别：
      <input type="text" name="sex" value="<s:property value="user.sex"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
   <div style="margin-left:88px;margin-top:10px;">地址：
    <input type="text" name="address" value="<s:property value="user.address"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
   <div style="margin-left:88px;margin-top:10px;">电话：
    <input type="text" name="tel" value="<s:property value="user.tel"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
   <div style="margin-left:88px;margin-top:10px;">身份证：
    <input type="text" name="identificationId" value="<s:property value="user.identificationId"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
  <div style="margin-left:88px;margin-top:10px;">生日：
  <input type="text" name="birthday" value="<s:property value="user.birthday"/>" style="color:#FF9600;height:25px;border-radius:5px;"/></div>
  <div style="margin-left:88px;margin-top:10px;">当前积分：
  <font color=red><b><s:property value="user.balance"/></b></font></div>
   <div style="margin-left:88px;margin-top:10px;"><input type="submit" style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;font-size:15px;font-weight:bolder;border-color: #CD6504;" 
       onMouseOver="this.style.backgroundColor ='#FF9600';this.style.color='#0080EF';" onMouseOut="this.style.backgroundColor ='#0099FE';this.style.color='#ffffff';" value="修改"/>
   <input type="button" style="width:80px;height:30px;background:#0099FE;color:#FFFFFF;border:0px;border-radius:5px;font-size:15px;font-weight:bolder;" 
    onMouseOver="this.style.backgroundColor ='#FF9600';this.style.color='#0080EF';" onMouseOut="this.style.backgroundColor ='#0099FE';this.style.color='#ffffff';" value="去充值"/>
   </div>
   </div>
    <div style="position:relative;margin-top:25px;margin-left:100px;float:left;"><img src="images/touxiang.png" width="80px" height="100px" alt="whx"/></div>
    </form>
  </div>
  <jsp:include page="foot.jsp"></jsp:include>
  </body>
  </html>