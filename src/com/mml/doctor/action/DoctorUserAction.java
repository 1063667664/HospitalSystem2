package com.mml.doctor.action;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Doctor;
import com.whx.dao.DoctorDao;

public class DoctorUserAction implements Action {
	private  Integer doctorId;
    private Doctor doctor;
    private DoctorDao doctorDao;
    private String password1;
    private String password2;
    private String changePasswordTip;
    private String name;//ҽ������
    private String sex;//ҽ���Ա�
    private String speciality; //ҽ��ר��
    private String updateDoctorTip;
    
	public String getUpdateDoctorTip() {
		return updateDoctorTip;
	}
	public void setUpdateDoctorTip(String updateDoctorTip) {
		this.updateDoctorTip = updateDoctorTip;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getSpeciality() {
		return speciality;
	}
	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}
	public String getChangePasswordTip() {
		return changePasswordTip;
	}
	public void setChangePasswordTip(String changePasswordTip) {
		this.changePasswordTip = changePasswordTip;
	}
	public DoctorDao getDoctorDao() {
		return doctorDao;
	}
	public void setDoctorDao(DoctorDao doctorDao) {
		this.doctorDao = doctorDao;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Integer getDoctorId() {
		return doctorId;
	}

	public void setDoctorId(Integer doctorId) {
		this.doctorId = doctorId;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	@Override
	public String execute() throws Exception {
		if(doctorId!=null){
		  doctor = doctorDao.findDoctorById(doctorId);
		}
		return SUCCESS;
	}
	
	public String changePassword(){
		if(password1==null||password1.trim().length()==0){
			this.setChangePasswordTip("�����벻��Ϊ��");
			return SUCCESS;
		}
		else if(!password1.matches("^.{6,20}$")){
			this.setChangePasswordTip("����ֻ����6-12λ���ֻ���ĸ���");
			return SUCCESS;
		}
		else if(!password1.equals(password2)){
			this.setChangePasswordTip("�������벻һ��");
		    return SUCCESS;
		}else{
			if(doctorId!=null){
			 doctor=doctorDao.findDoctorById(doctorId);
			 doctor.setPassword(password1);
			 doctorDao.updateDoctor(doctor);
			 this.setChangePasswordTip("�޸�����ɹ�");
				return SUCCESS;
			}
			else {	
				this.setChangePasswordTip("ϵͳ��������ϵ����");
				return SUCCESS;
			}
		}
	
	}
	public String forwardToEditPage(){
		doctor =doctorDao.findDoctorById(doctorId);
		return SUCCESS;
	}
	public  String editDoctorInfo(){
		if(doctorId==null){
			updateDoctorTip = "doctorIdΪ�գ�����ҽ����Ϣʧ��";	
			return SUCCESS;
		}
		doctor =doctorDao.findDoctorById(doctorId);
		doctor.setSpeciality(speciality);
		doctor.setName(name);
		doctor.setSex(sex);
		doctorDao.updateDoctor(doctor);
		updateDoctorTip = "����ҽ����Ϣ�ɹ�";
		return SUCCESS;
	}
	

}

