$(document).ready(function(){
		 $(".button").click(function(){
			 var RId=$(this).attr("id");
				//RId=$("#"+data).text();
			    window.location.href="http://localhost:8080/Hospital_Guahao/payAction.action?RId="+RId;
		 })
		 $(".buttond").click(function(){
			 var data=$(this).attr("data");
				RId=$("#"+data).text();
			    window.location.href="http://localhost:8080/Hospital_Guahao/deleteRegistrtion.action?RId="+RId;
		 })
		});	
