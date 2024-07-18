<%@page import="com.jsp.cms.entity.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
<
<
style type ="text /css ">body {
	font-family: Arial, sans-serif;
	background-color: #2c3e50; /* Background color */
	color: #ffffff; /* Text color */
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	height: 100vh;
}

.container {
	width: 60%; /* Adjust the width to your preference */
	margin: 20px auto;
	padding: 20px;
	background-color: rgba(255, 255, 255, 0.9);
	/* Light background for content */
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); /* Shadow for container */
}

h1 {
	text-align: center;
	color: #333333;
	margin-bottom: 20px;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

table th, table td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd; /* Border color */
}

table th {
	background-color: #2980b9; /* Header background color */
	color: #ffffff;
}

table tr:nth-child(even) {
	background-color: #f2f2f2; /* Alternate row background color */
}

table tr:hover {
	background-color: #e0e0e0; /* Hover background color */
}

a.edit, a.delete {
	display: inline-block;
	padding: 5px 10px;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

a.edit {
	background-color: #007bff;
	color: #ffffff;
}

a.edit:hover {
	background-color: #0056b3;
	color: #ffffff;
}

a.delete {
	background-color: #ff4d4d;
	color: #ffffff;
}

a.delete:hover {
	background-color: #cc0000;
	color: #ffffff;
}
</style>

</head>
<body>

	<%@include file="navbar.jsp"%>
	<%
	List<Contact> contacts = (List<Contact>) request.getAttribute("list");
	%>
	<table>
		<tr>
			<th>Name</th>
			<th>Contact</th>
			<th>Edit</th>
			<th>Delete</th>
		</tr>
		<%
		for (Contact contact : contacts) {
		%>
		<tr>
			<td><%=contact.getContactName()%></td>
			<td><%=contact.getContactNumber()%></td>
			<td><a href="edit_contact?contactId=<%=contact.getContactId()%>">Edit</a></td>
			<td><a
				href="delete_contact?contactId=<%=contact.getContactId()%>">Delete</a></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>