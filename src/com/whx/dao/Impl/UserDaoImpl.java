package com.whx.dao.Impl;
import java.util.List;

import javax.persistence.criteria.From;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Doctor;
import com.whx.bean.Registration;
import com.whx.bean.User;
import com.whx.dao.UserDao;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {
	@Override
	public User findUser(String name, String password) {
		//用户名，密码做参数
		String []param=new String[]{name,password};
		String sql="from User as u where u.userName=? and u.userPwd=?";
		List<User>list=getHibernateTemplate().find(sql, param);
		if(list!=null&&list.size()>0){
			return list.get(0);
		}
		else return null;
	}

	@Override
	public User findUserByName(String userName) {
		String sql="from User as u where u.userName=?";
		List<User> list = getHibernateTemplate().find(sql, userName);
		if (list != null && list.size() > 0)
			return list.get(0);
		else
			return null;
	}

	@Override
	public boolean isUserNameExit(String userName) {
		String sql="from User as u where u.userName=?";
		List<User> list = getHibernateTemplate().find(sql, userName);
		if(list.size()>0){
			return true;
		}
		else return false;
	}

	@Override
	public void addRegisterUser(User user) {
		getHibernateTemplate().save(user);	
	}

	@Override
	public User findUserById(Integer userId) {
		// TODO Auto-generated method stub
		String sql="from User as u where u.userId=?";
		List<User>list=getHibernateTemplate().find(sql,userId);
		if(list.size()>0){
			return list.get(0);
		}else{
		  return null;
		}
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(user);
	}

	@Override
	public List<User> findAllUser(int pageSize, int pageIndex) {
		// TODO Auto-generated method stub
		String sql="select * from user u";
		Query query =
		this.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity("u", User.class).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize);
		List<User> list =query.list();
		return list;
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		String sql ="select count(*) from User";
		Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql);
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}

	@Override
	public void deleteUserByUserId(Integer userId) {
		// TODO Auto-generated method stub
		User user =(User) getHibernateTemplate().find("from User user where user.userId=?",userId).get(0);
		getHibernateTemplate().delete(user);
	}

}
