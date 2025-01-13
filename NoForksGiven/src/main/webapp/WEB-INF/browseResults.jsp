<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Forks Given</title>
</head>
<body>
<jsp:include page="homebutton.jsp"/>
<h1>Recipes</h1>

<c:forEach var="recipe" items="${recipeList}">
	<ol>
		<li>${recipe.imageUrl} </li>
		<li>${recipe.id} </li>
		<li>${recipe.name} </li>
		<li>${recipe.description} </li>
		<li>${recipe.prepTimeMin} </li>
		<li>${recipe.cookTimeMin} </li>
		<li>${recipe.instructions} </li>
		<li>${recipe.servings} </li>
		<li>${recipe.difficulty} </li>
		<li>${recipe.ingredients} </li>
		<li>${recipe.userId}</li>
		<li>${recipe.createDate} </li>
		<li>${recipe.lastUpdate} </li>
	</ol>

</c:forEach>

</body>
</html>
