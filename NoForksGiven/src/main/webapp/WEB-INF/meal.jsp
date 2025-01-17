<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal</title>
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

h2 {
	text-align: center;
	color: #296A4B;
	font-size: 2em;
	margin-top: 20px;
}

h3 {
	text-align: center;
	color: #555;
	font-size: 1.5em;
	margin-top: 20px;
}

.meal-details {
	text-align: center;
	margin: 40px auto;
	background-color: #ffffff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	max-width: 800px;
}

.meal-details ol {
	list-style-type: decimal;
	margin: 20px auto;
	padding: 0 40px;
	text-align: left;
}

.meal-details li {
	font-size: 1.2em;
	margin: 10px 0;
	color: #333;
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

.action-buttons a, .action-buttons button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 12px 20px;
	margin: 10px 5px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background-color 0.3s ease;
}

.action-buttons a:hover, .action-buttons button:hover {
	background-color: #2c6e48;
}

.action-form {
	display: inline-block;
	margin: 0;
}

@media ( max-width : 768px) {
	.meal-details {
		padding: 20px;
	}
	.meal-details li {
		font-size: 1.1em;
	}
	.action-buttons a, .action-buttons button {
		padding: 10px 16px;
		font-size: 1em;
	}
}
</style>
</head>
<body>

	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Meal Page</h1>
	<jsp:include page="navbar.jsp" />

	<div class="meal-details">
		<h2>${meal.name}</h2>
		<h3>Recipes in this Meal</h3>
		<ol>
			<c:forEach var="recipe" items="${meal.recipes}">
				<li><a href="Recipe.do?recipeId=${recipe.id}">${recipe.name}</a></li>
			</c:forEach>
		</ol>

		<div class="action-buttons">
			<a href="browseResults.do" class="add-recipe-button">Add Recipes
				to Meal</a> <a href="updateMeal.do?mealId=${meal.id}"
				class="edit-button">Edit Meal</a>
			<form action="deleteMeal.do" method="GET" class="action-form"
				onsubmit="return window.confirm('Confirm Delete?');">
				<input type="hidden" id="mealId" name="mealId"
					value="<c:out value='${meal.id}' />">
				<button type="submit" class="delete-button">Delete Meal</button>
			</form>
		</div>
	</div>

</body>
</html>
