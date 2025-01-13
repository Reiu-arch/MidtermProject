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
	<c:choose>
		<c:when test="${not empty errorMessage}">
			<p style="color: red;">${errorMessage}</p>
		</c:when>
	</c:choose>

	<h2>Sign Up Today!</h2>
	<form action="createaccount.do" method="POST">

		<input type="text" name="email" placeholder="email"> <input
			type="text" name="username" placeholder="username"> <input
			type="password" name="password" placeholder="password" /> <input
			type="submit" value="Log In">

	</form>
</body>
</html>