<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Meal</title>
</head>
<body>
<H2>Update Meal: ${meal.name}</H2>

<form action="updateMeal.do" method="POST">
    <input type="hidden" name="mealId" value="${meal.id}">
	
	<label for="name">Enter the meal name:</label><input type="text" id="name" name="name" placeholder="${meal.name}" required="required" value="${meal.name}"><br>
            
    <label for="notes">Notes:</label> <input type="text" id="notes" name="notes" size="80" placeholder="${meal.notes}" value="${meal.notes}"><br>

	<label for="imageUrl">Image Url:</label><input type="text" id="imageUrl" name="imageUrl" placeholder="${meal.imageUrl}" value="${meal.imageUrl}"><br>
            
    <label for="mealTypeId">Meal Type:</label> <input type="text" id="mealTypeId" name="mealTypeId.id" size="80" placeholder="${meal.mealTypeId.id}" value="${meal.mealTypeId.id}"><br>
<button>Update</button>
</form>

 
<c:forEach var="recipe" items="${meal.recipes}">
	<li>${recipe.name}</li>
		<form action="removeRecipe.do" method="POST" class="action-form"
 		onsubmit="return window.confirm('Confirm Delete?');">
        <input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${recipe.id}' />">
       <input type="hidden" id="mealId" name="mealId" value="<c:out value='${meal.id}' />">	
        <button type="submit" class="button">Remove Recipe</button>
 	   
 	    </form>
</c:forEach>


</body>
</html>