package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.User;

@WebServlet("/update_profile")
public class Update_User extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("userId"));
		User user = DAOSingleton.getUserDao().getUser(id);
		user.setUserName(req.getParameter("userName"));
		user.setEmail(req.getParameter("email"));
		user.setPassword(req.getParameter("password"));
		boolean result = DAOSingleton.getUserDao().updateUser(user);
		if(result) {
			resp.sendRedirect("home.jsp");
		}else {
			req.setAttribute("error", "failed to update");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
