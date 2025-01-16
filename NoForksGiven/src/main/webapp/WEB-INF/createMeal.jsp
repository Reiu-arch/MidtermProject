<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Meal</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<form action="createMeal.do" method="POST">

<label for="name">Enter the name:</label> <input
			type="text" id="name" name="name" size="50" required><br>

<label for="notes">Enter the notes:</label> <input
			type="text" id="notes" name="notes" size="50"><br>

<label for="imageUrl">Enter image url:</label> <input
			type="text" id="imageUrl" name="imageUrl" size="50"><br>

<label for="mealTypeId">Choose meal type:</label>
	<select name="mealTypeId.id" id ="mealTypeId">
		<option value="" disabled selected>Meal Types</option>
		<option value="1">Breakfast</option>
		<option value="2">Lunch</option>
		<option value="3">Dinner</option>
		<option value="4">Snack</option>
		<option value="5">Dessert</option>
	</select>
		<button onclick="return window.confirm('Confirm Add?');">SUBMIT </button>
		
		<c:if test="${not empty errorMessage}">
		<p>${errorMessage}</p>
		</c:if>
</form>
</body>
</html>