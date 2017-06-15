package com.whx.bean;
// default package
import java.util.HashSet;
import java.util.Set;
/**
 * Doctor entity. @author MyEclipse Persistence Tools
 */
public class Doctor  implements java.io.Serializable {
    // Fields    
     private Integer doctorId;
     private Hospital hospital;
     private Department department;
     private String name;
     private String password;
     private String sex;
     private String academicTitle;
     private Integer regfee;
     
     public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRegfee() {
		return regfee;
	}

	public void setRegfee(Integer regfee) {
		this.regfee = regfee;
	}

	private String speciality;
     private Set workTimes = new HashSet(0);
     private Set schedules = new HashSet(0);
     private Set registrations = new HashSet(0);
    // Constructors
    /** default constructor */
    public Doctor() {
    }

	/** minimal constructor */
    public Doctor(Hospital hospital, Department department, String name, String sex) {
        this.hospital = hospital;
        this.department = department;
        this.name = name;
        this.sex = sex;
    }
    /** full constructor */
    public Doctor(Hospital hospital, Department department, String name, String sex, String academicTitle, String speciality, Set workTimes, Set schedules, Set registrations) {
        this.hospital = hospital;
        this.department = department;
        this.name = name;
        this.sex = sex;
        this.academicTitle = academicTitle;
        this.speciality = speciality;
        this.workTimes = workTimes;
        this.schedules = schedules;
        this.registrations = registrations;

    }
    // Property accessors

    public Integer getDoctorId() {
        return this.doctorId;
    }
    
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Hospital getHospital() {
        return this.hospital;
    }
    
    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    public Department getDepartment() {
        return this.department;
    }
    
    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return this.sex;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getAcademicTitle() {
        return this.academicTitle;
    }
    
    public void setAcademicTitle(String academicTitle) {
        this.academicTitle = academicTitle;
    }

    public String getSpeciality() {
        return this.speciality;
    }
    
    public void setSpeciality(String speciality) {
        this.speciality = speciality;
    }

    public Set getWorkTimes() {
        return this.workTimes;
    }
    
    public void setWorkTimes(Set workTimes) {
        this.workTimes = workTimes;
    }

    public Set getSchedules() {
        return this.schedules;
    }
    
    public void setSchedules(Set schedules) {
        this.schedules = schedules;
    }


    public Set getRegistrations() {
        return this.registrations;
    }
    
    public void setRegistrations(Set registrations) {
        this.registrations = registrations;
    }

   








}