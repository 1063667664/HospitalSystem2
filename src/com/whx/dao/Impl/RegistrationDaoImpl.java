package com.whx.dao.Impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Registration;
import com.whx.dao.RegistrationDao;

public class RegistrationDaoImpl extends HibernateDaoSupport implements RegistrationDao{
	private static final String HANDLED = "已就诊";
	
	@Override
	public List<Map<String, String>> findRegistrations(String doctorName,
			String date, String firstPeriodBegin, String lastPeriodBegin) {
		String sql=null;
		sql = " select r.registration_id id,u.user_name userName ,p.begin_time beginTime"
				+ " from registration r join doctor do join department de join user u join period p "
				+ " where "
				+ "r.doctor_id=do.doctor_id and r.department_id = de.department_id and "
				+ " r.user_id=u.user_id and r.period_id=p.period_id  and "
				+ " do.name=:doctorName and p.date=:date and "
				+ " p.begin_time>=:firstPeriodBegin and p.begin_time<=:lastPeriodBegin";
		@SuppressWarnings("unchecked")
		Query query = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addScalar("id", Hibernate.STRING)
				.addScalar("userName", Hibernate.STRING)
				.addScalar("beginTime", Hibernate.STRING)
				.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP)
				.setString("doctorName", "爽哥").setString("date", date)
				.setString("firstPeriodBegin", firstPeriodBegin)
				.setString("lastPeriodBegin", lastPeriodBegin);
		return query.list();
	}
	/**
	 * 更改用户的就诊状态 e.g. 已就诊
	 * 
	 * @param userId
	 * @return
	 */
	@Override
	public int mark(String userId) {
		String sql = "update registration set state=:handled where user_id=:userId ";
		int result = getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).setString("handled", HANDLED)
				.setString("userId", userId).executeUpdate();
		return result;
	}

	@Override
	public List<Registration> find(String doctorName, String date,
			String beginTime) {
		return (List<Registration>) getHibernateTemplate().find("from Registration re where re.doctorName=? and re.date=?",new String[]{doctorName,date});
	}

}
