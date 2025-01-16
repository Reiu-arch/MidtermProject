<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan Details</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />
	
<c:choose>
<c:when test="${empty plan }">

<h1>Plan not found</h1>

</c:when>
<c:otherwise>
<h1>${plan.name}</h1>
<img src="${plan.imageUrl}">
<p>${plan.notes}</p>
<h3>Plan Meals</h3>
<c:forEach var="planMeal" items="${planMeals}">
<li>Day ${planMeal.dayNumber} : ${planMeal.meal.name} ${planMeal.mealType.name} ${planMeal.notes}</li>
<!--TODO remove plan from meal button  -->
</c:forEach>
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
								<form action="addMealToPlan.do" method="POST"
									style="display: inline;">
									<input type="hidden" name="meal.id" value="${meal.id}">
									<input type="hidden" name="plan.id" value="${plan.id}">
									<label for="dayNumber">Day Number</label>
									<input type="number" name="dayNumber">
									<label for="notes">Notes</label>
									<input type="text" name="notes">
									<select name="mealType.id">s
									<c:forEach var="mealType" items="${mealTypes}">
									<option value="${mealType.id}">${mealType.name}</option>
									
									</c:forEach>
									</select>
									<button type="submit" class="delete-button">
										Add Meal To Plan</button>
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