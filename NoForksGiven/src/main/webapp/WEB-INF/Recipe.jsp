<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe</title>
</head>
<body>
	<jsp:include page="navbar.jsp"/>
	

<c:choose>
<c:when test="${loggedInUser == recipe.user}">
	<h3> <c:out value = "${loggedInUser.username}"></c:out></h3>
<form action="updateRecipe.do" method="POST">
    <input type="hidden" name="id" value="${recipe.id}">

		<strong>Recipe Name:</strong> ${recipe.name} <br><label for="name">Enter the recipe name:</label><input type="text" id="name" name="name" placeholder="${recipe.name}" required="required" value="${recipe.name}"><br>
            
        <label for="description">Description:</label> <input type="text" id="description" name="description" size="80" placeholder="${recipe.description}" required value="${recipe.description}"><br>
		<!--<li>${recipe.prepTimeMin} </li> Number (DropDown) -->
		<label for="prepTimeMin">Prep-time in minutes:</label> <input type="number" id="prepTimeMin" name="prepTimeMin" placeholder="${recipe.prepTimeMin}" required value="${recipe.prepTimeMin}"><br>
		<!--<li>${recipe.cookTimeMin} </li> Number (DropDown) -->
		<label for="cookTimeMin">Cook time in minutes:</label> <input type="number" id="cookTimeMin" name="cookTimeMin" placeholder="${recipe.cookTimeMin}" required value="${recipe.cookTimeMin}"><br>
		<!--<li>${recipe.instructions} </li> String -->
		<label for="instructions">Recipe instructions:</label> <input type="text" id="instructions" name="instructions" size="100" placeholder="${recipe.instructions}" required value="${recipe.instructions}"><br>
		<!--<li>${recipe.servings} </li> Number (DropDown) -->
		<label for="servings">Serving size:</label> <input type="number" id="servings" name="servings" placeholder="${recipe.servings}" required value="${recipe.servings}"><br>
		<!--<li>${recipe.difficulty} </li> String (radio) -->
		
				<label for="difficulty">Difficulty:</label><input type="radio" id="easy" name="difficulty" placeholder="" value="${recipe.difficulty}">
		
		<label for="difficulty">Easy</label><input type="radio" id="easy" name="difficulty"
				<c:if test="${recipe.difficulty.contains('Easy')}">checked</c:if>
				value="Easy">
        
        		<label for="difficulty">Medium</label><input type="radio" id="medium" name="difficulty" value="Medium">
				<c:if test="${recipe.difficulty.contains('Medium')}"> checked="checked" </c:if>
        
        
        		<label for="difficulty">Hard</label><input type="radio" id="hard" name="difficulty" value="Hard"
      			<c:if test="${recipe.difficulty.contains('Hard')}">checked</c:if>><br>

		<label for="ingredients">Recipe ingredients:</label><input type="text" id="ingredients" name="ingredients" size="100" placeholder="${recipe.ingredients}" required value="${recipe.ingredients}"><br>
		<button>Update</button>
	
	
</form>	
</c:when>
	<c:otherwise>
	<ol>
		<li>${recipe.imageUrl} </li>
		<li>${recipe.name}</li>
		<li>${recipe.id} </li>
		<li>${recipe.description} </li>
		<li>${recipe.prepTimeMin} </li>
		<li>${recipe.cookTimeMin} </li>
		<li>${recipe.instructions} </li>
		<li>${recipe.servings} </li>
		<li>${recipe.difficulty} </li>
		<li>${recipe.ingredients} </li>
		<li>${recipe.user.username} </li>
		<li>${recipe.createDate} </li>
		<li>${recipe.lastUpdate} </li>
</ol>
	</c:otherwise>
</c:choose>

</body>
</html>