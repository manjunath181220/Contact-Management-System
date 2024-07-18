package com.jsp.cms.config;

import com.jsp.cms.dao.ContactDao;
import com.jsp.cms.dao.UserDao;

public class DAOSingleton {

	private static UserDao userDao;
	private static ContactDao contactDao;
	

	private DAOSingleton() {}
	
	public static synchronized UserDao getUserDao() {
		if(userDao==null) userDao=new UserDao();
		return userDao;
	}
	
	public static synchronized ContactDao getContactDao() {
		if(contactDao==null) contactDao=new ContactDao();
		return contactDao;
	}
}
