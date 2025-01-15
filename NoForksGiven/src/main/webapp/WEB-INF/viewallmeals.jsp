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
			<li><a href="meal.do?mealId=${meal.id}">${meal.name}</a> </li>

		</c:forEach>
	</ol>

</body>
</html>
