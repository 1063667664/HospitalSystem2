package com.whx.dao.Impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.whx.bean.Registration;
import com.whx.bean.User;
import com.whx.dao.BookingDao;

public class BookingDaoImpl extends HibernateDaoSupport implements BookingDao {

	@Override
	public User findByName(String userName) {
		List<User> list=getHibernateTemplate().find("from User u where u.userName=?",userName);
		if(list!=null){
			return list.get(0);
		}
		else{
			return null;
		}
	}

	@Override
	public void UpdateUserBalance(User u) {
		getHibernateTemplate().update(u);
		
	}

	@Override
	public void UpdateRegistrationSate(Registration reg) {
		getHibernateTemplate().update(reg);	
		
	}

	@Override
	public Registration findByUserName(String userName, String date) {
		List<Registration> list=getHibernateTemplate().find("from Registration re where re.userName=? and re.date=?",new String[]{userName,date});
		if(list!=null){
			return list.get(0);
		}
		else{
		return null;
		}
	}

	@Override
	public List<Registration> findRegistrationByUserName(String userName) {
		return getHibernateTemplate().find("from Registration re where re.userName=?",userName);
	}

}
