function saveInfo(){
	  var regfee =document.getElementById('regfee').value;
	  var departmentId =document.getElementById('departmentId').value;
	  var name =document.getElementById('name').value;
	  var sex =document.getElementById('sex').value;
	  var academicTitle=document.getElementById('academicTitle').value;
	  if(academicTitle==''){
		  alert("医生级称不能为空");
		  return false;
	  }
	  if(name==''){
		  alert("医生姓名不能为空");
		  return false;
	  }
	  if(!(sex=='男'||sex=='女')){
		  alert("医生性别格式不正确");
		  return false;
	  }
	  if(departmentId==''){
		  alert("科室号不能为空"); 
		  return false;
	  }
	  else if(!validate(departmentId)){
		  alert("科室号必须为数字"); 
		  return false; 
	  }
	  if(regfee==''){
		  alert("挂号单费用不能为空");
		  return false;
	  }
	  else if(!validate(regfee)){
		  alert("挂号单费用必须为整数数字");
		  return false;
	  }
	  else if(regfee.length>6){
		  alert("挂号单费用不能过大");
		  return false;
	  }
	  else{
		  return true;
	  }
}
	 function validate(regfee){
		 var reg = new RegExp("^[0-9]*$");
		 if(!reg.test(regfee)){
			 return false;
		 }
		 else{
			 return true
		 }
	 }