<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/candanlan.js"></script>
<script type="text/javascript" src="js/selectTime.js">	
</script>
<style type="text/css">
.blue {
	background-color: #0298FD;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	margin-left: 13px;
	border-color: #05A1FC;
}

.brone {
	background-color: #CD6504;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	margin-left: 13px;
	border-color: #CD6504;
}

.blue1 {
	background-color: #0298FD;
	color: #FFFFFF;
	border-radius: 4px;
	width: 50px;
	height: 26px;
	padding-left: 6px;
	border-color: #05A1FC;
}

.timeT2 table {
	border-right: 1px solid #D7D7D7;
	border-bottom: 1px solid #D7D7D7
}

.timeT2 table td {
	border-left: 1px solid #D7D7D7;
	border-top: 1px solid #D7D7D7
}

#hidebg {
	position: absolute;
	left: 0px;
	top: 0px;
	background-color: #000;
	width: 100%;
	opacity: 0.6;
	display: none;
	z-Index: 2;
}
</style>
<script language="javascript" type="text/javascript" src="js/weekday.js">	
</script>
<script type="text/javascript" src="js/timetable.js"></script>
</head>
<%@include file="head.jsp"%>
<body bgcolor="#FFFFFF">
	<div id="back"
		style="width:40;height:128px;position:absolute;top:230.2px;margin-left:180;position:fixed;background-color:#A6BDC5;text-align:center;">
		<img src="images/hospital/back.PNG;"
			style="padding-left:3px;width:25px;height:25;text-align:center;" /> <font
			size=2 color=#DEEBF3> 选<br> 其<br> 他<br> 医<br>
			院
		</font>
	</div>
	<div id="content"
		style="width:1000px;height:1200px;border:1px solid #CBCBCB;margin-left:200px;margin-top:12px;">
		<div
			style="width:32%;height:100%;border-right:1px solid #CBCBCB;float:left;">
			<div id=rolllinkk
				style="OVERFLOW:hidden; WIDTH: 300px; HEIGHT:100%;margin-left:25px;">
				<div id=rolllinkk1>
					<table width="280px;">
						<tr>
							<td><font size=2 color=#FF9B3F>广州市妇女儿童医疗中心珠江新城</font></td>
						</tr>
						<tr>
							<td><img src="images/hospital/gzFne.jpg" alt="whx"
								style="width:230;" /></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>等级：三级医院</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>地址：广州市天河区珠江新城金穗路9号（近华穗路）</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>电话：2081886332</font></td>
						</tr>
						<tr>
							<td>简介:</td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>广州市妇女儿童医疗中心（以下简称“妇儿中心”）是于2006年9月经广州市编制委员会批准成立，由原广州市儿童医院和广州市妇幼保健院（广州市妇婴医院）整合而成，加挂广州市妇幼保健院、广州市儿童医院和广州市妇婴医院的牌子，为市副局级事业单位。
							</font></td>
						</tr>
					</table>
					<br />
					<table width="280px;">
						<tr>
							<td><font size=2 color=#FF9B3F>广州医科大学附属第二医院</font></td>
						</tr>
						<tr>
							<td><img src="images/hospital/gzyFirst.png" alt="whx"
								style="width:230;" /></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>等级：三级医院</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>地址：广州市海珠区昌岗东路250号</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>电话：34152282</font></td>
						</tr>
						<tr>
							<td>简介:</td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>广州医科大学附属第二医院（简称广医二院）于1982年12月正式挂牌，2004年8月成立广州医学院第二临床学院。2013年6月医院正式更名为广州医科大学附属第二医院，广州医学院第二临床学院更名为广州医科大学第二临床学院。经过30年的艰苦创业，医院不断发展壮大，已发展成为人才队伍齐备、学科力量雄厚、医疗技术精湛、科教成果丰硕、诊疗设备先进、医疗服务完善，
							</font></td>
						</tr>
					</table>
					<br />
					<table width="280px;">
						<tr>
							<td><font size=2 color=#FF9B3F>广州市南沙中心医院</font></td>
						</tr>
						<tr>
							<td><img src="images/hospital/gzsNan.jpg" alt="whx"
								style="width:230;" /></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>等级：三级医院</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>地址：广州市南沙区丰泽东路105号</font></td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>电话：020-22903666</font></td>
						</tr>
						<tr>
							<td>简介:</td>
						</tr>
						<tr>
							<td><font size=2 color=#333333>广州市南沙中心医院是广州市人民政府与南沙区人民政府为完善南沙区的医疗设施配置，
									加快南部广州新城建设而共同投资的，南沙区内唯一一所按三级医院标准兴建的综合性医院。 </font></td>
						</tr>
					</table>
				</div>
				<div id=rolllinkk2></div>
			</div>
			<SCRIPT>
				var rollspeed = 25
				rolllinkk2.innerHTML = rolllinkk1.innerHTML //
				function Marquee1() {
					if (rolllinkk2.offsetTop - rolllinkk.scrollTop <= 0) //
						rolllinkk.scrollTop -= rolllinkk1.offsetHeight //
					else {
						rolllinkk.scrollTop++
					}
				}
				var MyMar1 = setInterval(Marquee1, rollspeed)
				rolllinkk.onmouseover = function() {
					clearInterval(MyMar1)
				}//
				rolllinkk.onmouseout = function() {
					MyMar1 = setInterval(Marquee1, rollspeed)
				}//
			</SCRIPT>
		</div>
		<div
			style="height:100%;width:1.5%;background:-webkit-gradient(linear, 100% 0%, 0% 0%, from(#FFFFFF), to(#EDEDED));border:0px;float:left;"></div>
		<div style="float:left;height:100%;">
			<div style="margin-top:40px;border-bottom:1px solid #CBCBCB;">
				<font size=5 color=#0099FE><s:property value="departmentName"/></font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<a href="#" style="text-decoration:none;" onclick="javascript:history.go(-1);"><font size=3 color=#FEAA27 >《选择其他科室</font></a>
			</div>
			<div id="showDoctorLists">
			<s:iterator value="listDoctors" id="doctor" status="st">
			  <input type="hidden" id="<s:property value="#st.index+1"/>" value="<s:property value="#doctor.doctorId"/>"/>
				<div style="width:100%;border-bottom:1px solid #CBCBCB;">
					<div style="width:100%;height:155px;float:top;">
						<div style="float:left;height:130px;">
							<img src="images/doctor/doctor.PNG" alt="whx" width="85px"
								height="110px" />
						</div>
						<div style="float:left;margin-top:5px;width:300px;height:130px;">
							<div id="<s:property value="#st.index+1"/>" style="margin-top:8px;">
								<font size=3 color=#FF6700><s:property
										value="#doctor.name" /></font>
							</div>
							<div style="margin-top:8px;">
								<font size=2 color=#333333><s:property
										value="#doctor.academicTitle" /></font>
							</div>
							<div style="margin-top:8px;">
								<font size=1 color=#333333><s:property
										value="#doctor.speciality" /></font>
							</div>
							
						</div>
						<div id='n_<s:property value="#st.index+1"/>' class="checkTable"
							style="width:100px;height:50px;text-align:center;line-height:50px;border:1px solid #CBCBCB;float:left;margin-left:100px;margin-top:50px;background-color:#EBEBEB;">
							<span><font color=#996634 size=2><b>查看排班表</b></font></span>
						</div>
					</div>
					<div id="n_<s:property value="#st.index+1"/>_t"
						style="display:none;width:100%;float:top;">
						<table style="font-size:15px;color:#333333;" borderColor=#D7D7D7
							cellspacing=0 border="1" width="98%;" cellPadding=1>
							<tr bgcolor=#EBEBEB height=36>
								<td></td>
								<td id="one_<s:property value="#st.index+1"/>"></td>
								<td id="two_<s:property value="#st.index+1"/>"></td>
								<td id="three_<s:property value="#st.index+1"/>"></td>
								<td id="four_<s:property value="#st.index+1"/>"></td>
								<td id="five_<s:property value="#st.index+1"/>"></td>
								<td id="six_<s:property value="#st.index+1"/>"></td>
								<td id="seven_<s:property value="#st.index+1"/>"></td>
							</tr>
							<tr height=30>
								<td id="morning"><label>上午</label></td>
								<td id="one_<s:property value="#st.index+1"/>Morn"></td>
								<td id="two_<s:property value="#st.index+1"/>Morn"></td>
								<td id="three_<s:property value="#st.index+1"/>Morn"></td>
								<td id="four_<s:property value="#st.index+1"/>Morn"></td>
								<td id="five_<s:property value="#st.index+1"/>Morn"></td>
								<td id="six_<s:property value="#st.index+1"/>Morn"></td>
								<td id="seven_<s:property value="#st.index+1"/>Morn"></td>
							</tr>
							<tr height=30>
								<td id="afternoon"><label>下午</label></td>
								<td id="one_<s:property value="#st.index+1"/>After"></td>
								<td id="two_<s:property value="#st.index+1"/>After"></td>
								<td id="three_<s:property value="#st.index+1"/>After"></td>
								<td id="four_<s:property value="#st.index+1"/>After"></td>
								<td id="five_<s:property value="#st.index+1"/>After"></td>
								<td id="six_<s:property value="#st.index+1"/>After"></td>
								<td id="seven_<s:property value="#st.index+1"/>After"></td>
							</tr>
						</table>
					</div>
				</div>
				<input id="num_<s:property value="#st.index+1"/>" type="hidden"
					value='<s:property value="#doctor.name"/>' />
				<input id="listSize" type="hidden" value='<s:property value="listDoctors.size"/>'/>
				<input id="hospitalId" type="hidden" value='<s:property value="#doctor.hospital.hospitalId"/>'/>
			</s:iterator>
			</div>
			<div class="tcdPageCode"></div>
		</div>
		<!-- <a href="http://localhost:8080/Hospital_Guahao/login.jsp;">哈哈哈</a> -->
	</div>
	<input type="text" id="departmentName" value='<s:property value="departmentName"/>'/>
	<table id="timeT"
		style="border-collapse:collapse;position:absolute;position:fixed;width:500px;height:300px;left:400px;top:220px;background:#FFFFFF;display:none;z-Index:3;">
		<tr style="background:#0091E9;height:40px;color:#FFFFFF;">
			<td border=0px;>&nbsp;时间段选择</td>
			<td style="padding-right:10px;"><a href="javascript:void(0)"
				style="text-decoration:none" onclick="hidebg();"><font size=4
					color=#ffffff>X</font></a></td>
		</tr>
		<tr>
			<td style="padding-left:50px;padding-top:15px;">
				<div class="timeT2">
					<table
						style="height:240px;width:400px;text-align:center;font-color:#333333;"
						cellspacing=0>
						<tr style="background:#EBEBEB;height:50px;">
							<td style="display:none;">日期</td>
							<td>时间段</td>
							<td>号源总数</td>
							<td>剩余号源</td>
							<td>操作</td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time1">09:00-10:00</td>
							<td>3</td>
							<td id="y1"></td>
							<td><button class="blue1" id="1" onclick="jump1();">预约</button></td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time2">10:00-11:00</td>
							<td>3</td>
							<td id="y2"></td>
							<td><button class="blue1" id="2" onclick="jump2();">预约</button></td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time3">11:00-12:00</td>
							<td>3</td>
							<td id="y3"></td>
							<td><button class="blue1" id="3" onclick="jump3();">预约</button></td>
						</tr>
						<tr  id="doctorId" name="doctorId" style="display:none;">
							<td></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>

	<table id="timeT1"
		style="border-collapse:collapse;position:absolute;position:fixed;width:500px;height:300px;left:400px;top:220px;background:#FFFFFF;display:none;z-Index:3;">
		<tr style="background:#0091E9;height:40px;color:#FFFFFF;">
			<td border=0px;>&nbsp;时间段选择</td>
			<td style="padding-right:10px;"><a href="javascript:void(0)"
				style="text-decoration:none" onclick="hidebg();"><font size=4
					color=#ffffff>X</font></a></td>
		</tr>
		<tr>
			<td style="padding-left:50px;padding-top:25px;">
				<div class="timeT2">
					<table
						style="height:240px;width:400px;text-align:center;font-color:#333333;"
						cellspacing=0>
						<tr style="background:#EBEBEB;height:50px;">
							<td style="display:none;">日期</td>
							<td>时间段</td>
							<td>号源总数</td>
							<td>剩余号源</td>
							<td>操作</td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time4">14:00-15:00</td>
							<td>3</td>
							<td id="y4"><%=3-(int)(Math.random()*4) %></td>
							<td><button class="blue1" id="1" onclick="jump4();">预约</button></td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time5">15:00-16:00</td>
							<td>3</td>
							<td id="y5"><%=3-(int)(Math.random()*4) %></td>
							<td><button class="blue1" id="2" onclick="jump5();">预约</button></td>
						</tr>
						<tr>
							<td id="date" style="display:none;"></td>
							<td id="time6">16:00-17:00</td>
							<td>3</td>
							<td id="y6"><%=3-(int)(Math.random()*4) %></td>
							<td><button class="blue1" id="3" onclick="jump6();">预约</button></td>
						</tr>
						<tr style="display:none;" id="doctorN" name="doctorN">
							<td></td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
	<div id="hidebg"></div>
</body>
<script type="text/javascript">
   $(document).ready(function(){	   
	   var obj = document.getElementById('back');
	   	obj.onclick = function() {
	   		window.location.href = "http://localhost:8080/Hospital_Guahao/hospitalInitAction.action";
	   	}
   })  
</script>
</html>
