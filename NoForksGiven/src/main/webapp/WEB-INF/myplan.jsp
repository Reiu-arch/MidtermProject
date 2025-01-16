<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Plans</title>
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

table {
	width: 90%;
	margin: 30px auto;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ccc;
	text-align: center;
	padding: 10px;
}

th {
	background-color: #f4f4f4;
}

.view-button {
	background-color: #D4B57F;
	color: white;
	text-decoration: none;
	font-size: 1em;
	padding: 8px 16px;
	border-radius: 8px;
	transition: background-color 0.3s;
}

.view-button:hover {
	background-color: #296A4B;
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

.welcome {
	font-size: 1.2em;
	color: #555;
	text-align: center;
	padding: 15px 30px;
	line-height: 1.8;
	margin-top: 20px;
	font-style: italic;
	font-family: 'Arial', sans-serif;
}

select {
    z-index: 10;
    position: relative;
}


select {
    width: 100%;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1em;
    background-color: white;
}


@media ( max-width : 768px) {
	table {
		width: 100%;
	}
	nav a {
		font-size: 1em;
		margin: 0 15px;
	}
}
</style>
</head>
<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<h1>My Plans</h1>
	<jsp:include page="navbar.jsp" />

	<p class="tagline">Why Fork Around. Just Eat</p>

	<table>
		<thead>
			<tr>
				<th></th>
				<th>Sunday</th>
				<th>Monday</th>
				<th>Tuesday</th>
				<th>Wednesday</th>
				<th>Thursday</th>
				<th>Friday</th>
				<th>Saturday</th>
			</tr>
		</thead>

		<tbody>
			<tr>
				<td>Breakfast</td>
				<c:forEach var="day"
					items="${['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']}">
					<td>
						<form method="GET" action="showMeal.do">
							<select name="mealId" required>
								<option value="" selected disabled hidden>Choose Meal</option>
								<c:forEach var="meal" items="${loggedInUser.userMeals}">
									<option value="${meal.id}">${meal.name}</option>
								</c:forEach>
							</select>
							<button type="submit" class="view-button">View</button>
						</form>
					</td>
				</c:forEach>
			</tr>

			<tr>
				<td>Lunch</td>
				<c:forEach var="day"
					items="${['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']}">
					<td>
						<form method="GET" action="showMeal.do">
							<select name="mealId" required>
								<option value="" selected disabled hidden>Choose Meal</option>
								<c:forEach var="meal" items="${loggedInUser.userMeals}">
									<option value="${meal.id}">${meal.name}</option>
								</c:forEach>
							</select>
							<button type="submit" class="view-button">View</button>
						</form>
					</td>
				</c:forEach>
			</tr>

			<tr>
				<td>Dinner</td>
				<c:forEach var="day"
					items="${['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']}">
					<td>
						<form method="GET" action="showMeal.do">
							<select name="mealId" required>
								<option value="" selected disabled hidden>Choose Meal</option>
								<c:forEach var="meal" items="${loggedInUser.userMeals}">
									<option value="${meal.id}">${meal.name}</option>
								</c:forEach>
							</select>
							<button type="submit" class="view-button">View</button>
						</form>
					</td>
				</c:forEach>
			</tr>
		</tbody>
	</table>

</body>
</html>
