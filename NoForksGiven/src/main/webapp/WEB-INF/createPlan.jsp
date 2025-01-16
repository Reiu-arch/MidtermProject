<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Plans</title>
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
	font-size: 2.5em;
	margin: 30px 0;
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

form {
	width: 80%;
	max-width: 800px;
	margin: 30px auto;
	padding: 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

form label {
	font-size: 1.1em;
	margin-bottom: 10px;
	color: #296A4B;
	display: block;
}

form input[type="text"], form textarea {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
	margin-bottom: 15px;
	width: 100%;
}

form textarea {
	resize: vertical;
}

form button {
	background-color: #D4B57F;
	color: white;
	border: none;
	font-size: 1.1em;
	padding: 12px 20px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
	width: 100%;
}

form button:hover {
	background-color: #2c6e48;
}
</style>
</head>
<body>
	<header>
		<p>Create Plans</p>
	</header>

	<jsp:include page="navbar.jsp"/>

	<h1>Create Plans</h1>
	<form action="createPlan.do" method="POST" class="action-form">
		<label for="name">Enter the name for your plan:</label>
		<input type="text" id="name" name="name" required>

		<label for="notes">Enter your notes:</label>
		<textarea id="notes" name="notes" rows="5"></textarea>

		<label for="imageUrl">Enter in an image URL:</label>
		<input type="text" id="imageUrl" name="imageUrl">

		<button type="submit" class="button">Create Plan</button>
	</form>
</body>
</html>
