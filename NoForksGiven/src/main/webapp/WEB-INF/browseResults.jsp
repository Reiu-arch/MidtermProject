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
<jsp:include page="navbar.jsp"/>
<h1>Recipes</h1>
<form action="findRecipe.do" method="GET" class="action-form">
<label for="keyword">Search Recipes:</label>
                <input type="text" id="keyword" name="keyword" placeholder="Search"
                value = "${keyword }">
                <button type="submit">Search</button>
            </form>



<c:forEach var="recipe" items="${recipeList}">
	<ol>
		<li><img src="${recipe.imageUrl}"/></li>
		<li>${recipe.id} </li>
		<li><a href="Recipe.do?recipeId=${recipe.id}">${recipe.name}</a> </li>
		<li>${recipe.description} </li>
		<li>${recipe.prepTimeMin} </li>
		<li>${recipe.cookTimeMin} </li>
		<li>${recipe.enabled} </li>
	</ol>

</c:forEach>
<c:if test="${empty recipeList }">
<h2>No Results</h2>
</c:if>
</body>
</html>
