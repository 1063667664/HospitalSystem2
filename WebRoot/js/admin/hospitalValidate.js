 function verifyHospitalInfo(){
    	if(document.form1.name.value==""){
    		alert("医院名称不能为空");
    		return false;
    	}
    	else if(document.form1.telephone.value==""){
    		alert("医院电话热线不能为空");
    		return false;
    	}
    	else if(!validate(document.form1.telephone.value)){
    		alert("医院电话热线格式不符合要求");
    		return false;
    	}
    	else if(document.form1.address.value==""){
    		alert("医院地址不能为空");
    		return false;
    	} 
    	return true;
    }
    function validate(telephone){
		 var reg = new RegExp("/^0[\d]{2,3}-[\d]{7,8}$/");
		 if((/^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/.test(telephone.trim()))){
			 return true;
		 }
		 else{
			 return false
		 }
	 }