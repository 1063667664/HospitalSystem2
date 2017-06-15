package com.whx.dao.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.hql.classic.WhereParser;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Doctor;
import com.whx.bean.Registration;
import com.whx.dao.RegisterOrderDao;

public class RegisterOrderDaoImpl extends HibernateDaoSupport implements
		RegisterOrderDao {
    public static final String HANDLED = "“—æÕ’Ô";
	@Override
	public void saveRegisterInDb(Registration reg) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(reg);
	}

	@Override
	public boolean selectFromRegister(String userName, String date) {
		List<Registration> list=new ArrayList<Registration>();
		list= getHibernateTemplate().find("from Registration re where re.userName=? and re.date=?",new String[]{userName,date});
		return list.size()>0?true:false;
	}

	@Override
	public void deleteRegisterById(Integer RId) {
		Registration re=(Registration) getHibernateTemplate().find("from Registration re where re.registrationId=?",RId).get(0);
		getHibernateTemplate().delete(re);	
	}

	@Override
	public List<Registration> selectRegistrationOrderByParam(
			String userName,String hospitalName, String date, String state) {
		String sql=null;
		sql="select reg.* from registration reg where reg.username=? and reg.hospital_Name like ? and reg.date like ?  and reg.state=?;"; 
		@SuppressWarnings("unchecked")
		List<Registration> list = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("reg", Registration.class).setString(0,userName).
			   setString(1,'%'+hospitalName+'%').setString(2, '%'+date+'%').setString(3, state).list();
		return list;
	}

	@Override
	public List<Registration> selectRegistrationOrder(String userName,
			String state) {
		String sql=null;
		sql="select reg.* from registration reg where reg.username=? and reg.state=?;";
		@SuppressWarnings("unchecked")
		List<Registration> list = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("reg", Registration.class).setString(0,userName).
			   setString(1,state).list();
		return list;
	}

	@Override
	public int selectDoctorTimeByDoctorId(Integer doctorId, String dateTime) {
		// TODO Auto-generated method stub
		String sql= null;
		sql="select reg.* from registration reg where reg.doctor_id =? and reg.date like ?; ";
		@SuppressWarnings("unchecked")
		List<Registration> registrationCount =this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("reg",Registration.class).setLong(0, doctorId)
				.setString(1, '%'+dateTime+'%').list();
		if(registrationCount!=null){
			return registrationCount.size();
		}
		else{
		return 0;
		}
	}

	@Override
	public List<Registration> checkRegistrationByDoctorIdAndDateTime(Integer doctorId, String dateTime, int pageSize,
			int pageIndex) {
		String sql= null;
		sql="select reg.* from registration reg where reg.doctor_id =? and reg.date like ? ";
		@SuppressWarnings("unchecked")
		List<Registration> registrationList =this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("reg",Registration.class).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).setLong(0, doctorId)
				.setString(1, "%"+dateTime+"%").list();
		return registrationList;
	}

	@Override
	public List<Registration> checkAllRegistrationByDoctorId(Integer doctorId, int pageSize, int pageIndex) {
		String sql = null;
		sql="select reg.* from registration reg where reg.doctor_id=?";
		@SuppressWarnings("unchecked")
		List<Registration> registrationList = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
				.addEntity("reg", Registration.class).setLong(0, doctorId).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		return registrationList;
	}
	@Override
	public int getTotalCount(Integer doctorId) {
		String sql ="select count(*) from registration  where doctor_id =? ";
		Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql).setLong(0,doctorId);
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}
	@Override
	public int getTotalCountByDateTime(Integer doctorId,String dateTime) {
		String sql ="select count(*) from registration  where doctor_id =? and date like ? ";
		Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql).setLong(0,doctorId).setString(1, '%'+dateTime+'%');
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}

	@Override
	public int updateRegistrationState(Integer registrationId) {
		// TODO Auto-generated method stub
		String sql = "update registration set state=:reg_state where registration_id=:registration_id";
		int result = getSessionFactory().getCurrentSession().createSQLQuery(sql).setString("reg_state", HANDLED)
				.setLong("registration_id", registrationId)
				.executeUpdate();
		return result;
	}


}
