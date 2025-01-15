<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe</title>
</head>
<body>
	<jsp:include page="navbar.jsp" />

	<c:if test="${loggedInUser == recipe.user}">
		<h3>
			<c:out value="${loggedInUser.username}"></c:out>
		</h3>
		
		<a href="updateRecipe.do?recipeId=${recipe.id}">Update Recipe</a>
		 <form action="deleteRecipe.do" method="GET" class="action-form"
                  onsubmit="return window.confirm('Confirm Delete?');">
                <input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${recipe.id}' />">
                <button type="submit" class="delete-button">Delete Recipe</button>
            </form>

	</c:if>

	<ol>
		<li>${recipe.imageUrl}</li>
		<li>${recipe.name}</li>
		<li>${recipe.id}</li>
		<li>${recipe.description}</li>
		<li>${recipe.prepTimeMin}</li>
		<li>${recipe.cookTimeMin}</li>
		<li>${recipe.instructions}</li>
		<li>${recipe.servings}</li>
		<li>${recipe.difficulty}</li>
		<li>${recipe.ingredients}</li>
		<li>${recipe.user.username}</li>
		<li>${recipe.createDate}</li>
		<li>${recipe.lastUpdate}</li>
	</ol>


</body>
</html>