package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.Contact;

@WebServlet("/update")
public class Update_Contact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int contactId=Integer.parseInt(req.getParameter("contactId"));
		String contactName=req.getParameter("contactName");
		Long contactNumber=Long.parseLong(req.getParameter("contactNumber"));
		
		Contact contact = DAOSingleton.getContactDao().getContacts(contactId);
		contact.setContactName(contactName);
		contact.setContactNumber(contactNumber);
		boolean result = DAOSingleton.getContactDao().updateContact(contact);
		if (result) {
			resp.sendRedirect("home.jsp");
		} else {
			req.setAttribute("error", "failed To Update");
			req.getRequestDispatcher("home.jsp").forward(req, resp);
		}
	}
}
