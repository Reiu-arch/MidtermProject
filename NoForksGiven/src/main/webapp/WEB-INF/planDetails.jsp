<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan Details</title>
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

h3 {
	color: #296A4B;
	margin-top: 20px;
	font-size: 1.8em;
	text-align: center;
}

.button h3 a  {
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

img {
	display: block;
	margin: 20px auto;
	max-width: 80%;
	height: auto;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

p {
	text-align: center;
	margin: 10px auto;
	font-size: 1.1em;
	line-height: 1.6;
}

ul {
	list-style: none;
	padding: 0;
	margin: 20px auto;
	width: 80%;
	max-width: 800px;
}

ul li {
	background-color: white;
	padding: 15px;
	margin-bottom: 10px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	font-size: 1.1em;
	color: #333;
}

form {
	background-color: white;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	margin: 20px auto;
	width: 80%;
	max-width: 800px;
}

form label {
	display: block;
	font-size: 1.1em;
	margin-bottom: 5px;
	color: #296A4B;
}

form input, form select {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
}

form button {
	background-color: #D4B57F;
	color: white;
	border: none;
	padding: 12px 20px;
	border-radius: 8px;
	cursor: pointer;
	font-size: 1.1em;
	transition: background-color 0.3s;
	width: 100%;
}

form button:hover {
	background-color: #2c6e48;
}

.meal-list h3 a {
	color: #296A4B;
	text-decoration: none;
	font-weight: bold;
	font-size: 1em;
	margin-left: 10px;
}
</style>
</head>
<body>
	<header>
		<p>Plan Details</p>
	</header>

	<jsp:include page="navbar.jsp" />

	<c:choose>
		<c:when test="${empty plan}">
			<h1>Plan not found</h1>
		</c:when>
		<c:otherwise>
			<h1>${plan.name}</h1>
			<img src="${plan.imageUrl}">
			<p>Plan Notes: ${plan.notes}</p>

			<h3>Plan Meals</h3>
			<ul>
				<c:forEach var="planMeal" items="${planMeals}">
					<li>
						Day ${planMeal.dayNumber}: ${planMeal.meal.name} - ${planMeal.mealType.name} 
						(${planMeal.notes})
					</li>
				</c:forEach>
			</ul>

			<div class="meal-list">
				<h3>Your Meals</h3> 
				<h3> <a href="viewallmeals.do">View All Meals</a> </h3>
				<ul>
					<c:forEach var="meal" items="${loggedInUser.userMeals}">
						<c:if test="${meal.enabled}">
							<li>${meal.name}
								<form action="addMealToPlan.do" method="POST">
									<input type="hidden" name="meal.id" value="${meal.id}">
									<input type="hidden" name="plan.id" value="${plan.id}">
									
									<label for="dayNumber">Day Number</label>
									<input type="number" name="dayNumber">
									
									<label for="notes">Notes</label>
									<input type="text" name="notes">
									
									<label for="mealType.id">Meal Type</label>
									<select name="mealType.id">
										<c:forEach var="mealType" items="${mealTypes}">
											<option value="${mealType.id}">${mealType.name}</option>
										</c:forEach>
									</select>
									
									<button type="submit">Add Meal To Plan</button>
								</form>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>
