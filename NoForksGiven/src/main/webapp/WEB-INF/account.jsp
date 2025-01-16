<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>
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
	margin-top: 40px;
	font-family: 'Georgia', serif;
}

h3 {
	color: #296A4B;
	font-size: 1.4em;
	margin: 10px 0;
	font-family: 'Georgia', serif;
}

.profile-img {
	display: block;
	margin: 20px auto;
	max-width: 200px;
	border-radius: 50%;
	object-fit: cover;
}

.profile-details {
	text-align: center;
	font-family: 'Georgia', serif;
}

.profile-actions {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.profile-actions form {
	margin: 10px;
}

.profile-actions button {
	background-color: #D4B57F;
	color: white;
	font-size: 1.1em;
	padding: 12px 20px;
	margin: 10px;
	border: none;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s;
	width: 250px;
}

.profile-actions button:hover {
	background-color: #2c6e48;
}

.meal-list {
	text-align: center;
	margin-top: 40px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	margin-bottom: 40px;
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

.meal-list form {
	margin: 0;
	display: inline-block;
}

.delete-button {
	background-color: #df4e4e;
	color: white;
	padding: 8px 16px;
	border-radius: 8px;
	border: none;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.delete-button:hover {
	background-color: #e13c3c;
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
</style>
</head>
<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>

	<jsp:include page="navbar.jsp" />

	<h2>WELCOME BACK</h2>
	<c:choose>
		<c:when test="${not empty sessionScope.loggedInUser}">
			<div class="profile-details">
				<a href="logout.do"
					style="color: #296A4B; font-size: 1.1em; text-align: center; display: block; margin: 20px 0;">Log
					Out</a>
				<h3>
					Welcome:
					<c:out value="${loggedInUser.username}" />
				</h3>
				<h3>
					User Id:
					<c:out value="${loggedInUser.id}" />
				</h3>
				<img src="${loggedInUser.profileImage}" alt="Profile Image"
					class="profile-img" />
			</div>

			<div class="profile-actions">

				<form action="createrecipe.do" method="GET">
					<input type="hidden" id="id" name="id"
						value="<c:out value='${loggedInUser.id}' />">
					<button type="submit" class="edit-button">Create New
						Recipe</button>
				</form>

				<form action="createMeal.do" method="GET">
					<input type="hidden" id="id" name="id"
						value="<c:out value='${loggedInUser.id}' />">
					<button type="submit" class="edit-button">Create New Meal</button>
				</form>

				<form action="viewallmeals.do" method="GET">
					<input type="hidden" id="id" name="id"
						value="<c:out value='${loggedInUser.id}' />">
					<button type="submit" class="edit-button">View Meals</button>
				</form>
				
				<form action="updateAccount.do" method="GET">
					<input type="hidden" id="id" name="id"
						value="<c:out value='${loggedInUser.id}' />">
					<button type="submit" class="edit-button">Edit Account</button>
				</form>

				<form action="deleteAccount.do" method="GET"
					onsubmit="return window.confirm('Confirm Deletion of your Account?');">
					<input type="hidden" id="userId" name="userId"
						value="<c:out value='${loggedInUser.id}' />">
					<button type="submit" class="delete-button">Delete Account</button>
					
				</form>
			</div>

			<div class="meal-list">

				<h3>
					Your Meals <a href="viewallmeals.do"
						style="color: #296A4B; font-size: 1.1em; margin-left: 20px;">View
						All Meals</a>
				</h3>
				<ul>
					<c:forEach var="meal" items="${loggedInUser.userMeals}">
						<c:if test="${meal.enabled == true }">
							<li>${meal.name}
								<form action="deleteMeal.do" method="GET"
									style="display: inline;">
									<input type="hidden" name="mealId" value="${meal.id}">
									<button type="submit" class="delete-button"
										onclick="return window.confirm('Are you sure you want to delete this meal?');">
										Delete Meal</button>
								</form>
							</li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

			<div class="meal-list">
				<h3>Your Plans</h3>
				<ul>
					<c:forEach var="plan" items="${loggedInUser.plans}">
						<c:if test="${plan.enabled == true }">
							<li><a href="planDetails.do?planId=${plan.id}">${plan.name}</a>
								<form action="deletePlan.do" method="GET"
									style="display: inline;">
									<input type="hidden" name="planId" value="${plan.id}">
									<button type="submit" class="delete-button"
										onclick="return window.confirm('Are you sure you want to delete this plan?');">
										Delete Plan</button>
								</form></li>
						</c:if>
					</c:forEach>
				</ul>
			</div>

    <%-- <h3>Your Meals
        <a href="viewallmeals.do" style="color: #296A4B; font-size: 1.1em; margin-left: 20px;">View All Meals</a>
    </h3>
    <ul>
        <c:forEach var="meal" items="${loggedInUser.userMeals}">
            <c:if test="${meal.enabled == true }">
                <li>
                    ${meal.name}
                    <form action="deleteMeal.do" method="GET" style="display:inline;">
                        <input type="hidden" name="mealId" value="${meal.id}">
                        <button type="submit" class="delete-button" onclick="return window.confirm('Are you sure you want to delete this meal?');">
                            Delete Meal
                        </button>
                    </form>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div> --%>


		</c:when>

		<c:otherwise>
			<h3>User not logged in</h3>
		</c:otherwise>
	</c:choose>

</body>
</html>
