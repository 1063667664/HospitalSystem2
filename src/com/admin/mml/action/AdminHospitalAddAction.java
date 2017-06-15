package com.admin.mml.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.whx.bean.Hospital;
import com.whx.dao.HospitalDao;

public class AdminHospitalAddAction implements Action {
	private static final int BUFFER_SIZE = 16 * 1024;
	private String addHospitalTip;
	private Integer hospitalId;
	private Hospital hospital;
	private Integer pageIndex;
	public Integer getPageIndex() {
		return pageIndex;
	}

	public void setPageIndex(Integer pageIndex) {
		this.pageIndex = pageIndex;
	}

	public Hospital getHospital() {
		return hospital;
	}

	public void setHospital(Hospital hospital) {
		this.hospital = hospital;
	}

	public Integer getHospitalId() {
		return hospitalId;
	}

	public void setHospitalId(Integer hospitalId) {
		this.hospitalId = hospitalId;
	}

	public String getAddHospitalTip() {
		return addHospitalTip;
	}

	public void setAddHospitalTip(String addHospitalTip) {
		this.addHospitalTip = addHospitalTip;
	}
	private String name;
	private String rank;
	private String telephone;
	private String property;
	private String address;
	private String brief;
	private File myFile; // 上传医院图像
	private String myFileFileName; // 上传医院图像文件名
	private HospitalDao hospitalDao;
	public File getMyFile() {
		return myFile;
	}

	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public HospitalDao getHospitalDao() {
		return hospitalDao;
	}

	public void setHospitalDao(HospitalDao hospitalDao) {
		this.hospitalDao = hospitalDao;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getProperty() {
		return property;
	}

	public void setProperty(String property) {
		this.property = property;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String path = ServletActionContext.getServletContext().getRealPath(
				"/uploadHospital");
		File f = new File(new File(path), this.getMyFileFileName());
		if (!f.getParentFile().exists()) {
			f.getParentFile().mkdir();
		}
		uploadImages(myFile, f);
		Hospital hospital = new Hospital();
		hospital.setAddress(address);
		hospital.setRank(rank);
		hospital.setName(name);
		hospital.setBrief(brief);
		hospital.setTelephone(telephone);
		hospital.setProperty(property);
		hospital.setPath(ServletActionContext.getRequest().getContextPath()
		+ "/uploadHospital/" + this.getMyFileFileName());
		hospitalDao.addHospital(hospital);
		addHospitalTip="添加医院成功";
		return SUCCESS;
	}
	public String editHospital(){
		hospital = hospitalDao.queryForHospital(hospitalId);
		if(hospital!=null){
			hospital.setAddress(address);
			hospital.setRank(rank);
			hospital.setName(name);
			hospital.setBrief(brief);
			hospital.setTelephone(telephone);
			hospital.setProperty(property);
			if(myFileFileName!=null){
				String path = ServletActionContext.getServletContext().getRealPath(
						"/uploadHospital");
				File f = new File(new File(path), this.getMyFileFileName());
				if (!f.getParentFile().exists()) {
					f.getParentFile().mkdir();
				}
				uploadImages(myFile, f);
				hospital.setPath(ServletActionContext.getRequest().getContextPath()
						+ "/uploadHospital/" + this.getMyFileFileName());
			}
			hospitalDao.updateHospital(hospital);
			return SUCCESS;
		}
		else {
			return INPUT;
		}	
	}
	public String getMyFileFileName() {
		return myFileFileName;
	}
	public void setMyFileFileName(String myFileFileName) {
		int pos = myFileFileName.lastIndexOf(".");
		this.myFileFileName = new Date().getTime()
				+ myFileFileName.substring(pos);
		
	}
	private void uploadImages(File src, File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),
						BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),
						BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while (in.read(buffer) > 0) {
					out.write(buffer);
				}
			} finally {
				if (null != in) {
					in.close();
				}
				if (null != out) {
					out.close();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
