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

@WebServlet("/delete_user")
public class Delete_User extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user =(User) session.getAttribute("user");
		int id=user.getUserId();
		session.removeAttribute("user");
		boolean result = DAOSingleton.getUserDao().deleteUser(id);
		if (result) {
			
			resp.sendRedirect("home.jsp");
		} else {
			req.setAttribute("error", "failed to delete");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
