<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register Account</title>
</head>
<body>

	<jsp:include page="homebutton.jsp" />

	<h2>Sign Up Today!</h2>
	<form action="createaccount.do" method="POST">

		<input type="text" name="email_address" placeholder="email address"> 
		<input type="text" name="username" placeholder="username">
		<input type="password" name="password" placeholder="password" /> 
		<input type="submit" value="Log In">
	</form>
</body>
</html>