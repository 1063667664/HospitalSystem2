package com.whx.action.hospitalInit;

import java.io.IOException;
import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Doctor;
import com.whx.dao.RegisterOrderDao;
import com.whx.service.DoctorService;

public class DoctorAction implements Action, Serializable {

	private DoctorService doctorService;
	private String departmentName;
	private RegisterOrderDao registerOrderDao;
	private String result;

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public RegisterOrderDao getRegisterOrderDao() {
		return registerOrderDao;
	}

	public void setRegisterOrderDao(RegisterOrderDao registerOrderDao) {
		this.registerOrderDao = registerOrderDao;
	}

	private Integer hospitalId;
	private Integer firstResult;
	private JSONArray doctorList;
	private String doctorName;

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	private Doctor doctor;
	// 提示是否已提交某时间段的挂号单；
	private String tip3;

	public String getTip3() {
		return tip3;
	}

	public void setTip3(String tip3) {
		this.tip3 = tip3;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	private String time1;
	// 医生名字
	private String doctorId;
	private String date;

	public void setDoctorList(JSONArray doctorList) {
		this.doctorList = doctorList;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(String doctorId) {
		this.doctorId = doctorId;
	}

	public JSONArray getDoctorList() {
		return doctorList;
	}

	public Integer getFirstResult() {
		return firstResult;
	}

	public void setFirstResult(Integer firstResult) {
		this.firstResult = firstResult;
	}

	private List<Doctor> listDoctors;

	public List<Doctor> getListDoctors() {
		return listDoctors;
	}

	public void setListDoctors(List<Doctor> listDoctors) {
		this.listDoctors = listDoctors;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Integer getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}

	public DoctorService getDoctorService() {
		return doctorService;
	}

	public void setDoctorService(DoctorService doctorService) {
		this.doctorService = doctorService;
	}

	@Override
	public String execute() throws Exception {
		if (firstResult > 0) {
			firstResult = (firstResult - 1) * 4;
		}
		listDoctors = doctorService.queryDoctorByHospitalIdAndDepartName(
				hospitalId, departmentName, firstResult, 4);
		System.out.println("firstResult=" + firstResult);
		if (firstResult > 0) {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			String list = JSONArray.fromObject(listDoctors).toString();
			System.out.println("listDoctors=" + listDoctors);
			ServletActionContext.getResponse().getWriter().print(list);
			return null;
		} else {
			return SUCCESS;
		}
	}

	// 跳转到挂号单确认信息页面
	public String registerInfo() throws IOException {
		getRegisterRequestParam();
		this.doctor = doctorService.findDoctorById(Integer.parseInt(doctorId));
		return SUCCESS;
	}

	public String registerInfoSec() throws Exception {
		doctor = new Doctor();
		getRegisterRequestParam();
		HttpServletRequest request = ServletActionContext.getRequest();
		tip3 = request.getParameter("tip3");
		if (doctorId != null) {
			this.doctor = doctorService.findDoctorById(Integer
					.parseInt(doctorId));
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		String userName = (String) session.getAttribute("userName");
		return SUCCESS;
	}

	public void getRegisterRequestParam() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		time1 = request.getParameter("time");
		date = request.getParameter("date");
		HttpSession session = ServletActionContext.getRequest().getSession();
		String userName = (String) session.getAttribute("userName");
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String searchDoctorByIllness() throws IOException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String illNess = request.getParameter("illness");
		//illNess = new String(illNess.getBytes("iso-8859-1"), "utf-8");
		listDoctors = doctorService.queryDoctorByIllness(illNess);
		return SUCCESS;

	}

	public String searchDoctorByDoctorName() {
		List<Doctor> list = doctorService.queryDoctorByDoctorName(doctorName);
		listDoctors = new ArrayList<Doctor>();
		if (list != null && list.size() > 7) {
			for (int i = 0; i < 7; i++) {
				listDoctors.add(list.get(i));
			}
		} else {
			for (Doctor d : list) {
				listDoctors.add(d);
			}
		}
		return SUCCESS;
	}

	public String selectDoctorTimeByDoctorId() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String date = request.getParameter("date");
		String doctorId = request.getParameter("doctorId");
		int y1 = 0, y2 = 0, y3 = 0, y4 = 0, y5 = 0, y6 = 0;
		if (date!=null && date.contains("上午")) {
			y1 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "09:00-10:00");
			y2 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "10:00-11:00");
			y3 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "11:00-12:00");
		} else if (date!=null && date.contains("下午")) {
			y4 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "14:00-15:00");
			y5 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "15:00-16:00");
			y6 = registerOrderDao.selectDoctorTimeByDoctorId(
					Integer.valueOf(doctorId), date + "16:00-17:00");
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("y1", 3 - y1 > 0 ? 3 - y1 : 0);
		map.put("y2", 3 - y2 > 0 ? 3 - y2 : 0);
		map.put("y3", 3 - y3 > 0 ? 3 - y3 : 0);
		map.put("y4", 3 - y4 > 0 ? 3 - y4 : 0);
		map.put("y5", 3 - y5 > 0 ? 3 - y5 : 0);
		map.put("y6", 3 - y6 > 0 ? 3 - y6 : 0);
		JSONObject json = JSONObject.fromObject(map);
		result = json.toString();
		// registerOrderDao.selectDoctorTimeByDoctorId(doctorId, dateTime)
		return SUCCESS;
	}

}
