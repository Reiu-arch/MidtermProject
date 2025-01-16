<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="jakarta.tags.core" prefix="c"%> 
<jsp:include page="navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Plan Meal</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<form action="CreatePlanMeal.do" method="POST">

<label for="dayNumber">Choose the Day :</label>
	<select name="dayNumber" id ="dayNumber">
		<option value="" disabled selected>Choose the Day</option>
		<option value="1">Sunday</option>
		<option value="2">Monday</option>
		<option value="3">Tuesday</option>
		<option value="4">Wednesday</option>
		<option value="5">Thursday</option>
		<option value="6">Friday</option>
		<option value="7">Saturday</option>
	</select>
	
<label for="plan.id">Choose a Plan :</label>
	<select name="plan.id" id ="plan.id">
		<option value="" disabled selected>Choose a Plan</option>
		<c:forEach var="plan" items="${loggedInUser.plans}">
					<c:if test="${plan.enabled == true}">
						<option value="${plan.id}">${plan.name}</option>
					</c:if>
		</c:forEach>
	</select>	
	
<label for="meal.id">Choose a Meal :</label>
	<select name="meal.id" id ="meal.id">
		<option value="" disabled selected>Choose a Meal</option>
		<c:forEach var="meal" items="${loggedInUser.userMeals}">
					<c:if test="${meal.enabled == true}">
						<option value="${meal.id}">${meal.name}</option>
					</c:if>
		</c:forEach>
		<input type="hidden" id="mealTypeId" name="mealTypeId" value="${meal.mealTypeId}">
	</select>
	<button type="submit" class="button">Create Plan Meal</button>
	
			
			
</form>
</body>
</html>