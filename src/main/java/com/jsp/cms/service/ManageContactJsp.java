package com.jsp.cms.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.Contact;
import com.jsp.cms.entity.User;

@WebServlet("/manageContact")
public class ManageContactJsp extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		User user = (com.jsp.cms.entity.User) session.getAttribute("user");
		List<Contact> contacts=DAOSingleton.getContactDao().findContactByUser(user);
		if (contacts != null) {
			req.setAttribute("list", contacts);
			req.getRequestDispatcher("manage_contact.jsp").forward(req, resp);
		} else {
			req.setAttribute("error", "N0 Contacts Found!!");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
