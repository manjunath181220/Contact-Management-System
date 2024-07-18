<%@page import="org.hibernate.dialect.H2Dialect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

.form-container {
    background: white;
    padding: 40px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
    margin: 0 20px; /* Adding margin to avoid touching the screen edges on small devices */
}

h1 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333;
}

h2 {
    color: red;
    margin-bottom: 20px;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 15px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    padding: 15px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

</style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <div class="container">
        <div class="form-container">
            <h1>Login Page</h1>
            <%
            String rs = (String) request.getAttribute("error");
            if (rs != null) {
            %>
            <h2><%=rs%></h2>
            <%
            }
            %> 
            <form action="login" method="post">
                <input type="email" name="email" placeholder="Enter the email"><br>
                <input type="password" name="password" placeholder="Enter the password"><br>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>
</body>
</html>
