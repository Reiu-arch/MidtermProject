<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Meal</title>
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

form input[type="text"], form select {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
	margin-bottom: 15px;
	width: 100%;
}

form select {
	width: auto;
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

.error-message {
	color: red;
	text-align: center;
	font-size: 1.1em;
	margin-top: 20px;
}
</style>
</head>
<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Create Meal</h1>

	<jsp:include page="navbar.jsp" />

	<form action="createMeal.do" method="POST">
		<label for="name">Enter the name:</label> <input type="text" id="name"
			name="name" size="50" required> <label for="notes">Enter
			the notes:</label> <input type="text" id="notes" name="notes" size="50">

		<label for="imageUrl">Enter image url:</label> <input type="text"
			id="imageUrl" name="imageUrl" size="50"> <label
			for="mealTypeId">Choose meal type:</label> <select
			name="mealTypeId.id" id="mealTypeId">
			<option value="" disabled selected>Meal Types</option>
			<option value="1">Breakfast</option>
			<option value="2">Lunch</option>
			<option value="3">Dinner</option>
			<option value="4">Snack</option>
			<option value="5">Dessert</option>
		</select>

		<button type="submit" onclick="return window.confirm('Confirm Add?');">Submit</button>

		<c:if test="${not empty errorMessage}">
			<p class="error-message">${errorMessage}</p>
		</c:if>
	</form>

</body>
</html>
