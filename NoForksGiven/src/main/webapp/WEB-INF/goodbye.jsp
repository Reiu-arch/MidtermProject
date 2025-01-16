<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Goodbye</title>
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

.goodbye-message {
	text-align: center;
	font-size: 1.5em;
	color: #555;
	margin-top: 30px;
}

.goodbye-message p {
	font-size: 1.2em;
	color: #D4B57F;
	font-family: 'Georgia', serif;
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

.nav-link {
	text-align: center;
	font-size: 1.1em;
	margin-top: 30px;
}

.nav-link a {
	color: #296A4B;
	text-decoration: none;
	font-weight: bold;
}

.nav-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Goodbye!</h1>

	<div class="goodbye-message">
		<p>We're Sorry to See You Go! Goodbye!</p>
	</div>

	<div class="nav-link">
		<a href="home.do">Back to Home</a>
	</div>

</body>
</html>
