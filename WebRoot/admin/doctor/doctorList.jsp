<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="error.jsp" %>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript">
   function pageForward(){
	   var pageIndex = document.getElementById('pageIndex').value;
	   var hospitalId =document.getElementById('hospitalId').value;
	   window.location.href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex="+pageIndex+"&hospitalId="+hospitalId;
   }
   function checkDoctor(id){
	   window.location.href="<%=path%>/checkDoctorByDoctorId.action?doctorId="+id;
	   
   }
   function hospitalCheck(id){
	   var pageIndex = document.getElementById('hiddenPageIndex').value;
	   window.location.href ="<%=path%>/checkHospitalDetail.action?hospitalId="+id+"&pageIndex="+pageIndex;
   }
   function addHospital(){
	   window.location.href ="<%=path%>/admin/hospital/addHospital.jsp";
   }
   function editHospital(id){
	   var pageIndex = document.getElementById('hiddenPageIndex').value;
	   window.location.href="<%=path%>/checkEditHospital.action?hospitalId="+id+"&pageIndex="+pageIndex;
   }
   function addDoctor(id){
		   window.location.href ="<%=path%>/forwardAddDoctorPage.action?hospitalId="+id;
   }
   function delDoctor(id){
	   var hospitalId =document.getElementById('hospitalId').value;
	   if(confirm('您确定删除该医生吗？'))
       {
           window.location.href="<%=path%>/delDoctorByDoctorId.action?doctorId="+id+"&hospitalId="+hospitalId;
       }
   }
   function editDoctor(id){
	   window.location.href="<%=path%>/editDoctor.action?doctorId="+id;
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
  <font color=#65C0EE size=5><s:property value="hositalName"/></font><br>
    <table 
  style="font-size:15px;color:#333333;text-align:center;margin-left:5px;margin-top:10px;borderColor:#D7D7D7;"
   	cellspacing=0 border="1" width="98%;" cellPadding=1>
							<tr bgcolor=#EBEBEB height=30>
							<td>序号</td><td>医生名字</td><td>所在科室</td><td>职称</td><td>挂号单价(元)</td><td>操作</td>
							</tr>
       <s:iterator value="dList" id="doctor" status="st">
        <tr height=30>
        <td><s:property value="#st.index+1"/></td>
        <td><s:property	value="#doctor.name" /></td>
        <td><s:property	value="#doctor.department.name"/></td>
         <td><s:property value="#doctor.academicTitle" /></td>
         <td><s:property value="#doctor.regfee"/></td>    
           <td>
           <input type="button" value="删除" style="border-radius:2px;font-weight:bolder;font-size:13px;border:3px solid #0090DB;background:#0090DB;color:#FFEDF1;"
           onclick="delDoctor(<s:property value="#doctor.doctorId" />)" 
           onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/> 
           <input type="button" value="查看" style="border-radius:2px;font-weight:bolder;font-size:13px;border:3px solid #0090DB;background:#0090DB;color:#FFEDF1;"
           onclick="checkDoctor(<s:property	value="#doctor.doctorId"/>)" 
           onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>   
				<input type="button" value="修改" style="border-radius:2px;font-weight:bolder;font-size:13px;border:3px solid #0090DB;background:#0090DB;color:#FFEDF1;"
           onclick="editDoctor(<s:property value="#doctor.doctorId" />)" 
           onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>    
           </td>
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
				href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex=1&hospitalId=<s:property value="hospitalId"/>">首页</a></td>
			<td><a
               href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex=<s:property value="%{pageIndex-1}"/>&hospitalId=<s:property value="hospitalId"/>">上一页</a></td>
	 </s:else>
	 <s:if test="%{pageIndex != totalPages}">
				<td><a
					href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex=<s:property value="%{pageIndex+1}"/>&hospitalId=<s:property value="hospitalId"/>">下一页</a></td>
				<td><a
					href="<%=path%>/checkDoctorsByHospitalId.action?pageIndex=<s:property value="totalPages"/>&hospitalId=<s:property value="hospitalId"/>">最后一页</a></td>
			</s:if>
	 <s:else>
			<td>下一页&nbsp;&nbsp;最后一页&nbsp;&nbsp;</td>
	 </s:else>
           共<s:property value="totalPages"/>页&nbsp;&nbsp;
           共<s:property value="count"/>条记录&nbsp;&nbsp;     
      <input type="text" name="pageIndex" id="pageIndex" style="width:25px;"/>&nbsp;
      <input type="button" value="go" style="border-radius:2px;font-size:13px;background-color:#D7D7D7;" onclick="pageForward()">
      </div>
      <input type="button" value="新增医生" onclick="addDoctor(<s:property value="hospitalId"/>);"
      style="margin-left:5px;margin-top:10px;font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:100;position:absolute;background:#0090DB;color:#FFEDF1;"
      onMouseOver="this.style.backgroundColor='#EF972B';"
				onMouseOut="this.style.backgroundColor ='#0090DB';"/>
      <input type="hidden" id="hospitalId" value="<s:property value="hospitalId"/>"/>
      <input type="hidden" id="hiddenPageIndex" value="<s:property value="pageIndex"/>"/>
 </body>
 </html>