package com.whx.bean;
// default package
import java.sql.Timestamp;
/**
 * Registration entity. @author MyEclipse Persistence Tools
 */
public class Registration  implements java.io.Serializable {
    // Fields    
     private Integer registrationId;
     private String userName;
     private String hospitalName;
     private Integer doctorId;
	 private String doctorName;
     private String departmentName;
     private Integer regfee;
     private String  date;
     private String state;
     private String way; 
     
     public Integer getDoctorId() {
 		return doctorId;
 	}
 	public void setDoctorId(Integer doctorId) {
 		this.doctorId = doctorId;
 	}

    // Constructors
    /** default constructor */
    public Registration() {
    } 
    public Integer getRegistrationId() {
        return this.registrationId;
    }  
    public void setRegistrationId(Integer registrationId) {
        this.registrationId = registrationId;
    }

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getHospitalName() {
		return hospitalName;
	}

	public void setHospitalName(String hospitalName) {
		this.hospitalName = hospitalName;
	}

	public String getDoctorName() {
		return doctorName;
	}

	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}

	public String getDepartmentName() {
		return departmentName;
	}

	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}

	public Integer getRegfee() {
		return regfee;
	}
	public void setRegfee(Integer regfee) {
		this.regfee = regfee;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWay() {
		return way;
	}

	public void setWay(String way) {
		this.way = way;
	}

}