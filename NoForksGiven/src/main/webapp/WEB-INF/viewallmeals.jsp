<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Available Meals</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

	<ol>
		<c:forEach var="meal" items="${mealList}">
			<li>
			<form action="showMeal.do" method="GET" class="action-form">
                <input type="hidden" id="mealId" name="mealId" value="${meal.id}">
                <button type="submit" class="edit-button">View</button> </form> ${meal.name} </li>

		</c:forEach>
	</ol>

</body>
</html>
