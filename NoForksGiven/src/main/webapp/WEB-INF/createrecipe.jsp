<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Recipe</title>
</head>
<h1>Create Recipe</h1>
<body>
<form action="createrecipe.do" method="POST">
		<!-- <li>${recipe.userId} </li> hidden value tag -->
		<input type="hidden" name="user" value="${loggedInUser.id}">
		<!-- <li>${recipe.createDate} </li> This needs to be added inside of the controller -->
		<!-- <li>${recipe.lastUpdate} </li> This needs to be added inside of the controller -->

	
		<!-- <li>${recipe.imageUrl} </li> String (text) -->
		<label for="imageUrl">Enter the URL of your picture:</label> <input
			type="text" id="imageUrl" name="imageUrl" size="50" required><br>
		<!-- <li>${recipe.name} </li>String (text)-->
		<label for="name">Enter the recipe name:</label> <input
			type="text" id="name" name="name" size="20" required><br>
		<!--<li>${recipe.description} </li> String (text)-->
		<label for="description">Enter the description:</label> <input
			type="text" id="description" name="description" size="80" required><br>
		<!--<li>${recipe.prepTimeMin} </li> Number (DropDown) -->
		<label for="prepTimeMin">Enter the prep time in minutes:</label> <input
			type="number" id="prepTimeMin" name="prepTimeMin" required><br>
		<!--<li>${recipe.cookTimeMin} </li> Number (DropDown) -->
		<label for="cookTimeMin">Enter the cook time in minutes:</label> <input
			type="number" id="cookTimeMin" name="cookTimeMin" required><br>
		<!--<li>${recipe.instructions} </li> String -->
		<label for="instructions">Enter the recipe instructions:</label> <input
			type="text" id="instructions" name="instructions" size="100" required><br>
		<!--<li>${recipe.servings} </li> Number (DropDown) -->
		<label for="servings">Enter the serving size:</label> <input
			type="number" id="servings" name="servings" required><br>
		<!--<li>${recipe.difficulty} </li> String (radio) -->
		<input type="radio" id="difficulty" name="difficulty" value="Easy">
        <label for="difficulty"> Easy</label><br>
		<input type="radio" id="difficulty" name="difficulty" value="Medium">
        <label for="difficulty"> Medium</label><br>
		<input type="radio" id="difficulty" name="difficulty" value="Hard">
        <label for="difficulty"> Hard</label><br>
		<!--<li>${recipe.ingredients} </li> String (text) -->
		<label for="ingredients">Enter the recipe ingredients:</label> <input
			type="text" id="ingredients" name="ingredients" size="100" required><br>
		<button type="submit" class="add-button">Submit</button>
</form>
</body>
</html>