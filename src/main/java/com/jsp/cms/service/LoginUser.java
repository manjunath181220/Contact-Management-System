package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.User;

@WebServlet("/login")
public class LoginUser extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		User user=DAOSingleton.getUserDao().findUserByEmailAndPassword(email,password);
		if(user!=null) {
			HttpSession session = req.getSession(true);
			session.setAttribute("user", user);
//			req.getRequestDispatcher("home.jsp").forward(req, resp);
			resp.sendRedirect("home.jsp");
		}else {
			req.setAttribute("error", "Email or password is incorrect");
			req.getRequestDispatcher("login.jsp").forward(req, resp);
		}
	}
}
