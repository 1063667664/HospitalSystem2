package com.whx.bean;

import java.util.HashSet;
import java.util.Set;

/**
 * Hospital entity. @author MyEclipse Persistence Tools
 */
public class Hospital implements java.io.Serializable {
	// Fields
	private Integer hospitalId;
	private String name;
	private String rank;
	private String address;
	private String telephone;

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public void setTelphone(String telephone) {
		this.telephone = telephone;
	}

	private String path;
	private String brief;
	private String property;
	private Set departments = new HashSet(0);
	private Set doctors = new HashSet(0);
	private Set registrations = new HashSet(0);

	// Constructors

	/** default constructor */
	public Hospital() {
	}

	/** minimal constructor */
	public Hospital(String name, String rank, String address, String telephone,
			String path, String brief, String property) {
		this.name = name;
		this.rank = rank;
		this.address = address;
		this.telephone = telephone;
		this.path = path;
		this.brief = brief;
		this.property = property;
	}

	/** full constructor */
	public Hospital(String name, String rank, String address, String telephone,
			String path, String brief, String property, Set departments,
			Set doctors, Set registrations) {
		this.name = name;
		this.rank = rank;
		this.address = address;
		this.telephone = telephone;
		this.path = path;
		this.brief = brief;
		this.property = property;
		this.departments = departments;
		this.doctors = doctors;
		this.registrations = registrations;
	}

	// Property accessors

	public Integer getHospitalId() {
		return this.hospitalId;
	}

	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return this.rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getProperty() {
		return this.property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public Set getDepartments() {
		return this.departments;
	}

	public void setDepartments(Set departments) {
		this.departments = departments;
	}

	public Set getDoctors() {
		return this.doctors;
	}

	public void setDoctors(Set doctors) {
		this.doctors = doctors;
	}

	public Set getRegistrations() {
		return this.registrations;
	}

	public void setRegistrations(Set registrations) {
		this.registrations = registrations;
	}

}