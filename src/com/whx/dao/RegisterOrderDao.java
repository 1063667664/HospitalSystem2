package com.whx.dao;

import java.security.PublicKey;
import java.util.List;

import com.whx.bean.Registration;

public interface RegisterOrderDao {
	 public void saveRegisterInDb(Registration reg);
	   public boolean selectFromRegister(String userName,String date);
	   public void deleteRegisterById(Integer RId);
	   public List <Registration> selectRegistrationOrderByParam(
			String userName,String hospitalName,String date,String state);
	   public List<Registration> selectRegistrationOrder(String userName,String state);
	   public int selectDoctorTimeByDoctorId(Integer doctorId,String dateTime);
	   public List<Registration> checkRegistrationByDoctorIdAndDateTime(Integer doctorId,String dateTime,int pageSize,int pageIndex);
	   public List<Registration> checkAllRegistrationByDoctorId(Integer doctorId,int pageSize,int pageIndex);
	   public int getTotalCount(Integer doctorId);
	   public int getTotalCountByDateTime(Integer doctorId,String dateTime);
	   //医生处理订单
	   public int updateRegistrationState(Integer registrationId);
}
