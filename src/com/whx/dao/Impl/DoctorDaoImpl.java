package com.whx.dao.Impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.whx.bean.Doctor;
import com.whx.bean.Registration;
import com.whx.bean.User;
import com.whx.dao.DoctorDao;

public class DoctorDaoImpl extends HibernateDaoSupport implements DoctorDao {

	@Override
	public List<Doctor> queryDoctorByHospitalIdAndDepartName(
			Integer hospitalId, String departmentName,int startLine,int pageSize) {
		// TODO Auto-generated method stub
		String sql=null;
		sql="select doct.* from doctor doct left join hospital hos  on doct.hospital_id=hos.hospital_id left join department dpt on doct.department_id=dpt.department_id where doct.hospital_id=? and dpt.name=?"; 
		@SuppressWarnings("unchecked")
		List<Doctor> list = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("doct", Doctor.class).
			   setLong(0,hospitalId).setString(1, departmentName).setFirstResult(startLine).setMaxResults(pageSize).list();
		System.out.print(list.size());
		return list;
	}

	@Override
	public Doctor findDoctorById(Integer doctorId) {
		String sql="select doct.* from doctor doct where doct.doctor_id=?";
		@SuppressWarnings("unchecked")
		List<Doctor> doctor = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("doct", Doctor.class)
				.setLong(0, doctorId).list();
		return doctor.size() > 0 ? doctor.get(0) : null;
	}

	@Override
	public List<Doctor> queryDoctorByIllness(String illNess) {
		String sql = "select doct.* from doctor doct where doct.speciality like ? ";
		List<Doctor> list = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("doct", Doctor.class)
				.setString(0, '%'+illNess+'%').list();
		return list;
	}
	@Override
	public List<Doctor> queryDoctorByDoctorName(String doctorName) {
		String sql = "select doct.* from doctor doct where doct.name like ? ";
		List<Doctor> list = this.getSessionFactory().getCurrentSession()
				.createSQLQuery(sql).addEntity("doct", Doctor.class)
				.setString(0, '%'+doctorName+'%').list();
		return list;
	}

	@Override
	public List<Doctor> queryDoctorsByHospitalId(int pageSize, int pageIndex,Integer hospitalId) {
		String sql = null;
		sql="select doct.* from doctor doct where doct.hospital_id=?";
		List<Doctor> doctorLists = this.getSessionFactory().getCurrentSession().createSQLQuery(sql)
				.addEntity("doct", Doctor.class).setLong(0, hospitalId).setFirstResult((pageIndex-1)*pageSize).setMaxResults(pageSize).list();
		return doctorLists;
	}

	@Override
	public int getTotalCount(Integer hospitalId) {
		String sql ="select count(*) from doctor  where hospital_id =? ";
		Query query = this.getSessionFactory().getCurrentSession().createSQLQuery(sql).setLong(0,hospitalId);
		List list = query.list();
		Integer count = Integer.parseInt(list.get(0).toString());
		return count;
	}

	@Override
	public void addDoctor(Doctor doctor) {
		// TODO Auto-generated method stub
		getHibernateTemplate().save(doctor);
	}

	@Override
	public void delDoctorByDoctorId(Integer doctorId) {
		/*List<Doctor> list = getHibernateTemplate().find("from Doctor doctor where doctor.doctorId=?",doctorId);
		System.out.println("É¾³ý"+list.get(0).getDepartment().getName());
		if(list.size()>0){
			getHibernateTemplate().delete(list.get(0));
		}*/
		Doctor doctor=(Doctor) getHibernateTemplate().get(Doctor.class, doctorId);
		getHibernateTemplate().delete(doctor);
	}

	@Override
	public void updateDoctor(Doctor doctor) {
		// TODO Auto-generated method stub
		getHibernateTemplate().update(doctor);
	}

	@Override
	public boolean verifyDoctorIdExist(Integer doctorId) {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<Doctor> list =
		getHibernateTemplate().find("from Doctor doctor where doctor.doctorId="+doctorId);
		if(list.size()>0)
			return true;
		else 
		return false;
	}

	@Override
	public boolean verifyDoctorLogin(Integer doctorId, String password) {
		@SuppressWarnings("unchecked")
		List<Doctor> list = getHibernateTemplate().find("from Doctor doctor where doctor.doctorId=" + doctorId);
		if (list != null && list.size() > 0) {
			if (list.get(0).getPassword() != null &&list.get(0).getPassword().trim().length()!=0) {
				if (list.get(0).getPassword().equals(password)) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		} else
			return false;
	}

}
