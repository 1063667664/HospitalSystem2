<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>weihuaxiao.guahao.system</title>
<style>
* {
	margin: 0;
	padding: 0;
}
a{
   text-decoration:none;
   color:blue;
}
#doctorSearch{
   margin-left:200px;margin-top:10px;
   border:1px solid #D0D0D0;
   width:700px;
   height:420px;
   float:left;
}
#usualPro ul{
   padding-top:10px;
}
#usualPro ul li{
   margin-left:25px;
   font-size:14px;
   margin-top:10px;
   color:#795F52;
}
#doctorSearch ul{
   padding-left:15px;
   
}
#doctorSearch ul li{
   list-style:none;
   height:50px;
   line-height:50px;
   border-bottom:1px dashed #AAAAAA;
   padding-left:20px;
   color:#795F52;
   font-size:15px;
}
</style>
<link rel="stylesheet" type="text/css" href="css/sucaijiayuan.css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/verifyCode.js"></script>
<script type="text/javascript" src="js/slide.js"></script>
<script type="text/javascript" src="js/animation.js"></script>

</head>
<body bgcolor="#FFFFFF">
	<%@include file="head.jsp"%>
	<div class="ca1_slide" style="padding-left:200px;float:left;margin-top:15px;"> 
	<div id="slider-wrapper"> 
		<div id="slider-bg">				
				<div id="slider-photos"> 
					<div id="slides"> 
						<div class="slides_container"> 						 		 
			<div class="slide"> 
               <img src="images/2.jpg" width="700" height="300" alt="whx"/> 
               <div class="caption" style="bottom:0"> 
                <h1><a href="#" style="text-decoration:none;font-size:12px;"><b>梨子挂号系统就是好！！</b></a></h1> 
              </div> 
            </div>                                                                                                                                                                <div class="slide"> 
                <img src="images/4.jpg" width="700" height="300" alt="whx"/> 
                <div class="caption" style="bottom:0"> 
                  <h1><a href="#" style="text-decoration:none;font-size:12px;"><b>挂号系统大大方便了人们的挂号</b></a></h1> 
                 </div> 
			</div> 
			<div class="slide"> 
			<img src="images/1.jpg" width="700" height="300" alt="whx"/> 
			  <div class="caption" style="bottom:0"> 
				<h1><a href="#" style="text-decoration:none;font-size:12px;"><b>中山大学附属医院也加入了我们哦！</b></a></h1> 
				</div> 
         </div> 
                                                                                                                                                                     <div class="slide"> 
              <img src="images/3.jpg" width="700" height="300" alt="whx"/> 
            <div class="caption" style="bottom:0"> 
               <h1><a href="#" style="text-decoration:none;font-size:12px;"><b>梨子挂号系统杠杆的</b></a></h1> 
            </div> 
        </div> 
          </div>	
            <a href="#" class="prev"><img src="images/arrow-prev.png" width="30" height="70" alt="Arrow Prev" border="0"></a> 
            <a href="#" class="next"><img src="images/arrow-next.png" width="30" height="70" alt="Arrow Next" border="0"></a>								
		</div> 
	</div> 
	</div> 
</div> 
</div> 
<div id="login" style="width:290; height:330;border:1px solid #D0D0D0;float:left;margin-left:10px;margin-top:15px;">
<div style="width:290px;height:40px;border:0px solid #000;background-color:#F2F2F2;line-height:40px;">
    <font style="margin-left:10px"><b>用户登录</font>  </div>
    <font color="red">
    <s:actionerror/>
    <s:fielderror/>
    </font>
    <form action="loginValidate.action" method="post">
    <table>
    <tr><td>用户名：</td></tr>
    <tr><td><input type="text" name="userName" style="border-radius:5px;width:200;height:25px;"/></td></tr>
    <tr><td>密码:</td></tr>
	<tr><td><input type="password" name="userPwd" style="border-radius:5px;width:200;height:25px;"/></td></tr>
	<tr><td>验证码：</td><tr>
	<tr><td><input type="text" name="safecode"  style="border-radius:5px;width:200;height:25px;"/></td>
	<td><!-- <img src="safecode" id="safecode"/> -->
	 <img src="SecurityCodeImageAction" id="Verify" style="cursor:hand;" alt="看不清，换一张"/></td></tr>
	<tr><td>&nbsp;</td></tr>
	<tr><td>
	<input  type="submit" value="登录" style="border-radius:5px;font-size:20px;background-color:#FFB336;width:93;height:40;">
	<input type="button" value="注册" style="border-radius:5px;font-size:20px;background-color:#EEEFED;width:93;height:40;" onclick="window.location.href ='http://localhost:8080/Hospital_Guahao/reg.action'";/>
	</td>
	</tr>
	<tr><td><a href="http://localhost:8080/Hospital_Guahao/forgetPassword.jsp" >忘记密码？</a></td></tr>	
    </table>
    <font color=red>${tip4}</font>
    </form>
