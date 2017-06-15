package com.whx.bean;
// default package



/**
 * WorkTime entity. @author MyEclipse Persistence Tools
 */

public class WorkTime  implements java.io.Serializable {


    // Fields    

     private WorkTimeId id;
     private Period period;
     private Doctor doctor;


    // Constructors

    /** default constructor */
    public WorkTime() {
    }

    
    /** full constructor */
    public WorkTime(WorkTimeId id, Period period, Doctor doctor) {
        this.id = id;
        this.period = period;
        this.doctor = doctor;
    }

   
    // Property accessors

    public WorkTimeId getId() {
        return this.id;
    }
    
    public void setId(WorkTimeId id) {
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