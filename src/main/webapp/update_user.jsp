<!DOCTYPE html>
<%@page import="com.jsp.cms.entity.User"%>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<style>
  body {
    font-family: Arial, sans-serif;
    background-color: #f5f5f5;
    margin: 0;
    padding: 0;
  }
  .navbar {
    background-color: #007bff;
    color: white;
    padding: 10px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }
  .navbar a {
    color: white;
    text-decoration: none;
    padding: 10px;
  }
  .navbar a:hover {
    background-color: #0056b3;
    border-radius: 5px;
  }
  .container {
    background-color: #ffffff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    width: 400px;
    margin: 40px auto;
  }
  .form_container {
    text-align: center;
  }
  .form_container h1 {
    margin-bottom: 20px;
    font-size: 24px;
    color: #333333;
  }
  .form_container input[type="text"],
  .form_container input[type="email"],
  .form_container input[type="password"],
  .form_container input[type="submit"] {
    width: calc(100% - 20px);
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #cccccc;
    font-size: 16px;
    box-sizing: border-box; /* Ensures padding and width are included in the total width */
  }
  .form_container input[type="submit"] {
    background-color: #007bff;
    color: #ffffff;
    border: none;
    cursor: pointer;
  }
  .form_container input[type="submit"]:hover {
    background-color: #0056b3;
  }
  .form_container input[readonly] {
    background-color: #e9ecef;
    color: #6c757d;
    cursor: not-allowed;
  }
  ::-webkit-input-placeholder {
    color: #a9a9a9; /* Light grey color for placeholder text */
    font-style: italic; /* Italic style for placeholder text */
  }
  :-ms-input-placeholder {
    color: #a9a9a9;
    font-style: italic;
  }
  ::placeholder {
    color: #a9a9a9;
    font-style: italic;
  }
</style>
</head>
<body>
<%@include file="navbar.jsp" %>
  <%
  User user = (User) session.getAttribute("user");
  int userId = user != null ? user.getUserId() : 0;
  String userName = user != null ? user.getUserName() : "";
  String email = user != null ? user.getEmail() : "";
  String password = user != null ? user.getPassword() : "";
  %>

  <div class="container">
    <div class="form_container">
      <h1>EDIT PROFILE</h1>
      <form action="update_profile" method="post">
        <input type="text" name="userId" value="<%=userId%>" readonly="readonly">
        <input type="text" name="userName" value="<%=userName%>" placeholder="Enter your name" required="required">
        <input type="email" name="email" value="<%=email%>" placeholder="Enter your email" required="required">
        <input type="password" name="password" value="<%=password%>" placeholder="Enter your password" required="required">
        <input type="submit" value="Update Profile">
      </form>
    </div>
  </div>
</body>
</html>
