function Edit(){
   //alert("null");
  $('#userRealName').attr("disabled",false);
  $('#userName').attr("disabled",false);
  $('#sex').attr("disabled",false);
  $('#address').attr("disabled",false);
  $('#tel').attr("disabled",false);
  $('#identificationId').attr("disabled",false);
  $('#birthday').attr("disabled",false);
}
function Save(){
	$('#userRealName').attr("disabled",true);
	  $('#userName').attr("disabled",true);
	  $('#sex').attr("disabled",true);
	  $('#address').attr("disabled",true);
	  $('#tel').attr("disabled",true);
	  $('#identificationId').attr("disabled",true);
	  $('#birthday').attr("disabled",true);
}
