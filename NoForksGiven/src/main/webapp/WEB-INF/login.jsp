<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
}

header {
	background-color: #296A4B;
	color: white;
	padding: 20px 40px;
	text-align: center;
}

header p {
	font-size: 1.2em;
	font-weight: bold;
	margin: 0;
}

h1 {
	text-align: center;
	color: #296A4B;
	font-size: 3em;
	margin-top: 50px;
	font-family: 'Georgia', serif;
}

nav {
	background-color: white;
	border-top: 3px solid #296A4B;
	border-bottom: 3px solid #296A4B;
	padding: 10px 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

nav a {
	color: #296A4B;
	text-decoration: none;
	font-size: 1.1em;
	margin: 0 20px;
	font-weight: bold;
}

.hero-section {
	text-align: center;
	padding: 40px 20px;
	background-color: #E5F4ED;
	font-family: 'Georgia', serif;
	font-style: italic;
	margin-top: 20px;
}

.hero-section h1 {
	font-size: 3.5em;
	color: #296A4B;
	margin-bottom: 10px;
}

.hero-section p {
	font-size: 1.2em;
	color: #555;
	margin-bottom: 30px;
}

.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.form-section form {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 30px 40px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	width: 350px;
}

.form-section input {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
	margin-bottom: 15px;
	width: 100%;
}

.form-section input[type="submit"] {
	background-color: #D4B57F;
	color: white;
	border: none;
	font-size: 1.1em;
	transition: background-color 0.3s;
	cursor: pointer;
}

.form-section input[type="submit"]:hover {
	background-color: #2c6e48;
}

.signup-link {
	text-align: center;
	font-size: 1.1em;
	margin-top: 20px;
}

.signup-link a {
	color: #296A4B;
	text-decoration: none;
	font-weight: bold;
}

.signup-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Log In</h1>

	<jsp:include page="navbar.jsp" />

	<c:choose>
		<c:when test="${not empty loginErrorMessage}">
			<p style="color: red; text-align: center;">${loginErrorMessage}</p>
		</c:when>
	</c:choose>

	<div class="form-section">
		<form action="login.do" method="POST">
			<input type="text" name="username" placeholder="Username" required>
			<input type="password" name="password" placeholder="Password"
				required> <input type="submit" value="Log In">
		</form>
	</div>

	<div class="signup-link">
		<p>
			Don't have an account? <a href="createaccount.do">Sign Up!</a>
		</p>
	</div>


</body>
</html>
