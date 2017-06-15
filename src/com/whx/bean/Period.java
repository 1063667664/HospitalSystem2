package com.whx.bean;
// default package

import java.sql.Time;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Period entity. @author MyEclipse Persistence Tools
 */

public class Period  implements java.io.Serializable {
    // Fields    

     private Integer periodId;
     private Date date;
     private Time beginTime;
     private Time endTime;
     private Set schedules = new HashSet(0);
     private Set workTimes = new HashSet(0);
     private Set registrations = new HashSet(0);


    // Constructors

    /** default constructor */
    public Period() {
    }

	/** minimal constructor */
    public Period(Date date, Time beginTime, Time endTime) {
        this.date = date;
        this.beginTime = beginTime;
        this.endTime = endTime;
    }
    
    /** full constructor */
    public Period(Date date, Time beginTime, Time endTime, Set schedules, Set workTimes, Set registrations) {
        this.date = date;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.schedules = schedules;
        this.workTimes = workTimes;
        this.registrations = registrations;
    }

   
    // Property accessors

    public Integer getPeriodId() {
        return this.periodId;
    }
    
    public void setPeriodId(Integer periodId) {
        this.periodId = periodId;
    }

    public Date getDate() {
        return this.date;
    }
    
    public void setDate(Date date) {
        this.date = date;
    }

    public Time getBeginTime() {
        return this.beginTime;
    }
    
    public void setBeginTime(Time beginTime) {
        this.beginTime = beginTime;
    }

    public Time getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(Time endTime) {
        this.endTime = endTime;
    }

    public Set getSchedules() {
        return this.schedules;
    }
    
    public void setSchedules(Set schedules) {
        this.schedules = schedules;
    }

    public Set getWorkTimes() {
        return this.workTimes;
    }
    
    public void setWorkTimes(Set workTimes) {
        this.workTimes = workTimes;
    }

    public Set getRegistrations() {
        return this.registrations;
    }
    
    public void setRegistrations(Set registrations) {
        this.registrations = registrations;
    }

   








}