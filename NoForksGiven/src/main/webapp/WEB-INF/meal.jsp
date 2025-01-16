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
	font-size: 2.5em;
	margin-top: 30px;
	font-family: 'Georgia', serif;
}

.meal-details {
	text-align: center;
	margin-top: 40px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.meal-details ol {
	list-style-type: decimal;
	padding-left: 20px;
}

.meal-details li {
	font-size: 1.2em;
	margin: 10px 0;
	font-family: 'Georgia', serif;
	color: #333;
}

.edit-button, .delete-button, .add-recipe-button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-align: center;
	margin: 10px;
	display: inline-block;
}

.edit-button:hover, .delete-button:hover, .add-recipe-button:hover {
	background-color: #2c6e48;
}

.meal-actions {
	display: flex;
	justify-content: center;
	gap: 15px; 
	margin-top: 20px;
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

@media ( max-width : 768px) {
	.meal-details {
		padding: 10px;
	}
	.meal-details li {
		font-size: 1.1em;
		margin: 8px 0;
	}
	.edit-button, .delete-button, .add-recipe-button {
		padding: 8px 16px;
		font-size: 1em;
	}
	.meal-actions {
		flex-direction: column;
		align-items: center; 
	}
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<h1>Meal Page</h1>

	<div class="meal-details">
		<h2>${meal.name}</h2>
		<h3>Recipes in this Meal</h3>
		<ol>
			<c:forEach var="recipe" items="${meal.recipes}">
				<li>${recipe.name}</li>
			</c:forEach>
		</ol>

		<a href="browseResults.do" class="add-recipe-button">Add Recipes
			to Meal</a>

		<div class="meal-actions">
			<a href="updateMeal.do?mealId=${meal.id}" class="edit-button">Edit
				Meal</a>
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
