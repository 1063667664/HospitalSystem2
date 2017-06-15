<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style type="text/css">
#search_key {
	background-image: url('images/searchKey.png');
	background-repeat: no-repeat;
	padding-left: 30px;
}

form {
	display: inline;
}
</style>
<title>My JSP 'Main.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#helloDiv").hide();
		$("#btnDisplay").html("<font size=2 >更多</font>");
	});
	function changeDisplay() {
		var helloDivObj = $("#helloDiv");
		var span = $("#btnDisplay").text();
		if (span == "更多") {
			helloDivObj.show();
			$("#btnDisplay").html("<font size=2>收起</font>");
		} else {
			helloDivObj.hide();
			$("#btnDisplay").html("<font size=2>更多</font>");
		}
	}
</script>
<script type="text/javascript" src="js/candanlan.js">	
</script>
</head>
<body bgcolor="#FFFFFF">
   <%@include file="head.jsp"%>
	<div
		style="width:1000px;margin-left:200px;border:1px solid #D7D7D7;border-bottom:0px;margin-top:20px;">
		<div style="width:1000px;height:20;border:1px solid #E7E9EC;"></div>
		<div style="margin-left:28%;margin-top:15;">
			<input type="text" id="search_key" name="search_key"
				placeholder="请输入您想搜索的医院"
				style="width:300px;height:30px;border:2px solid #0090DB" /> <input
				type="button" value="搜索"
				style="font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:50;position:absolute;background:#0090DB;color:#FFEDF1;"
				id="search">
		</div>
		<div
			style="width:100%;height:30px;border-top:1px solid #D7D7D7;margin-top:10px;">
			<span
				style="display:inline-block;width:80px;margin-left:5px;line-height:30px;"><font
				color=#818181 size=2>性质：</font> </span> <span id="glyy"
				"style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';">公立医院</font> <input
				type="hidden" id="gl" value="公立医院" /> </span> <span id="slyy"
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';">私立医院</font> <input
				type="hidden" id="sl" value="私立医院" /></span>
		</div>
		<div
			style="width:100%;height:30px;border-top:1px solid #D7D7D7;border-bottom:0px solid #D7D7D7;">
			<span
				style="display:inline-block;width:80px;margin-left:5px;line-height:30px;"><font
				color=#818181 size=2>区域：</font> </span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="haizhu">海珠区</font>
				<input type="hidden" id="hz" value="海珠" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="tianhe">天河区</font>
				<input type="hidden" id="th" value="天河" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="panyu">番禺区</font>
				<input type="hidden" id="py" value="番禺" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="liwan">荔湾区</font>
				<input type="hidden" id="lw" value="荔湾" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="yuexiu">越秀区</font>
				<input type="hidden" id="yuex" value="越秀" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="baiyun">白云区</font>
				<input type="hidden" id="by" value="白云" /></span> <span
				style="display:inline-block;width:100px;line-height:30px;"><font
				size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="huangpu">黄埔区</font>
				<input type="hidden" id="hp" value="黄埔" /></span> <span id="btnDisplay"
				style="background:#FFFFFF;color:#0093D0;" onclick="changeDisplay();">
				<font size=2 color=#0093D0
				onMouseOver="this.style.backgroundColor='#C8FFC8';"
				onMouseOut="this.style.backgroundColor ='#FFFFFF';">更多</font>
			</span>
		</div>
		<div id="helloDiv"
			style="width:100%;height:30px;border-bottom:0px solid #D7D7D7;">
			<div style="margin-left:100px;">
				<span style="display:inline-block;width:100px;line-height:30px;"><font
					size=2 color=#0093D0
					onMouseOver="this.style.backgroundColor='#C8FFC8';"
					onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="zengcheng">增城区</font>
					<input type="hidden" id="zc" value="增城" /></span> <span
					style="display:inline-block;width:100px;line-height:30px;"><font
					size=2 color=#0093D0
					onMouseOver="this.style.backgroundColor='#C8FFC8';"
					onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="huadu">花都区</font>
					<input type="hidden" id="hd" value="花都" /></span>
			</div>
		</div>
	</div>
	<div
		style="margin-left:200px;width:1000px;height:30px;border:1px solid #D7D7D7;">
		<span
			style="display:inline-block;width:80px;margin-left:5px;line-height:30px;"><font
			color=#818181 size=2>级别：</font> </span> <span
			style="display:inline-block;width:100px;line-height:30px;"><font
			size=2 color=#0093D0
			onMouseOver="this.style.backgroundColor='#C8FFC8';"
			onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="tedeng">特等医院</font>
			<input type="hidden" id="ted" value="特等医院" /></span> <span
			style="display:inline-block;width:100px;line-height:30px;"><font
			size=2 color=#0093D0
			onMouseOver="this.style.backgroundColor='#C8FFC8';"
			onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="yiji">一级医院</font>
			<input type="hidden" id="yj" value="一级医院" /></span> <span
			style="display:inline-block;width:100px;line-height:30px;"><font
			size=2 color=#0093D0
			onMouseOver="this.style.backgroundColor='#C8FFC8';"
			onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="erji">二级医院</font>
			<input type="hidden" id="ej" value="二级医院" /></span> <span
			style="display:inline-block;width:100px;line-height:30px;"><font
			size=2 color=#0093D0
			onMouseOver="this.style.backgroundColor='#C8FFC8';"
			onMouseOut="this.style.backgroundColor ='#FFFFFF';" id="sanji">三级医院</font>
			<input type="hidden" id="sanj" value="三级医院" /></span>
	</div>
	<div
		style="margin-left:200px;margin-top:20px;width:1000px;border-top:1px solid #D7D7D7;"></div>
	<s:iterator value="pageBean.list">
		<div
			style="margin-left:200px;width:1000px;height:180px;border-bottom:1px solid #D7D7D7;border-left:1px solid #D7D7D7;border-right:1px solid #D7D7D7;">
			<div
				style="float:left;margin-top:5px;margin-left:5px;margin-bottom:5px;">
				<img src="<s:property value="path"/>" width="220" height="160"
					alt="whx" />
			</div>
			<div style="margin-left:10px;float:left;width:500px;">
				<div style="margin-top:4px;">
					<font color=#65C0EE size=5> <s:property value="name" />
					</font>
				</div>
				<div style="margin-top:6px;">
					<font color=#818181 size=2>级别：</font> <font color=#EF972B size=3><s:property
							value="rank" /> </font>
				</div>
				<div style="margin-top:6px;">
					<font color=#818181 size=2>电话：</font> <font color=#EF972B size=3><s:property
							value="telephone" /> </font>
				</div>
				<div style="margin-top:6px;">
					<font color=#818181 size=2>性质：</font> <font color=#EF972B size=3><s:property
							value="property" /> </font>
				</div>
				<div style="margin-top:6px;">
					<font color=#818181 size=2>地址：</font> <font color=#EF972B size=3><s:property
							value="address" /> </font>
				</div>
			</div>
			<div
				style="width:85;height:56;float:left;text-align:center;line-height:56px;margin-top:60px;
              margin-left:50px;background:#F7B52C;"
				onMouseOver="this.style.backgroundColor='#FFD700';"
				onMouseOut="this.style.backgroundColor ='#F7B52C';">
				<a
					href="/Hospital_Guahao/hospitalAction.action?id=<s:property value="hospitalId"/>"
					style="text-decoration: none"><font size=3 color=#FEFAF5>
						现在预约</font></a>
			</div>
		</div>
	</s:iterator>
	<table style="width:700px;margin-left:200;">
		<tr>
		
			<s:if test="%{pageBean.currentPage == 1}">
				<td>首页  上一页</td>
			</s:if>
			<s:else>
				<td><a
					href="<s:property value="curPath"/>?page=1&pro=<s:property value="searchPro"/>">首页</a></td>
				<td><a
					href="<s:property value="curPath"/>?page=<s:property value="%{pageBean.currentPage-1}"/>&pro=<s:property value="searchPro"/>">上一页</a></td>
			</s:else>
		
			<s:if test="%{pageBean.currentPage != pageBean.totalPage}">
				<td><a
					href="<s:property value="curPath"/>?page=<s:property value="%{pageBean.currentPage+1}"/>&pro=<s:property value="searchPro"/>">下一页</a></td>
				<td><a
					href="<s:property value="curPath"/>?page=<s:property value="pageBean.totalPage"/>&pro=<s:property value="searchPro"/>">最后一页</a></td>
			</s:if>

			<s:else>
				<td>下一页 最后一页</td>
			</s:else>
			<td>当前第<s:property value="pageBean.currentPage" />页
			</td>
			<td>共<s:property value="pageBean.totalPage" />页
			</td>
			<td>共<s:property value="pageBean.allRow" />条记录
			</td>
		</tr>
	</table>
</body>
</html>
