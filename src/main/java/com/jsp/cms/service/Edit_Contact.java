package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.Contact;

@WebServlet("/edit_contact")
public class Edit_Contact extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int contactId=Integer.parseInt(req.getParameter("contactId"));
		Contact contact = DAOSingleton.getContactDao().getContacts(contactId);
		if (contact != null) {
			req.setAttribute("contact", contact);
			req.getRequestDispatcher("update_request.jsp").forward(req, resp);
		}else {
			req.setAttribute("error", "faild to update");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
