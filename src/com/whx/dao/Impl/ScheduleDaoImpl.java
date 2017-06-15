package com.whx.dao.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.loader.custom.EntityFetchReturn;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Doctor;
import com.whx.bean.Period;
import com.whx.bean.Schedule;
import com.whx.bean.ScheduleId;
import com.whx.bean.WorkTime;
import com.whx.dao.ScheduleDao;

public class ScheduleDaoImpl extends HibernateDaoSupport implements ScheduleDao {

	@Override
	public List<Period> findPeriods(String doctorName) {
		String sql = null;
		sql = "select p.* from doctor d join schedule s join period p "
				+ "where  s.doctor_id=d.doctor_id and s.period_id=p.period_id and d.name= :doctorName";
		@SuppressWarnings("unchecked")
		List<Period> list = getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("p", Period.class)
				.setString("doctorName", doctorName).list();
		System.out.println("list size: " + list.size());
		return list;
	}

	@Override
	public Schedule find(String doctorId, String date, String firstPeriodBegin,
			String lastPeriodBegin) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean save(Doctor doctor, Period period) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String doctorId, String date, String beginTime,
			String endTime) {
		// TODO Auto-generated method stub
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Period> findPeriodsByDoctorId(Integer doctorId, int pageSize, int pageIndex, Date beginDateTime,
			Date endDateTime) {
		String sql = null;
		List<Period> list =new ArrayList<Period>();
		if(beginDateTime!=null && endDateTime!=null){
		sql = "select per.* from doctor doct join schedule sch join period per "+
		       "where sch.doctor_id = doct.doctor_id and sch.period_id = per.period_id "+
				" and doct.doctor_id=:doctorId and per.date>=:beginDateTime and per.date<=:endDateTime";
		list = getSessionFactory().getCurrentSession().createSQLQuery(sql)
				.addEntity("per", Period.class).setLong("doctorId", doctorId)
				.setDate("beginDateTime", beginDateTime).setDate("endDateTime", endDateTime)
				.setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		}else if(beginDateTime!=null){
			sql = "select per.* from doctor doct join schedule sch join period per "+
				       "where sch.doctor_id = doct.doctor_id and sch.period_id = per.period_id "+
						" and doct.doctor_id=:doctorId and per.date>=:beginDateTime ";
			list = getSessionFactory().getCurrentSession().createSQLQuery(sql)
						.addEntity("per", Period.class).setLong("doctorId", doctorId)
						.setDate("beginDateTime", beginDateTime)
						.setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		}
		else if(endDateTime!=null){
			sql = "select per.* from doctor doct join schedule sch join period per "+
				       "where sch.doctor_id = doct.doctor_id and sch.period_id = per.period_id "+
						" and doct.doctor_id=:doctorId and  per.date<=:endDateTime";
			list = getSessionFactory().getCurrentSession().createSQLQuery(sql)
						.addEntity("per", Period.class).setLong("doctorId", doctorId)
						.setDate("endDateTime", endDateTime)
						.setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		}else{
				sql = "select per.* from doctor doct join schedule sch join period per "+
					       "where sch.doctor_id = doct.doctor_id and sch.period_id = per.period_id "+
							" and doct.doctor_id=:doctorId ";
				list = getSessionFactory().getCurrentSession().createSQLQuery(sql)
							.addEntity("per", Period.class).setLong("doctorId", doctorId)
							.setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
			}
		
		return list;
	}

	@Override
	public int getTotalCount(Integer doctorId, Date beginDateTime, Date endDateTime) {
		String sql = null;
		Query query;
		if(beginDateTime!=null && endDateTime!=null){
			sql ="select count(per.period_id) from doctor doct join schedule sch join period per "+
		       "where sch.doctor_id =doct.doctor_id and sch.period_id = per.period_id "+
		        " and doct.doctor_id=:doctorId and per.date>=:beginDateTime and per.date<=:endDateTime";
			query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
					.setLong("doctorId", doctorId)
					.setDate("beginDateTime", beginDateTime).setDate("endDateTime", endDateTime);
		}
		else if(beginDateTime!=null){
			sql ="select count(per.period_id) from doctor doct join schedule sch join period per "+
				       "where sch.doctor_id =doct.doctor_id and sch.period_id = per.period_id "+
				       " and doct.doctor_id=:doctorId and per.date>=:beginDateTime ";
			query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
					.setLong("doctorId", doctorId)
					.setDate("beginDateTime", beginDateTime);
		}
		else if(endDateTime!=null){
			sql ="select count(per.period_id) from doctor doct join schedule sch join period per "+
				       "where sch.doctor_id =doct.doctor_id and sch.period_id = per.period_id "+
				       " and doct.doctor_id=:doctorId and  per.date<=:endDateTime";
			query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
					.setLong("doctorId", doctorId)
					.setDate("endDateTime", endDateTime);
		}
		else {
			sql ="select count(per.period_id) from doctor doct join schedule sch join period per "+
				       "where sch.doctor_id =doct.doctor_id and sch.period_id = per.period_id "+
				       " and doct.doctor_id=:doctorId ";
			query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
					.setLong("doctorId", doctorId);
		}
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}

	@Override
	public void saveDoctorSchedule(Doctor doctor, Period period) {
		ScheduleId scheduleId = new ScheduleId();
		scheduleId.setDoctorId(doctor.getDoctorId());
		scheduleId.setPeriodId(period.getPeriodId());
		Schedule schedule = new Schedule();
		schedule.setId(scheduleId);
		schedule.setDoctor(doctor);
		schedule.setPeriod(period);
		this.getSessionFactory().getCurrentSession().save(schedule);
	}

	@Override
	public void savePeriod(Period period) {
		this.getSessionFactory().getCurrentSession().save(period);
	}

	@Override
	public boolean deleteScheduleSperiod(Integer doctorId, Integer periodId) {
		String sql =null;
		sql = "delete from schedule where doctor_id=:doctorId and period_id=:periodId ";
		this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
		.setLong("doctorId", doctorId)
		.setLong("periodId",periodId).executeUpdate();
		/*String sql1=null;
		sql1= "delete from period  where period_id=:periodId ";
		this.getSessionFactory().getCurrentSession().createSQLQuery(sql1)
		.setLong("periodId",periodId).executeUpdate();*/
	     return true;
	}
	
	

}
