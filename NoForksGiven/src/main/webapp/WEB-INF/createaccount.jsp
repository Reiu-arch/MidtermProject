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
<c:when test="${errorMessage}">


	<h2>Sign Up Today!</h2>
	<form action="createaccount.do" method="POST">

		<input type="text" name="email" placeholder="email"> 
		<input type="text" name="username" placeholder="username">
		<input type="password" name="password" placeholder="password" /> 
		<input type="submit" value="Log In">
</c:when> 
<c:otherwise>
<p>ACCOUNT FAILED TO ADD</p>
</c:otherwise>
</c:choose>


	</form>
</body>
</html>