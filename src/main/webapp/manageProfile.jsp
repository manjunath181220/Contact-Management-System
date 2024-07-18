<!DOCTYPE html>
<%@page import="com.jsp.cms.entity.User"%>
<html>
<head>
<meta charset="UTF-8">
<title>User Details</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }
  .out {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 300px;
    text-align: center;
  }
  .container p {
    margin: 10px 0;
  }
  .container span {
    font-weight: bold;
  }
  .container div {
    margin-top: 20px;
  }
  .container a {
    text-decoration: none;
    color: #ffffff;
    background-color: #007bff;
    padding: 10px 20px;
    border-radius: 5px;
    margin: 0 10px;
    display: inline-block;
  }
  .container a.delete {
    background-color: #dc3545;
  }
  .container a:hover {
    opacity: 0.8;
  }
</style>
</head>
<body>
	<%
	User user=(User)session.getAttribute("user");
	int userId=user!=null?user.getUserId():0;
	String userName=user!=null?user.getUserName():"";
	String email=user !=null?user.getEmail():"";
	String password=user!=null?user.getPassword():"";
	%>
	
	<div class="out">
		<div class="container">
			<p><span>Name:</span> <%=userName %></p>
			<p><span>Email:</span> <%=email %></p>
			<p><span>Password:</span> <%=password %></p>
			<div>
				<a href="update_user.jsp" class="update">Edit</a>
				<a href="delete_user" class="delete">Delete</a>
			</div>
		</div>
	</div>
</body>
</html>
