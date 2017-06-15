window.onload = function(){
	var sy=document.getElementById('shouy');
	sy.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/login.jsp";
	};
	var yu = document.getElementById('yuyue');
	yu.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/registrationSelectAction.action";
	};
	var yc = document.getElementById('yicha');
	yicha.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/initMain.action";
	};
	var zx = document.getElementById('zhongxin');
	zx.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/userAction.action";
	};
	var jf = document.getElementById('jiaofei');
	jf.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/userJiaofei.action";
	};
	var obj = document.getElementById('back');
	obj.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/initMain.action";
	}
	var zn = document.getElementById('zhinan');
	zn.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/ReservationGuide.jsp";
	};
	
	
}