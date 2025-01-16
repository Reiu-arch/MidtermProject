<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe</title>
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

.recipe-container {
	display: flex;
	justify-content: center;
	margin-top: 10px;
	padding: 20px;
}

.recipe-details {
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	padding: 30px;
	width: 600px;
	text-align: left;
}

.recipe-details img {
	width: 100%;
	height: auto;
	border-radius: 8px;
}

.recipe-details h2 {
	color: #296A4B;
	font-size: 2em;
	margin-top: 20px;
}

.recipe-details p {
	font-size: 1.1em;
	color: #555;
	margin-bottom: 10px;
}

.recipe-details .button, .delete-button {
	padding: 15px 30px;
	font-size: 1.2em;
	background-color: #296A4B;
	color: white;
	border-radius: 8px;
	text-decoration: none;
	display: inline-block;
	margin-top: 20px;
	transition: background-color 0.3s;
	width: 100%;
}

.recipe-details .button:hover, .delete-button:hover {
	background-color: #2c6e48;
}

.button-container {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 20px;
	margin-top: 20px;
}

.button, .delete-button {
	padding: 12px 20px;
	font-size: 1.2em;
	border-radius: 8px;
	text-align: center;
	cursor: pointer;
	text-decoration: none;
	display: inline-block;
	transition: background-color 0.3s ease;
	border: none;
	width: auto;
}

.button {
	background-color: #296A4B;
	color: white;
}

.button:hover {
	background-color: #2c6e48;
}

.delete-button {
	background-color: #D9534F;
	color: white;
}

.delete-button:hover {
	background-color: #c9302c;
}

.action-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 20px auto;
	width: 80%;
	background-color: #E5F4ED;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.action-form {
	display: flex;
	justify-content: center;
	align-items: center;
	gap: 15px;
	width: 100%;
}

.form-select {
	padding: 12px 20px;
	font-size: 1.1em;
	border: 1px solid #ddd;
	border-radius: 8px;
	background-color: white;
	color: #555;
	width: 60%;
}

.form-select:focus {
	outline: none;
	border-color: #296A4B;
	box-shadow: 0 0 5px rgba(41, 106, 75, 0.5);
}

.button {
	padding: 12px 20px;
	font-size: 1.1em;
	background-color: #296A4B;
	color: white;
	text-decoration: none;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.recipe-details img {
	margin-top: 50px;
}

@media ( max-width : 768px) {
	.recipe-container {
		flex-direction: column;
		align-items: center;
	}
	.recipe-details {
		width: 100%;
		padding: 15px;
	}
	.form-select {
		font-size: 1.1em;
		padding: 10px 15px;
	}
	.recipe-details .button, .delete-button {
		padding: 15px;
		font-size: 1.2em;
	}
}
</style>
</head>
<body>

	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>Recipe Details</h1>
	<jsp:include page="navbar.jsp" />

	<!-- Dropdown and Add Recipe to Meal button -->
	<c:if test="${loggedInUser != null}">
		<div class="action-container">
			<form action="addMeal.do" method="POST" class="action-form">
				<select name="mealId" class="form-select">
					<c:forEach var="meal" items="${loggedInUser.userMeals}">
						<c:if test="${meal.enabled == true}">
							<option value="${meal.id}">${meal.name}</option>
						</c:if>
					</c:forEach>
				</select> <input type="hidden" id="recipeId" name="recipeId"
					value="<c:out value='${recipe.id}' />">
				<button type="submit" class="button">Add Recipe to Meal</button>
			</form>
		</div>
	</c:if>

	<div class="recipe-container">
		<div class="recipe-details">

			<c:if test="${loggedInUser == recipe.user}">
				<div class="button-container">
					<a href="updateRecipe.do?recipeId=${recipe.id}" class="button">Update
						Recipe</a>
					<form action="deleteRecipe.do" method="GET" class="action-form"
						onsubmit="return window.confirm('Confirm Delete?');">
						<input type="hidden" id="recipeId" name="recipeId"
							value="<c:out value='${recipe.id}' />">
						<button type="submit" class="delete-button">Delete Recipe</button>
					</form>
				</div>
			</c:if>


			<img src="${recipe.imageUrl}" alt="Recipe Image" />
			<h2>${recipe.name}</h2>
			<p>
				<strong>ID:</strong> ${recipe.id}
			</p>
			<p>
				<strong>Description:</strong> ${recipe.description}
			</p>
			<p>
				<strong>Preparation Time:</strong> ${recipe.prepTimeMin} mins
			</p>
			<p>
				<strong>Cook Time:</strong> ${recipe.cookTimeMin} mins
			</p>
			<p>
				<strong>Instructions:</strong> ${recipe.instructions}
			</p>
			<p>
				<strong>Servings:</strong> ${recipe.servings}
			</p>
			<p>
				<strong>Difficulty:</strong> ${recipe.difficulty}
			</p>
			<p>
				<strong>Ingredients:</strong> ${recipe.ingredients}
			</p>
			<p>
				<strong>Created by:</strong> ${recipe.user.username}
			</p>
			<p>
				<strong>Created on:</strong> ${recipe.createDate}
			</p>
			<p>
				<strong>Last Updated:</strong> ${recipe.lastUpdate}
			</p>
		</div>
	</div>
</body>

</html>
