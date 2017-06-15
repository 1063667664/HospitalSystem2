<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <script type="text/javascript">
   function pageForward(){
	   var pageIndex = document.getElementById('pageIndex').value;
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href="<%=path%>/findAllDepsById.action?pageIndex="+pageIndex+"&hospitalId="+hospitalId;
   }
   function addDepartment(){
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href = "<%=path%>/frowardAddDeptPage.action?hospitalId="+hospitalId;
   }
   function delDeptartment(id){
	   if(confirm('您确定删除该科室吗？'))
       {		
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href = "<%=path%>/delDepartment.action?departmentId="+id+"&hospitalId="+hospitalId;
       }
   }
   function back(){
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href = "<%=path%>/departmentManage.action?hospitalId="+hospitalId;
   }
   </script>
   <style type="text/css">
   a{
    text-decoration:none;
    color:blue;
   }
   </style>
  <body>
  <span style="margin-left:30px;margin-top:15px;">
  <font color=#65C0EE size=5><s:property value="hospitalName"/></font></span><br>
      <div >
      <s:iterator value="depLists" id="dept" status="item">
				<div
				style="height:40px;line-height:40px;margin-left:30px;color:#0090DB;border-bottom:#D7D7D7 1px dashed;">			   
			     <font
					size=3><s:property value="#dept.name"/></font>&nbsp;
					<input type="button" value="删除" style="border-radius:2px;font-size:12px;background-color:#D7D7D7;"
					onclick="delDeptartment(<s:property value="#dept.departmentId"/>)"
					/>
			    </div>
	</s:iterator>
	  <div style="margin-left:30px;margin-top:10px;">
	   当前第<s:property value="pageIndex"/>页&nbsp;&nbsp;
     <s:if test="%{pageIndex== 1}">
				首页&nbsp;&nbsp;上一页&nbsp;&nbsp;
	 </s:if>
	 <s:else>
			<a
				href="<%=path%>/findAllDepsById.action?pageIndex=1&hospitalId=<s:property value="hospitalId"/>">首页</a>
			<a
               href="<%=path%>/findAllDepsById.action?pageIndex=<s:property value="%{pageIndex-1}"/>&hospitalId=<s:property value="hospitalId"/>">上一页</a>
	 </s:else>
	 <s:if test="%{pageIndex != totalPages}">
				<a
					href="<%=path%>/findAllDepsById.action?pageIndex=<s:property value="%{pageIndex+1}"/>&hospitalId=<s:property value="hospitalId"/>">下一页</a>
				<a
					href="<%=path%>/findAllDepsById.action?pageIndex=<s:property value="totalPages"/>&hospitalId=<s:property value="hospitalId"/>">最后一页</a>
			</s:if>
	 <s:else>
			下一页&nbsp;&nbsp;最后一页&nbsp;&nbsp;
	 </s:else>
           共<s:property value="totalPages"/>页&nbsp;&nbsp;
           共<s:property value="count"/>条记录&nbsp;&nbsp;  
      <input type="text" name="pageIndex" id="pageIndex" style="width:25px;"/>&nbsp;
      <input type="button" value="go" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;" onclick="pageForward()">
      <input type="hidden" id="hospitalId" value="<s:property value="hospitalId"/>"/>
      <input type="hidden" id="hiddenPageIndex" value="<s:property value="pageIndex"/>"/>
   </div>
   <input type="button" value="新增科室" onclick="addDepartment();"
      style="margin-left:30px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;"
      onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>
      <input type="button" value="返回" onclick="back();"
         style="margin-top:10px;margin-left:130px;background:#F7B52C;width:100;height:30;font-weight:bolder;font-size:15px;border:3px solid #0090DB;position:absolute;background:#0090DB;color:#FFEDF1;" onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';" />
   </div>
  </body>
</html>