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
			
<label for="mealTypeId">Enter meal type Id (1: breakfast):</label> <input
			type="text" id="mealTypeId" name="mealTypeId.id" size="50"><br>

		<button onclick="return window.confirm('Confirm Add?');">SUBMIT </button>
		
		<c:if test="${not empty errorMessage}">
		<p>${errorMessage}</p>
		</c:if>
</form>
</body>
</html>