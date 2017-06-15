<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/userInfo.js"></script>
<link rel="stylesheet" type="text/css" href="css/userInfo.css" />
    <script type="text/javascript">
   function checksubmit(){
    if(document.form1.sex.value=='男'||document.form1.sex.value=='女'){
       return true;
    }
     return false;
   }
  </script>
<html>
 <body bgcolor="#FFFFFF"> 
  <%@include file="head.jsp"%>
   <div id="userInfo">
   <form action="updateUserAction.action" name="form1" method="post" onsubmit="return checksubmit();">
   <div id="head">
         <div style="padding-top:45px;">
         <font color=#0099FE><b>个人信息</b></font>
         <font color=red size=2> (*充值积分时，一积分等于一块钱)</font>
        <font color=red>&nbsp;${tip5 }</font></div>
  </div>
   <div style="float:left;">
   <div id="welcome">
           欢迎你，<s:property value="user.userRealname"/>
   </div>
   <input type="hidden" name="userId" value="<s:property value="user.userId"/>"/>
   <div class="input">用户名：
         <input type="text" name="userName" id="userName" value="<s:property value="user.userName"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;"  disabled="true"/></div>
   <div class="input">真实姓名：
    <input type="text" name="userRealname" id="userRealName" value="<s:property value="user.userRealname"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true" /></div>
   <div class="input">性别：
      <input type="text" name="sex" id="sex" value="<s:property value="user.sex"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true"/></div>
   <div class="input">地址：
    <input type="text" name="address" id="address" value="<s:property value="user.address"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true"/></div>
   <div class="input">电话：
    <input type="text" name="telephone"  id="tel" value="<s:property value="user.tel"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true"/></div>
   <div class="input">身份证：
    <input type="text" name="identificationId" id="identificationId" value="<s:property value="user.identificationId"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true"/></div>
  <div class="input">生日：
  <input type="text" name="birthday" id="birthday" value="<s:property value="user.birthday"/>" style="color:#FF9600;height:25px;border-radius:5px;font-size:14px;" disabled="true"/></div>
  <div class="input">当前积分：
    <font color=red><b><s:property value="user.balance"/></b></font>
    </div>
   <div style="margin-left:88px;margin-top:10px;">
     <input type="button" id="edit" 
      onMouseOver="this.style.backgroundColor ='#FF9600';this.style.color='#0080EF';" onMouseOut="this.style.backgroundColor ='#0099FE';this.style.color='#ffffff';" 
        value="编辑" onclick="Edit();"/>
     <input type="submit" id="save" 
      onMouseOver="this.style.backgroundColor ='#FF9600';this.style.color='#0080EF';" onMouseOut="this.style.backgroundColor ='#0099FE';this.style.color='#ffffff';" value="保存"
           />
   <input type="button" id="recharge"
     onMouseOver="this.style.backgroundColor ='#FF9600';this.style.color='#0080EF';" onMouseOut="this.style.backgroundColor ='#0099FE';this.style.color='#ffffff';" value="去充值"/>
   </div>
   </div>
    <div id="headImg" >
          <img src="<s:property value="user.imageUrl"/>" width="80px" height="100px" alt="whx"/>
    </div>
    </form>
  </div>
  <jsp:include page="foot.jsp"></jsp:include>
  </body>

  </html>