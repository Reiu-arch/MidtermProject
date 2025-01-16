<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Recipe</title>
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
}

form input[type="text"], form input[type="number"], form input[type="radio"]
	{
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
	margin-bottom: 15px;
	width: 100%;
}

form input[type="radio"] {
	width: auto;
	margin-right: 10px;
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

.tagline {
	font-size: 1.5em;
	font-weight: bold;
	color: #D4B57F;
	text-align: center;
	margin-top: 20px;
	font-family: 'Georgia', serif;
	letter-spacing: 1px;
}
</style>
</head>

<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Create Recipe</h1>

	<jsp:include page="navbar.jsp" />

	<form action="createrecipe.do" method="POST">
		<label for="imageUrl">Enter the URL of your picture:</label> <input
			type="text" id="imageUrl" name="imageUrl" size="50" required>

		<label for="name">Enter the recipe's name:</label> <input type="text"
			id="name" name="name" size="20" required> <label
			for="description">Enter the description:</label> <input type="text"
			id="description" name="description" size="80" required> <label
			for="prepTimeMin">Enter the prep time in minutes:</label> <input
			type="number" id="prepTimeMin" name="prepTimeMin" required> <label
			for="cookTimeMin">Enter the cook time in minutes:</label> <input
			type="number" id="cookTimeMin" name="cookTimeMin" required> <label
			for="instructions">Enter the recipe's instructions:</label> <input
			type="text" id="instructions" name="instructions" size="100" required>

		<label for="servings">Enter the serving size:</label> <input
			type="number" id="servings" name="servings" required> <label
			for="difficulty">Choose the difficulty:</label> <input type="radio"
			id="easy" name="difficulty" value="Easy"> <label for="easy">Easy</label>
		<input type="radio" id="medium" name="difficulty" value="Medium">
		<label for="medium">Medium</label> <input type="radio" id="hard"
			name="difficulty" value="Hard"> <label for="hard">Hard</label>

			<br>
			<br>

		<label for="ingredients">Enter the recipe's ingredients:</label> <input
			type="text" id="ingredients" name="ingredients" size="100" required>

		<button type="submit" onclick="return window.confirm('Confirm Add?');">Submit</button>
	</form>

</body>
</html>
