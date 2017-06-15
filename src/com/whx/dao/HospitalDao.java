package com.whx.dao;

import java.util.List;

import com.whx.bean.Hospital;

public interface HospitalDao {
	public List queryForPage(final String hql,final int offset,final int length);
	public List queryForPage(final String hql,final int offset,final int length,String hospitalName);
	public int getAllRowCount(String hql,String hospitalName);
	public int getAllRowCount(String hql);
	public Hospital queryForHospital(final Integer id);
	/**
	 * 查找所有医院
	 */
	public List<Hospital>  findAllHospital(int pageSize,int pageIndex);
	/**
	 * 查询所有医院的个数
	 * @return
	 */
	public int getTotalCount();
	/**
	 * 添加医院
	 */
	public void addHospital(Hospital hospital);
	/**
	 * 更新医院信息
	 */
	public void updateHospital(Hospital hospital);
	/**
	 * 删除医院
	 */
	public void deleteHospital(Integer hospitalId);
}
