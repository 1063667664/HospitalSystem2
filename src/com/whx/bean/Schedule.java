package com.whx.bean;
// default package
/**
 * Schedule entity. @author MyEclipse Persistence Tools
 */

public class Schedule  implements java.io.Serializable {
    // Fields    

     private ScheduleId id;
     private Period period;
     private Doctor doctor;

    // Constructors


	/** default constructor */
    public Schedule() {
    }

    
    /** full constructor */
    public Schedule(ScheduleId id, Period period, Doctor doctor) {
        this.id = id;
        this.period = period;
        this.doctor = doctor;
    }

   
    // Property accessors

    public ScheduleId getId() {
        return this.id;
    }
    
    public void setId(ScheduleId id) {
        this.id = id;
    }

    public Period getPeriod() {
        return this.period;
    }
    
    public void setPeriod(Period period) {
        this.period = period;
    }

    public Doctor getDoctor() {
        return this.doctor;
    }
    
    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }
   








}