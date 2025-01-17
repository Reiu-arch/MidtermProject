<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Recipe</title>
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
	width: 70%;
	margin: 30px auto;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 30px;
}

form input[type="text"],
form input[type="number"],
form input[type="radio"] {
	width: 100%;
	padding: 12px 20px;
	font-size: 1.2em;
	border-radius: 8px;
	border: 1px solid #ddd;
	background-color: #f9f9f9;
	color: #555;
	margin-top: 10px;
	box-sizing: border-box;
}

form input[type="radio"] {
	width: auto;
}

form input:focus {
	outline: none;
	border-color: #296A4B;
	box-shadow: 0 0 5px rgba(41, 106, 75, 0.5);
}

button {
	background-color: #296A4B;
	color: white;
	font-size: 1.2em;
	padding: 15px 30px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	width: 100%;
	margin-top: 20px;
	transition: background-color 0.3s;
}

button:hover {
	background-color: #2c6e48;
}

label {
	font-weight: bold;
	font-size: 1.1em;
}

@media (max-width: 768px) {
	form {
		width: 90%;
	}
	button {
		width: 100%;
	}
}
</style>
</head>
<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<jsp:include page="navbar.jsp" />

	<h1>Update Recipe</h1>

	<form action="updateRecipe.do" method="POST">
		<input type="hidden" name="id" value="${recipe.id}">

		<label for="name">Recipe Name:</label>
		<input type="text" id="name" name="name" placeholder="${recipe.name}" required="required" value="${recipe.name}"><br>

		<label for="imageUrl">Image:</label>
		<input type="text" id="imageUrl" name="imageUrl" size="80" placeholder="${recipe.imageUrl}" required value="${recipe.imageUrl}"><br>

		<label for="description">Description:</label>
		<input type="text" id="description" name="description" size="80" placeholder="${recipe.description}" required value="${recipe.description}"><br>

		<label for="prepTimeMin">Prep-time in minutes:</label>
		<input type="number" id="prepTimeMin" name="prepTimeMin" placeholder="${recipe.prepTimeMin}" required value="${recipe.prepTimeMin}"><br>

		<label for="cookTimeMin">Cook time in minutes:</label>
		<input type="number" id="cookTimeMin" name="cookTimeMin" placeholder="${recipe.cookTimeMin}" required value="${recipe.cookTimeMin}"><br>

		<label for="instructions">Recipe instructions:</label>
		<input type="text" id="instructions" name="instructions" size="100" placeholder="${recipe.instructions}" required value="${recipe.instructions}"><br>

		<label for="servings">Serving size:</label>
		<input type="number" id="servings" name="servings" placeholder="${recipe.servings}" required value="${recipe.servings}"><br>

		<label for="difficulty">Difficulty:</label>
		<label for="easy">Easy</label>
		<input type="radio" id="easy" name="difficulty" value="Easy" <c:if test='${recipe.difficulty == "Easy"}'>checked</c:if>>

		<label for="medium">Medium</label>
		<input type="radio" id="medium" name="difficulty" value="Medium" <c:if test='${recipe.difficulty == "Medium"}'>checked</c:if>>

		<label for="hard">Hard</label>
		<input type="radio" id="hard" name="difficulty" value="Hard" <c:if test='${recipe.difficulty == "Hard"}'>checked</c:if>><br>

		<label for="ingredients">Recipe ingredients:</label>
		<input type="text" id="ingredients" name="ingredients" size="100" placeholder="${recipe.ingredients}" required value="${recipe.ingredients}"><br>

		<button type="submit">Update</button>
	</form>
</body>
</html>
