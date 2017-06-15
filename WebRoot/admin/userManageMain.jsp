<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="error.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
   function pageForward(){
	   var pageIndex = document.getElementById('pageIndex').value;
	   window.location.href="<%=path%>/adminUserAction.action?pageIndex="+pageIndex;
   }
   function userDel(id)
   {
       if(confirm('您确定删除该用户吗？'))
       {
           window.location.href="<%=path%>/deleteUserByUserId.action?userId="+id;
       }
   }
   
   </script>
   <style type="text/css">
   a{
    text-decoration:none;
    color:blue;
   }
   </style>
</HTML>
  <head>
  </head>
  <body>
  <table 
  style="font-size:15px;color:#333333;text-align:center;margin-left:5px;margin-top:10px;borderColor:#D7D7D7;"
   	cellspacing=0 border="1" width="98%;" cellPadding=1>
							<tr bgcolor=#EBEBEB height=30>
							<td>序号</td><td>用户名</td><td>地址</td><td>联系方式</td><td>邮箱</td><td>积分</td><td>操作</td>
							</tr>
       <s:iterator value="uList" id="user" status="st">
        <tr height=30>
        <td><s:property value="#st.index+1"/></td>
        <td><s:property	value="#user.userName" /></td>
        <td><s:property	value="#user.address"/></td>
         <td><s:property value="#user.tel" /></td>
         <td><s:property value="#user.email"/></td>
          <td><s:property value="#user.balance"/></td>    
           <td><input type="button" value="删除" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;"
           onclick="userDel(<s:property value="#user.userId" />)" /></td>
         </tr>
      </s:iterator>
      </table>
     <div id="page" style="text-align:center;margin-top:5px;">
           当前第<s:property value="pageIndex"/>页&nbsp;&nbsp;
     <s:if test="%{pageIndex== 1}">
				<td>首页&nbsp;&nbsp;上一页&nbsp;&nbsp;</td>
	 </s:if>
	 <s:else>
			<td><a
				href="<%=path%>/adminUserAction.action?pageIndex=1">首页</a></td>
			<td><a
               href="<%=path%>/adminUserAction.action?pageIndex=<s:property value="%{pageIndex-1}"/>">上一页</a></td>
	 </s:else>
	 <s:if test="%{pageIndex != totalPages}">
				<td><a
					href="<%=path%>/adminUserAction.action?pageIndex=<s:property value="%{pageIndex+1}"/>">下一页</a></td>
				<td><a
					href="<%=path%>/adminUserAction.action?pageIndex=<s:property value="totalPages"/>">最后一页</a></td>
			</s:if>
	 <s:else>
			<td>下一页&nbsp;&nbsp;最后一页&nbsp;&nbsp;</td>
	 </s:else>
           共<s:property value="totalPages"/>页&nbsp;&nbsp;
           共<s:property value="count"/>条记录&nbsp;&nbsp;     
      <input type="text" name="pageIndex" id="pageIndex" style="width:25px;"/>&nbsp;
      <input type="button" value="go" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;" onclick="pageForward()">
      </div>
 </body>
 </html>