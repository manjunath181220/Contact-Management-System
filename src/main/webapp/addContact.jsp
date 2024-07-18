<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contact Form</title>
<style type="text/css">
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    max-width: 400px;
    width: 100%;
}

h1 {
    text-align: center;
    color: #333333;
    margin-bottom: 20px;
}

form {
    display: flex;
    flex-direction: column;
}

input[type="text"],
input[type="submit"] {
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

input[type="submit"] {
    background-color: #007bff;
    color: white;
    border: none;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

</style>

</style>
</head>
<body>
<%@include
file="navbar.jsp" %>
<%
String error = (String) request.getAttribute("error");
if (error != null) {
%>
<h1 style="color: red;"><%= error %></h1>
<%
}
%>

<div class="container">
    <div class="form-container">
        <h1>Contact Details</h1>
        <form action="addContact" method="post">
            <input type="text" placeholder="Enter Contact Name" name="contactName">
            <input type="text" placeholder="Enter Contact Number" name="contactNumber">
            <input type="submit" value="Add Contact">
        </form>
    </div>
</div>

</body>
</html>
