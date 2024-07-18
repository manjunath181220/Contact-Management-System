package com.jsp.cms.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.cms.config.DAOSingleton;
import com.jsp.cms.entity.Contact;
import com.jsp.cms.entity.User;

@WebServlet("/addContact")
public class AddContact extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Contact contact=new Contact();
		contact.setContactName(req.getParameter("contactName"));
		contact.setContactNumber(Long.parseLong(req.getParameter("contactNumber")));
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		if(user!=null) {
		System.out.println(user);
		contact.setUser(user);
		}
		
		boolean result = DAOSingleton.getContactDao().addContacts(contact);
		if (result) {
			resp.sendRedirect("home.jsp");
		} else {
			req.setAttribute("error","fail to add");
			req.getRequestDispatcher("addContact.jsp").forward(req, resp);
		}
	}
}
