<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Recipe</title>
</head>
<jsp:include page="navbar.jsp"/>
<h1>Update Recipe</h1>
<body>
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
		
				<label for="difficulty">Difficulty: </label>
				
		
				<label for="difficulty">Easy</label><input type="radio" id="easy" name="difficulty" value="Easy"
				<c:if test='${recipe.difficulty == "Easy"}'>checked</c:if>>

        
        		<label for="difficulty">Medium</label><input type="radio" id="medium" name="difficulty" value="Medium"
				<c:if test='${recipe.difficulty == "Medium"}'>checked</c:if>>

        
        
        		<label for="difficulty">Hard</label><input type="radio" id="hard" name="difficulty" value="Hard"
      			<c:if test='${recipe.difficulty == "Hard"}'>checked</c:if>><br>

		<label for="ingredients">Recipe ingredients:</label><input type="text" id="ingredients" name="ingredients" size="100" placeholder="${recipe.ingredients}" required value="${recipe.ingredients}"><br>
		<button>Update</button>
</form>	
	</body>
	</html>