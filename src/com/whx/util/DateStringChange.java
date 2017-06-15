package com.whx.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public  class DateStringChange {
	private SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	@SuppressWarnings("finally")
	public Date StringToDate(String dateString){
		Date date=new Date();
		try {
			 date=sdf.parse(dateString);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}finally{
		  return date;
		}
		
	}
}
