package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.dao.UserDao;
import com.jsp.cms.entity.User;

@WebServlet("/register")
public class RegisterUser extends HttpServlet {

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		User user=new User();
		user.setUserName(req.getParameter("userName"));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		
		boolean result = DAOSingleton.getUserDao().saveUser(user);
		if (result) {
			resp.sendRedirect("login.jsp");
		} else {
			resp.sendRedirect("home.jsp");
		}
	}
}
