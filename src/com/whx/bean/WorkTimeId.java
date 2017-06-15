package com.whx.bean;
// default package



/**
 * WorkTimeId entity. @author MyEclipse Persistence Tools
 */

public class WorkTimeId  implements java.io.Serializable {


    // Fields    

     private Integer doctorId;
     private Integer periodId;


    // Constructors

    /** default constructor */
    public WorkTimeId() {
    }

    
    /** full constructor */
    public WorkTimeId(Integer doctorId, Integer periodId) {
        this.doctorId = doctorId;
        this.periodId = periodId;
    }

   
    // Property accessors

    public Integer getDoctorId() {
        return this.doctorId;
    }
    
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    public Integer getPeriodId() {
        return this.periodId;
    }
    
    public void setPeriodId(Integer periodId) {
        this.periodId = periodId;
    }
   



   public boolean equals(Object other) {
         if ( (this == other ) ) return true;
		 if ( (other == null ) ) return false;
		 if ( !(other instanceof WorkTimeId) ) return false;
		 WorkTimeId castOther = ( WorkTimeId ) other; 
         
		 return ( (this.getDoctorId()==castOther.getDoctorId()) || ( this.getDoctorId()!=null && castOther.getDoctorId()!=null && this.getDoctorId().equals(castOther.getDoctorId()) ) )
 && ( (this.getPeriodId()==castOther.getPeriodId()) || ( this.getPeriodId()!=null && castOther.getPeriodId()!=null && this.getPeriodId().equals(castOther.getPeriodId()) ) );
   }
   
   public int hashCode() {
         int result = 17;
         
         result = 37 * result + ( getDoctorId() == null ? 0 : this.getDoctorId().hashCode() );
         result = 37 * result + ( getPeriodId() == null ? 0 : this.getPeriodId().hashCode() );
         return result;
   }   





}