<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  </head>
  <style>
  .error{
  color:red;
  }
  </style>
  <body>
  <%@include file="head.jsp"%>
    <form action="resetPassword.action" method="post">
    <div style="text-align:center;width:1000px;height:300px;margin-left:200px;border:1px solid #D7D7D7;margin-top:20px;">
    <span class="error" style="display: block;">${errors.passwordError}</span>
            用户名：<input type="text" name="userName" id="userName" 
          style="border-radius:5px;width:200;height:25px;margin-top:20px;"
           value="${userName}"/><br>
           <br>
           新密码：<input type="password" name="newPassword" id="newPassword" 
          style="border-radius:5px;width:200;height:25px;margin-top:20px;"
          value="${newPassword}"/><br>
          <span class="error">${errors.newPassword}</span><br>
          确认新密码：<input type="password" name="newRePassword" id="newRePassword" 
          style="border-radius:5px;width:200;height:25px;margin-top:20px;"
          value="${newRePassword }"/><br>
          <span class="error">${errors.newRePassword}</span><br>
    <input type="submit" value="提交" style="border-radius:5px;font-size:20px;background-color:#FFB336;width:93;height:40;"/>
    </div>
    </form>
  </body>
  </html>
