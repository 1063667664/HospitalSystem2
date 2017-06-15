$(window).load(function() {
	 $("#userName").mouseleave(function() {
	 $("#nametip").show();	 
			$.post("/Hospital_Guahao/isUserNameFit_Register.action", {
				"userName" : $("#userName").val()
			}, function(tip) {
			if(tip=="√"){
					$("#nametip").text(tip).css("color","green"); 
			}
			else {
			$("#nametip").text(tip).css("color","red");
	}
			});
 })
   $("#password").mouseleave(function() {
	        $("#passwordtip").show();	 
			$.post("/Hospital_Guahao/isPasswordFit_Register.action", {
				"password" : $("#password").val()
			}, function(passwordTip) {
				
			if(passwordTip=="√"){
					$("#passwordtip").text(passwordTip).css("color","green"); 
			}
			else {
			$("#passwordtip").text(passwordTip).css("color","red");
	}
			});
 })
      $("#ackpassword").mouseleave(function() {
	        $("#ackpasswordtip").show();	 
			$.post("/Hospital_Guahao/isTheTwoPasswordsSame_Register.action", {
				"password" : $("#password").val(),
				"ackpassword" : $("#ackpassword").val()
			}, function(rePasswordTip) {
			if(rePasswordTip=="√"){
		       $("#ackpasswordtip").text(rePasswordTip).css("color","green"); 
			}
			else {
			$("#ackpasswordtip").text(rePasswordTip).css("color","red");
	}
			});
 })
 $("#realName").mouseleave(function() {
	        $("#realNameTip").show();	 
			$.post("/Hospital_Guahao/isRealNameFormatRight_Register.action", {
				"realName" : $("#realName").val()
			}, function(realNameTip) {
			if(realNameTip=="√"){
		       $("#realNameTip").text(realNameTip).css("color","green"); 
			}
			else {
			$("#realNameTip").text(realNameTip).css("color","red");
	}
			});
 })
    $("#idcard").mouseleave(function() {
	        $("#idCardTip").show();	 
			$.post("/Hospital_Guahao/isIDCardFormatRight_Register.action", {
				"IDCard" : $("#idcard").val()
			}, function(idCardTip) {
			if(idCardTip=="√"){
		       $("#idCardTip").text(idCardTip).css("color","green"); 
			}
			else {
			$("#idCardTip").text(idCardTip).css("color","red");
	}
			});
 })
  $("#address").mouseleave(function() {
	        $("#addressTip").show();	 
			$.post("/Hospital_Guahao/isAddressFormatRight_Register.action", {
				"address" : $("#address").val()
			}, function(addressTip) {
			if(addressTip=="√"){
		       $("#addressTip").text(addressTip).css("color","green"); 
			}
			else {
			$("#addressTip").text(addressTip).css("color","red");
	}
			});
 })
    $("#verifyCode").mouseleave(function() {
	        $("#verifyCodeTip").show();	 
			$.post("/Hospital_Guahao/isVerifyCodeRight_Register.action", {
				"verifyCode" : $("#verifyCode").val()
			}, function(verifyCodeTip) {
			if(verifyCodeTip=="√"){
		       $("#verifyCodeTip").text(verifyCodeTip).css("color","green"); 
			}
			else {
			$("#verifyCodeTip").text(verifyCodeTip).css("color","red");
	}
			});
 })
     $("#myFile").mouseleave(function() {
	        $("#myFileTip").show();	 
			$.post("/Hospital_Guahao/isFileNotNull_Register.action", {
				"myFileName" :  $("#myFile").val()
			}, function(myFileTip) {
			    
			if(myFileTip=="√"){
		       $("#myFileTip").text(myFileTip).css("color","green"); 
			}
			else {
			$("#myFileTip").text(myFileTip).css("color","red");
	}
			});
 })
   $("#telephone").mouseleave(function() {
	        $("#telephoneTip").show();	 
			$.post("/Hospital_Guahao/isTelephoneFormatRight_Register.action", {
				"telephone" : $("#telephone").val()
			}, function(telephoneTip) {
			if(telephoneTip=="√"){
		       $("#telephoneTip").text(telephoneTip).css("color","green"); 
			}
			else {
  			$("#telephoneTip").text(telephoneTip).css("color","red");
	}
			});
 })
	});
$(function() {
	$("#Verify").click(
			function() {
				$(this).attr(
						"src",
						"SecurityCodeImageAction?timestamp="
								+ new Date().getTime());
			});
});