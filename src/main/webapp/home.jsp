<%@page import="com.jsp.cms.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
<style type="text/css">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.navbar {
    background-color: #333;
    overflow: hidden;
    width: 100%;
}

.navbar a {
    float: left;
    display: block;
    color: white;
    text-align: center;
    padding: 14px 20px;
    text-decoration: none;
}

.navbar a:hover {
    background-color: #ddd;
    color: black;
}

.container {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: calc(100vh - 56px); /* Adjust height to account for navbar */
    text-align: center;
}

h1 {
    color: maroon;
}

.button {
    display: inline-block;
    margin: 10px 0;
    padding: 15px 30px; /* Increased padding for better clickability */
    text-decoration: none;
    color: white;
    background-color: #007bff;
    border: 2px solid transparent; /* Added border for better visibility */
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s, border-color 0.3s;
}

.button:hover {
    background-color: #0056b3;
    border-color: #0056b3; /* Change border color on hover */
}

h2 {
    color: red;
    margin-top: 20px;
}

</style>
</head>
<body>

<%@ include file="navbar.jsp" %>

<%
User user = (User) session.getAttribute("user");
String addContact = user != null ? "addContact.jsp" : "login.jsp";
String manageContact = user != null ? "manageContact" : "login.jsp";
String manageProfile = user != null ? "manageProfile.jsp" : "login.jsp";
%>

<div class="container">
    <h1>Welcome To The Application</h1>
    <a class="button" href="<%=addContact%>">Add Contact</a>
    <br><br>
    <a class="button" href="<%=manageContact%>">Manage Contact</a>
    <br><br>
    <a class="button" href="<%=manageProfile%>">Manage Profile</a>
    <br><br>

    <%
    String error = (String) request.getAttribute("error");
    if (error != null) {
    %>
    <h2><%=error%></h2>
    <%
    }
    %>
</div>

</body>
</html>
