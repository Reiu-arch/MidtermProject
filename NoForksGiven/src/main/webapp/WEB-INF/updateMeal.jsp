<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Meal</title>
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

h2 {
	text-align: center;
	color: #296A4B;
	font-size: 2.5em;
	margin-top: 30px;
	font-family: 'Georgia', serif;
}

form {
	text-align: center;
	margin-top: 40px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	max-width: 600px;
	margin-left: auto;
	margin-right: auto;
}

form label {
	font-size: 1.2em;
	color: #296A4B;
	margin-bottom: 5px;
	display: inline-block;
	text-align: left;
}

form input, form select {
	font-size: 1.1em;
	padding: 10px;
	margin-bottom: 20px;
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 8px;
}

form input[type="text"] {
	width: calc(100% - 20px);
	/* Ensures that the input box takes up the full width */
}

form button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-align: center;
	margin-top: 20px;
	width: 100%;
}

form button:hover {
	background-color: #2c6e48;
}

.recipe-actions {
	margin-top: 20px;
	text-align: center;
}

.recipe-actions .recipe-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	background-color: #f1f1f1;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.recipe-actions .recipe-item p {
	font-size: 1.2em;
	color: #333;
	margin: 0;
}

.recipe-actions button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-align: center;
	margin-top: 10px;
}

.recipe-actions button:hover {
	background-color: #2c6e48;
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
	form {
		padding: 10px;
		width: 90%;
	}
	form button {
		padding: 8px 16px;
		font-size: 1em;
	}
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<h2>Update Meal: ${meal.name}</h2>

	<form action="updateMeal.do" method="POST">
		<input type="hidden" name="mealId" value="${meal.id}"> <label
			for="name">Enter the meal name:</label> <input type="text" id="name"
			name="name" placeholder="${meal.name}" required="required"
			value="${meal.name}"><br> <label for="notes">Notes:</label>
		<input type="text" id="notes" name="notes" size="80"
			placeholder="${meal.notes}" value="${meal.notes}"><br> <label
			for="imageUrl">Image Url:</label> <input type="text" id="imageUrl"
			name="imageUrl" placeholder="${meal.imageUrl}"
			value="${meal.imageUrl}"><br> <label for="mealTypeId">Choose
			meal type:</label> <select name="mealTypeId.id" id="mealTypeId">
			<option value="1"
				<c:if test='${meal.mealTypeId.id =="1"}'>selected</c:if>>Breakfast</option>
			<option value="2"
				<c:if test='${meal.mealTypeId.id =="2"}'>selected</c:if>>Lunch</option>
			<option value="3"
				<c:if test='${meal.mealTypeId.id =="3"}'>selected</c:if>>Dinner</option>
			<option value="4"
				<c:if test='${meal.mealTypeId.id =="4"}'>selected</c:if>>Snack</option>
			<option value="5"
				<c:if test='${meal.mealTypeId.id =="5"}'>selected</c:if>>Dessert</option>
		</select>

		<button>Update Meal</button>
	</form>

	<div class="recipe-actions">
		<c:forEach var="recipe" items="${meal.recipes}">
			<div class="recipe-item">
				<p>${recipe.name}</p>
				<form action="removeRecipe.do" method="POST" class="action-form"
					onsubmit="return window.confirm('Confirm Delete?');">
					<input type="hidden" id="recipeId" name="recipeId"
						value="<c:out value='${recipe.id}' />"> <input
						type="hidden" id="mealId" name="mealId"
						value="<c:out value='${meal.id}' />">
					<button type="submit" class="button">Remove Recipe</button>
				</form>
			</div>
		</c:forEach>
	</div>

</body>
</html>
