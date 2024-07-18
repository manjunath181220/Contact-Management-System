package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.cms.config.DAOSingleton;

@WebServlet("/delete_contact")
public class Delete_Contact extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int contactId=Integer.parseInt(req.getParameter("contactId"));
		boolean result = DAOSingleton.getContactDao().deleteContact(contactId);
		if (result) {
			resp.sendRedirect("manageContact");
		} else {
			req.setAttribute("error", "failed to delete");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
