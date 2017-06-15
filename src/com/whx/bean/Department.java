package com.whx.bean;
// default package
import java.util.HashSet;
import java.util.Set;
/**
 * Department entity. @author MyEclipse Persistence Tools
 */

public class Department  implements java.io.Serializable {

    // Fields    

     private Integer departmentId;

	private Hospital hospital;
     private String name;
     private Set registrations = new HashSet(0);
//     private Set registrations_1 = new HashSet(0);
     private Set doctors = new HashSet(0);
     private Set doctors_1 = new HashSet(0);
    // Constructors

    /** default constructor */
    public Department() {
    }

	/** minimal constructor */
    public Department(Hospital hospital, String name) {
        this.hospital = hospital;
        this.name = name;
    }
    
    /** full constructor */
    public Department(Hospital hospital, String name, Set registrations,Set doctors ) {
        this.hospital = hospital;
        this.name = name;
        this.registrations = registrations;
        this.doctors = doctors;
    }

   
    // Property accessors

    public Integer getDepartmentId() {
        return this.departmentId;
    }
    
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public Hospital getHospital() {
        return this.hospital;
    }
    
    public void setHospital(Hospital hospital) {
        this.hospital = hospital;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public Set getRegistrations() {
        return this.registrations;
    }
    
    public void setRegistrations(Set registrations) {
        this.registrations = registrations;
    }

   

    public Set getDoctors() {
        return this.doctors;
    }
    
    public void setDoctors(Set doctors) {
        this.doctors = doctors;
    }

    public Set getDoctors_1() {
        return this.doctors_1;
    }
    
    public void setDoctors_1(Set doctors_1) {
        this.doctors_1 = doctors_1;
    }
   








}