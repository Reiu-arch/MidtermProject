<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Meals</title>
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

.meal-list {
	text-align: center;
	margin-top: 40px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.meal-list h3 {
	font-family: 'Georgia', serif;
	color: #296A4B;
	font-size: 1.5em;
	margin-bottom: 20px;
}

.meal-list ul {
	list-style-type: none;
	padding: 0;
}

.meal-list li {
	font-size: 1.2em;
	margin: 15px 0;
	font-family: 'Georgia', serif;
	color: #333;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #ddd;
	padding-bottom: 10px;
}

.meal-list li:last-child {
	border-bottom: none;
}

.edit-button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 10px 20px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	text-align: center;
}

.edit-button:hover {
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
	.meal-list {
		padding: 10px;
	}
	.meal-list li {
		font-size: 1.1em;
		margin: 10px 0;
	}
	.edit-button {
		padding: 8px 16px;
		font-size: 1em;
	}
}
</style>
</head>
<body>

	<jsp:include page="navbar.jsp" />

	<h1>Available Meals</h1>

	<div class="meal-list">
		<h3>Choose a Meal</h3>
		<ul>
			<c:forEach var="meal" items="${mealList}">
				<li>
					<form action="showMeal.do" method="GET" class="action-form">
						<input type="hidden" id="mealId" name="mealId" value="${meal.id}">
						<button type="submit" class="edit-button">View</button>
					</form> ${meal.name}
				</li>
			</c:forEach>
		</ul>
	</div>

</body>
</html>
