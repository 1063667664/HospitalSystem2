<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  
  <body>
  <%@include file="head.jsp"%>
   <form action="applyUserNameAndEmail.action" method="post">
   <div style="text-align:center;width:1000px;height:300px;margin-left:200px;border:1px solid #D7D7D7;margin-top:20px;">
     <font color=red size=5>${sendEmailResetTip}</font><br>   
          用户名  :<input type="text" name="userName" id="userName" 
          style="border-radius:5px;width:200;height:25px;margin-top:20px;"/><br>
          注册的邮箱:<input type="text" name="email" id="email"
           style="border-radius:5px;width:200;height:25px;margin-top:20px;"/><br>
       
         	<input  type="submit" value="提交" style="border-radius:5px;font-size:20px;background-color:#FFB336;width:93;height:40;margin-top:20px;">
            <div style="padding-top:15px;"><font color=red size=5>说明:输入注册时的邮箱和用户名，点击提交即可等待下一步</font></div>
          </div>
          
         </form>
         <jsp:include page="foot.jsp"></jsp:include>
  </body>
</html>
