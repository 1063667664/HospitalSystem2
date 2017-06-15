function query(){
	var hospitalName=$("#hospitalName").val();
	var date=$("#begin-time").val();
	var state="未付款";  //默认查询未付款的挂号单
	if((date.length==0)){
		alert("条件日期不能为空");
	}
	else if(hospitalName.length==0){
		alert("医院名不能为空");
	}
	window.location.href="http://localhost:8080/Hospital_Guahao/"+
			"selectRegistrationOrder.action?hospitalName="
	           +hospitalName+"&state="+state+"&date="+date;
}
function hadPaid(){
	//alert("1111");
	var state="已付款";
	window.location.href="http://localhost:8080/Hospital_Guahao/"+
	"selectRegistrationOrderByState.action?state="+state;
	   
}
 function goingPaid(){
	 //alert("2222");
	 var state="未付款";
	 window.location.href="http://localhost:8080/Hospital_Guahao/"+
	 "selectRegistrationOrderByState.action?state="+state;
 }
 function deleteOrder(RId,state){
		//RId=$("#"+data).text();
	   window.location.href="http://localhost:8080/Hospital_Guahao/deleteRegistrtionPay.action?RId="+RId+"&state="+state;
 }
 function toPaid(RId){
	 //alert(RId);
	 window.location.href="http://localhost:8080/Hospital_Guahao/payAction.action?RId="+RId;
	 
 }
