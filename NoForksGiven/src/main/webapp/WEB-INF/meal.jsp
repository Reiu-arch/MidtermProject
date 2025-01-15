<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Meal</title>
</head>
<body>
<h1>Meal Page</h1>
<!-- ************ user will edit or delete meal here AND add recipe -->

<ol>
<c:forEach var="meal" items="${loggedInUser.userMeals}">
<li>${meal.name}</li>
</c:forEach>
</ol>

<a href="browseResults.do" class="button">Add Recipes to Meal</a>
</body>
</html>