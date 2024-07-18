<%@page import="com.jsp.cms.entity.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2; /* Light background color */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 40%; /* Smaller width */
    background-color: #ffffff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

h1 {
    margin-bottom: 20px;
    color: #333333;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

input[type="text"] {
    width: 90%; /* Adjust input width */
    padding: 8px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px; /* Smaller font size */
}

input[type="submit"] {
    width: 60%; /* Adjust button width */
    padding: 10px;
    margin-top: 20px;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    color: white;
    font-size: 14px; /* Smaller font size */
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #0056b3;
}

input::placeholder {
    font-size: 12px; /* Smaller placeholder text */
    color: #999999;
}
</style>

</head>
<body>
	<%
	Contact contact = (Contact) request.getAttribute("contact");
	int contactId = contact != null ? contact.getContactId() : 0;
	String contactName = contact != null ? contact.getContactName() : "";
	Long contactNumber = contact != null ? contact.getContactNumber() : 0;
	%>
	<div class="container">
		<div class="form-container">
			<h1>Edit Contact</h1>
			<form action="update" method="post">
				<input type="text" value="<%=contactId%>" name="contactId">
				<br>
				<br> <input type="text" value="<%=contactName%>"
					name="contactName"> <br>
				<br> <input type="text" value="<%=contactNumber%>"
					name="contactNumber"> <br>
				<br> <input type="submit" value="updateContact">
			</form>
		</div>
	</div>
</body>
</html>