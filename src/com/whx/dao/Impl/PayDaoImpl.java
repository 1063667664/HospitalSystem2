package com.whx.dao.Impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Registration;
import com.whx.dao.PayDao;
public class PayDaoImpl extends HibernateDaoSupport implements PayDao {

	public Registration queryById(Integer registrationId) {
		List<Registration> list=getHibernateTemplate().find("from Registration re where re.registrationId=?",registrationId);
		if(list!=null){
			return list.get(0);
		}
		return null;
	}


}