</div>
	<div id="doctorSearch" >
	<img src="images/illNess_Doc.PNG" width=700 style="margin-top:-2px;"/>
	<ul>
	<li ><font color=#FD7601 size=4>内科  </font> 
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=流行性感冒"> 流行性感冒</a> &nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=糖尿病"> 糖尿病&nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=胃炎">胃炎&nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=高血压">高血压&nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=心肌梗死">心肌梗死&nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=冠心病">冠心病&nbsp;
	   <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=气胸">气胸</li>
	<li ><font color=#FD7601 size=4>外科  </font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=肛裂">肛裂</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=前列腺增生">前列腺增生</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness= 鞘膜积液">鞘膜积液</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness= 包茎">包茎</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=精囊炎">精囊炎</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=肾损伤">肾损伤</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=睾丸扭转"> 睾丸扭转</a> &nbsp;
	 </li>
	 <li ><font color=#FD7601 size=4>妇产科  </font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=子宫肌瘤">子宫肌瘤</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=卵巢囊肿">卵巢囊肿</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=不孕不育">不孕不育</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=宫颈炎">宫颈炎</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=子宫内膜异位症">子宫内膜异位症</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=前病变阴道炎">前病变阴道炎</a>
	 </li>
	  <li ><font color=#FD7601 size=4>儿科  </font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿厌食">小儿厌食</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿多动症">小儿多动症</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿感冒">小儿感冒</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿哮喘">小儿哮喘</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿咳嗽">小儿咳嗽</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=小儿支气管炎">小儿支气管炎</a>
	 </li>
	 <li ><font color=#FD7601 size=4>男科 </font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=男性不育">男性不育</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=遗精">遗精</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=包皮过长">包皮过长</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=精索静脉曲张">精索静脉曲张</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=前列腺炎">前列腺炎</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=性功能障碍">性功能障碍</a>
	 </li>
	  <li ><font color=#FD7601 size=4>五官科</font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=白内障">白内障</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=红眼病">红眼病</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=沙眼">沙眼</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=近视">近视</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=斜视">斜视</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=鼻息肉">鼻息肉</a>
	 </li>
	  <li ><font color=#FD7601 size=4>精神病科</font>
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=网瘾">网瘾</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=焦虑症强迫症">焦虑症强迫症</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=精神分裂症">精神分裂症</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=性冷淡">性冷淡</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=抑郁症">抑郁症</a> &nbsp;
	    <a href="http://localhost:8080/Hospital_Guahao/searchDoctorByIllness.action?illness=妄想症">妄想症</a>
	 </li>
	</ul>
	</div>
	<div style="margin-top:360px;margin-left:910;
	             border:1px solid #D0D0D0;width:290px;height:138px;">
	<img src="images/quickSearch.PNG" style="width:290;">
	   <div style="margin-left:6%;margin-top:10%;">
	         <form action="searchDoctorByDoctorName.action" method="post">
			 <input type="text" id="search_key" name="doctorName"
				placeholder="请输入医生名字"
				style="width:210px;height:30px;border:2px solid #0090DB" /> <input
				type="submit" value="搜索" onclick=""
				style="font-weight:bolder;font-size:15px;border:3px solid #0090DB;height:30px;width:42;position:absolute;background:#0090DB;color:#FFEDF1;"
				id="search">
			</form>
		</div>
	</div>	
	<div id="usualPro"
	    style="margin-left:910;margin-top:5px;
	             border:1px solid #D0D0D0;width:290px;height:278px;">
	             <img src="images/usualPro.PNG" style="width:290;margin-left:0;">
	              <ul>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey>如何进行预约？</font></a></li>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey>预约成功后，怎么取号？</font></a></li>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey>首次预约挂号可以使用哪些证件？</font></a></li>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey>如何支付挂号费呢？</font></a></li>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey> 为什么系统提示我受到限制不能挂号了</font></a></li>
	              <li><a href="http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp"><font color=grey> 注册时，为什么要求我输入手机...</font></a></li>
	              </ul>
	</div>
    <jsp:include page="foot.jsp"></jsp:include>
</body>
</html>
