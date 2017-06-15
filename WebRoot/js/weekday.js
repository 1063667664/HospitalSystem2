function hh(n,i){
    var now =new Date();
    var month=now.getMonth();
    var year=now.getFullYear();
    var day=now.getDate();
    var tday=1;
    var tempday=1;
    var month1=month+1 
    var day1=day+1 
    var day2=day+2 
    var day3=day+3
    var day4=day+4
    var day5=day+5 
    var day6=day+6 
    var day7=day+7
    day1<10?day1='0'+day1:day1
    day2<10?day2='0'+day2:day2
    day3<10?day3='0'+day3:day3
    day4<10?day4='0'+day4:day4
    day5<10?day5='0'+day5:day5
    day6<10?day6='0'+day6:day6
    day7<10?day7='0'+day7:day7
    month1<10?month1='0'+month1:month1
    var month2=month+2
    month2<10?month2='0'+month2:month2
    var wd;
    if(day+7>n){
     tday=day+7-n
     tempday=tday
     tempday<10?tempday='0'+tempday:tday
     wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
     document.getElementById("seven_"+i).innerHTML=month2+"/"+tempday+" "+wd;
   
    }
    else{
    wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day7).getDay())
    document.getElementById("seven_"+i).innerHTML=month1+"/"+day7+" "+wd;
    }
    if(day+6>n){
    tday=day+6-n
    tempday=tday
    tempday<10?tempday='0'+tempday:tday
    wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
    document.getElementById("six_"+i).innerHTML=month2+"/"+tempday+" "+wd;
    }
    else{
    wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day6).getDay())
    document.getElementById("six_"+i).innerHTML=month1+"/"+day6+" "+wd;
    }
    if(day+5>n){
    tday=day+5-n
    tempday=tday
    tempday<10?tempday='0'+tempday:tday
    wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
    document.getElementById("five_"+i).innerHTML=month2+"/"+tempday+" "+wd;
    }
    else{
    wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day5).getDay())
    document.getElementById("five_"+i).innerHTML=month1+"/"+day5+" "+wd;
    }
    if(day+4>n){
    tday=day+4-n
    tempday=tday
    tempday<10?tempday='0'+tempday:tday
     wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
    document.getElementById("four_"+i).innerHTML=month2+"/"+tempday+" "+wd;
    }
   else{
    wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day4).getDay())
   document.getElementById("four_"+i).innerHTML=month1+"/"+day4+" "+wd;
   }
   if(day+3>n){
   tday=day+3-n
   tempday=tday
    tempday<10?tempday='0'+tempday:tday
     wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
   document.getElementById("three_"+i).innerHTML=month2+"/"+tempday+" "+wd;
   }
   else{
   wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day3).getDay())
   document.getElementById("three_"+i).innerHTML=month1+"/"+day3+" "+wd;
   }
   if(day+2>n){
   tday=day+2-n
  tempday=tday
    tempday<10?tempday='0'+tempday:tday
    wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
   document.getElementById("two_"+i).innerHTML=month2+"/"+tempday+" "+wd;
   }
   else{
   wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day2).getDay())
   document.getElementById("two_"+i).innerHTML=month1+"/"+day2+" "+wd;
   }
    if(day+1>n){
   tday=day+1-n
   tempday=tday
    tempday<10?tempday='0'+tempday:tday
    wd=getWeekDay(new Date(year+"/"+(month+2)+"/"+tempday).getDay())
   document.getElementById("one_"+i).innerHTML=month2+"/"+tempday+" "+wd;
   }
   else{
    wd=getWeekDay(new Date(year+"/"+(month1)+"/"+day1).getDay())
   document.getElementById("one_"+i).innerHTML=month1+"/"+day1+" "+wd;
   }
   }
   function time(i){
    var now =new Date();
    var month=now.getMonth();
    var day=now.getDate();
    var year=now.getFullYear()
    month=month+1;
    if(month==1||month==3||month==5||month==7||month==8||month==10||month==12){
    hh(31,i);
    }
    else if(month==4||month==6||month==9||month==11){
    hh(30,i);
    }
    else if(month==2&&(year%4 == 0 &&year%100 != 0|| year %400 == 0)){
    	
    hh(29,i);
    }
    else hh(28,i);
   }
   function getWeekDay(d){
   switch(d){
   case 0: s = "周日";break;
   case 1: s = "周一";break;
   case 2: s = "周二";break;
   case 3: s = "周三";break;
   case 4: s = "周四";break;
   case 5: s = "周五";break;
   case 6: s = "周六";break;
   }
    return s;
   }