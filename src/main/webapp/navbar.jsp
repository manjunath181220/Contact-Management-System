<%@ page import="com.jsp.cms.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Management System</title>
<style type="text/css">
/* Basic reset to remove default browser styling */
body, html, ul, li, a {
	margin: 0;
	padding: 0;
	list-style: none;
	text-decoration: none;
	font-family: Arial, sans-serif;
}

/* Styling the navigation bar */
.navbar {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #333;
	padding: 10px 20px;
}

.navbar div {
	color: white;
	font-size: 20px;
}

.navbar a {
	color: white;
	margin: 0 10px;
	padding: 10px 20px;
	background-color: #444;
	border-radius: 5px;
	transition: background-color 0.3s;
}

.navbar a:hover {
	background-color: #555;
}
</style>
</head>
<body>
	<%
	User user1 = (User) session.getAttribute("user");
	%>
	<nav class="navbar">
		<div>Contact Management System</div>
		<div>
			<%
			if (user1 == null) {
			%>
			<a href="register.jsp">Register</a> <a href="login.jsp">Login</a>
			<%
			} else {
			%>
			<a href="logout.jsp">Logout</a>
			<%
			}
			%>
		</div>
	</nav>
</body>
</html>
