$(document)
		.ready(
				function() {
					var arrayLen = document.getElementById("listSize").value;
					var len = parseInt(arrayLen)
					var b = new Array(len);
					for (var i = 0; i < len; i++) {
						b[i] = false;
					}
					$(".checkTable").click(
						function() {
								var id = $(this).attr("id");
								doctorId = id.substring(2)
								var doctorIdParam = $("#" + doctorId).val();
								index = parseInt(doctorId);
								time(index);
								if (b[index - 1] == false) {
								$("#" + id).html("<font size=2 color=#66667A><b>收起</b></font>");
								b[index - 1] = true;
								$("#n_" + doctorId + "_t").toggle();
								var doctorName = document.getElementById("num_"+ doctorId).value;
								$.ajax({
								type : "post",
								url : "worktime.action",
								data : {doctorName : doctorName
								},
								dataType : "json",// 设置需要返回的数据类型
								success : function(data) {
								var currentDate = new Date();
								var week = new Array("one_"+ doctorId,
								"two_"+ doctorId,"three_"+ doctorId,"four_"+ doctorId,
								"five_"+ doctorId,"six_"+ doctorId,"seven_"+ doctorId);
								$(data).each(
								function(i) {
								var period = data[i];
								var period1 = period.substring(0,13);
								document.getElementById("date").innerHTML = period1;
								var dateArray = period.substring(0,10).split("-");
								var mornOrAfter = period.substring(11,13);
								var isFilled = period.substring(14);
								document.getElementById("doctorN").innerHTML = doctorName;
								var date = new Date(dateArray[0],dateArray[1] - 1,dateArray[2]);
								var dayNum = daysBetween(currentDate,date);
								if (dayNum >= 0) {
								var mornOrAfterStr = mornOrAfter == "上午" ? "Morn": "After";
								var id = week[dayNum - 1]+ mornOrAfterStr;
								var tem = $("#"+ id).text();
								if (isFilled == "unfilled") {
								if (tem != '预约') {
								$("#"+ id).append("<button  value=\""+ id+ "\" class=\"blue\" onclick='test(\""+ period1+ "\","
								+ doctorIdParam+ ");'>预约</button>");}
								} else if (tem != '已满') {
								$("#"+ id).append("<button  disabled=\"disabled\" class=\"brone\"  value=\""+ id+ "\">已满</button>");
														}	}
									});
														},
							error : function(xhr) {
								alert("1111");		}
													});

						} else {
						$("#" + id).html(	"<font size=2 color=#996634><b>查看排班表<b></font>");
											b[index - 1] = false
											$("#n_" + doctorId + "_t").toggle();
										}
									});
				});
function daysBetween(date1, date2) {
	var ONE_DAY = 1000 * 60 * 60 * 24
	// Convert both dates to milliseconds
	var date1_ms = date1.getTime()
	var date2_ms = date2.getTime()
	// Calculate the difference in milliseconds
	var difference_ms = date2_ms - date1_ms;
	// Convert back to days and return
	return Math.ceil(difference_ms / ONE_DAY)
}
function test(i, doctorId) {
	var userName = document.getElementById("userName").value;
	if (userName != "null") {
		document.getElementById("date").innerHTML = i;
		document.getElementById("doctorId").innerHTML = doctorId;
		morningTimePeriod(i, doctorId)
		var hideobj = document.getElementById("hidebg");
		hideobj.style.display = "block"; // 显示隐藏层
		hideobj.style.height = "2000px"; // 设置隐藏层的高度为当前页面高度
		if (i.indexOf("上午") != -1) {
			document.getElementById("timeT").style.display = "block";
		} else if (i.indexOf("下午") != -1) {
			document.getElementById("timeT1").style.display = "block";
		}
	} else {
		var hideobj = document.getElementById("hidebg");
		hideobj.style.display = "block"; // 显示隐藏层
		hideobj.style.height = "2000px"; // 设置隐藏层的
		// alert(document.getElementById("loginForm").style.display)
		document.getElementById("loginForm").style.display = "block";
	}

}
function morningTimePeriod(date, doctorId) {
	$.ajax({
		type : "post",
		url : "selectDoctorTimeByDoctorId.action",
		data : {
			date : date,
			doctorId : doctorId
		},
		dataType : "json",
		success : function(data) {
			var d = eval("(" + data + ")");
			$("#y1").text(d.y1);
			$("#y2").text(d.y2);
			$("#y3").text(d.y3);
			$("#y4").text(d.y4);
			$("#y5").text(d.y5);
			$("#y6").text(d.y6);
		},
		error : function() {
			alert("系统异常，请稍候重试");
		}
	});

}
function hidebg() // 去除隐藏层和弹出层
{
	document.getElementById("hidebg").style.display = "none";
	document.getElementById("timeT").style.display = "none";
	document.getElementById("timeT1").style.display = "none";
	document.getElementById("loginForm").style.display = "none";
}
