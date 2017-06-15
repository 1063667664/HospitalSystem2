package com.whx.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.w3c.dom.css.ElementCSSInlineStyle;

import com.whx.bean.Department;
import com.whx.bean.Hospital;
import com.whx.bean.User;
import com.whx.dao.DepartmentDao;

public class DepartmentDaoImpl extends HibernateDaoSupport implements DepartmentDao {

	@Override
	public List<Department> queryDepartmentByHospitalId(Integer hospitalId) {
		String sql=null;
		sql="select dep.* from department dep where dep.hospital_id=?";
		@SuppressWarnings("unchecked")
		List<Department> departmentList=this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("dep", Department.class)
				.setInteger(0, hospitalId).list();
		return departmentList;
	}

	@Override
	public List<Department> findAllDepartments(int pageSize, int pageIndex) {
		// TODO Auto-generated method stub
		String sql="select * from department dep";
		Query query =
			 this.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity("dep", Department.class).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize);
		List<Department> list = query.list();
		return  list;
	}

	@Override
	public int getTotalCount(Integer hospitalId) {
		String sql ="select count(*) from department  where hospital_id =? ";
		Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql).setLong(0,hospitalId);
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}

	@Override
	public List<Department> queryDeptAndPage(int pageSize, int pageIndex, Integer hospitalId) {
		String sql="select * from department dep where dep.hospital_id =?";
		Query query =
			 this.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity("dep", Department.class).setLong(0,hospitalId).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize);
		List<Department> list = query.list();
		return  list;
	}

	@Override
	public boolean verifyDeptNameIsExist(Integer hospitalId, String name) {
		// TODO Auto-generated method stub
		String sql="select * from department dep where dep.hospital_id =? and dep.name=?";
		Query query =
				 this.getSessionFactory().getCurrentSession().createSQLQuery(sql).addEntity("dep", Department.class).setLong(0,hospitalId).setString(1, name);
		@SuppressWarnings("unchecked")
		List<Department> list = query.list();
		System.out.println("list="+list.size());
		if(list.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public void addDepartment(Department department) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(department);
	}

	@Override
	public void delDepartmentByDepartmentId(Integer departmentId) {
		// TODO Auto-generated method stub
		List<Department> list = getHibernateTemplate().find("from Department dept where dept.departmentId =?",departmentId);
		if(list.size()>0){
			getHibernateTemplate().delete(list.get(0));
		}
	}

	@Override
	public Department queryDeptByDeptId(Integer departmentId) {
		String sql=null;
		sql="select dep.* from department dep where dep.department_id=?";
		@SuppressWarnings("unchecked")
		List<Department> departmentList=this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("dep", Department.class)
				.setInteger(0,departmentId).list();
		if (departmentList.size() > 0) {
			return departmentList.get(0);
		} else
			return null;
	}

}
