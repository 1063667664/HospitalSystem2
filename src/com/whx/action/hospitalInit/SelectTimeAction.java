package com.whx.action.hospitalInit;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.whx.service.ScheduleService;

public class SelectTimeAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ScheduleService scheduleService;
	
	public ScheduleService getScheduleService() {
		return scheduleService;
	}
	public void setScheduleService(ScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}
	public String workTime(){
		String doctorName=getDoctorNameValue("doctorName");
		JSONArray array=scheduleService.findPeriods(doctorName);
		System.out.println("array"+array);
		return save(array);	
	}
	private String getDoctorNameValue(String doctorName){
		HttpServletRequest request=ServletActionContext.getRequest();
		String doctorNameValue=request.getParameter(doctorName);
		return doctorNameValue;
		
	}
	/**
	 * 将数据传到前端
	 * 
	 * @param jsonArray
	 * @return
	 */
	private String save(JSONArray jsonArray) {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("UTF-8");
		PrintWriter writer =null;
		try {
			writer = response.getWriter();
			writer.print(jsonArray);
			writer.close();
			return null;
			//// 一定要关闭，否则会抛出异常	
		} catch (IOException e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
