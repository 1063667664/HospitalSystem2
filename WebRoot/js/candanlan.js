window.onload = function() {
	var sy=document.getElementById('shouy');
	sy.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/login.jsp";
	};
	var hospitalSearch = document.getElementById('hospitalSearch');
	if(hospitalSearch!=null){
	hospitalSearch.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/hospitalInitAction.action";
	};
	}
	var yu = document.getElementById('yuyue');
	yu.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/registrationSelectAction.action";
	};
	var jiaof = document.getElementById('jiaofei');
	jiaof.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/userJiaofei.action";
	};
	var zx = document.getElementById('zhongxin');
	zx.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/user.action";
	};
	var zn = document.getElementById('zhinan');
	zn.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/ReservationGuide.jsp";
	};
	$("#search")
			.click(
					function() {
						var hos = $("#search_key").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospital.action?pro="
								+ hos;
					})
	$("#glyy")
			.click(
					function() {
						var pro = $("#gl").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByProperty.action?pro="
								+ pro;
					})
	$("#slyy")
			.click(
					function() {
						var pro = $("#sl").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByProperty.action?pro="
								+ pro;
					})
	$("#haizhu")
			.click(
					function() {
						var pro = $("#hz").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#tianhe")
			.click(
					function() {
						var pro = $("#th").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#panyu")
			.click(
					function() {
						var pro = $("#py").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#liwan")
			.click(
					function() {
						var pro = $("#lw").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#yuexiu")
			.click(
					function() {
						var pro = $("#yuex").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#baiyun")
			.click(
					function() {
						var pro = $("#by").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#huangpu")
			.click(
					function() {
						var pro = $("#hp").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#zengcheng")
			.click(
					function() {
						var pro = $("#zc").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#huadu")
			.click(
					function() {
						var pro = $("#hd").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByArea.action?pro="
								+ pro;
					})
	$("#tedeng")
			.click(
					function() {
						var pro = $("#ted").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByRank.action?pro="
								+ pro;
					})
	$("#sanji")
			.click(
					function() {
						var pro = $("#sanj").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByRank.action?pro="
								+ pro;
					})
	$("#yiji")
			.click(
					function() {
						var pro = $("#yj").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByRank.action?pro="
								+ pro;
					})
	$("#erji")
			.click(
					function() {
						var pro = $("#ej").val();
						window.location.href = "http://localhost:8080/Hospital_Guahao/searchHospitalByRank.action?pro="
								+ pro;
					})
					$(".button").click(function(){
	 var data=$(this).attr("data");
		RId=$("#"+data).text();
	    window.location.href="http://localhost:8080/Hospital_Guahao/payAction.action?RId="+RId;
 })
 $(".buttond").click(function(){
	 var data=$(this).attr("data");
		RId=$("#"+data).text();
	    window.location.href="http://localhost:8080/Hospital_Guahao/deleteRegistrtion.action?RId="+RId;
 })
	var hospitalSearch = document.getElementById('backIt');
	   hospitalSearch.onclick = function() {
		window.location.href = "http://localhost:8080/Hospital_Guahao/hospitalInitAction.action";
	}; 
}