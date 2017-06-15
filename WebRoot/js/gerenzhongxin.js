window.onload = function() {
	var sy=document.getElementById('shouy');
	sy.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/login.jsp";
	};
	var yc = document.getElementById('yicha');
	yicha.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/initMain.action";
	};
	var yu = document.getElementById('yuyue');
	yu.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/registrationSelectAction.action";
	};
	var jiaof = document.getElementById('jiaofei');
	jiaof.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/userJiaofei.action";
	};
	var zx = document.getElementById('zhongxin');
	zx.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/userAction.action";
	};
	var zn = document.getElementById('zhinan');
	zn.onclick = function() {
		window.location.href = "http://localhost:8080/GuaHao/ReservationGuide.jsp";
	};
}