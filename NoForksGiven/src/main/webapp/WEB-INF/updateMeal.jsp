<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Meal</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            color: #333;
        }

        header {
            background-color: #296A4B;
            color: white;
            padding: 20px 40px;
            text-align: center;
        }

        header p {
            font-size: 1.2em;
            font-weight: bold;
            margin: 0;
        }

        h2 {
            text-align: center;
            color: #296A4B;
            font-size: 3em;
            margin-top: 50px;
            font-family: 'Georgia', serif;
        }

        .form-section {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
        }

        .form-section form {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 30px 40px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        .form-section input, .form-section select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            margin-bottom: 15px;
            width: 100%;
        }

        .form-section button {
            background-color: #D4B57F;
            color: white;
            border: none;
            font-size: 1.1em;
            transition: background-color 0.3s;
            cursor: pointer;
            padding: 10px;
            width: 100%;
        }

        .form-section button:hover {
            background-color: #2c6e48;
        }

        .recipe-actions {
            margin-top: 40px;
            text-align: center;
        }

        .recipe-item {
            background-color: white;
            padding: 15px;
            margin: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .recipe-item p {
            font-size: 1.2em;
            color: #296A4B;
        }

        .button {
            background-color: #D4B57F;
            color: white;
            border: none;
            padding: 8px 15px;
            font-size: 1em;
            cursor: pointer;
            border-radius: 8px;
        }

        .button:hover {
            background-color: #2c6e48;
        }

        nav {
            background-color: white;
            border-top: 3px solid #296A4B;
            border-bottom: 3px solid #296A4B;
            padding: 10px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        nav a {
            color: #296A4B;
            text-decoration: none;
            font-size: 1.1em;
            margin: 0 20px;
            font-weight: bold;
        }

        footer {
            background-color: #296A4B;
            color: white;
            text-align: center;
            padding: 20px 0;
            position: fixed;
            width: 100%;
            bottom: 0;
        }

        footer a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>

<<<<<<< HEAD
	<jsp:include page="navbar.jsp" />

	<h2>Update Meal: ${meal.name}</h2>

	<form action="updateMeal.do" method="POST">
		<input type="hidden" name="mealId" value="${meal.id}"> <label
			for="name">Enter the meal name:</label> <input type="text" id="name"
			name="name" placeholder="${meal.name}" required="required"
			value="${meal.name}"><br> <label for="notes">Notes:</label>
		<input type="text" id="notes" name="notes" size="80"
			placeholder="${meal.notes}" value="${meal.notes}"><br> <label
			for="imageUrl">Image Url:</label> <input type="text" id="imageUrl"
			name="imageUrl" placeholder="${meal.imageUrl}"
			value="${meal.imageUrl}"><br> <label for="mealTypeId">Choose
			meal type:</label> <select name="mealTypeId.id" id="mealTypeId">
			<option value="1"
				<c:if test='${meal.mealTypeId.id =="1"}'>selected</c:if>>Breakfast</option>
			<option value="2"
				<c:if test='${meal.mealTypeId.id =="2"}'>selected</c:if>>Lunch</option>
			<option value="3"
				<c:if test='${meal.mealTypeId.id =="3"}'>selected</c:if>>Dinner</option>
			<option value="4"
				<c:if test='${meal.mealTypeId.id =="4"}'>selected</c:if>>Snack</option>
			<option value="5"
				<c:if test='${meal.mealTypeId.id =="5"}'>selected</c:if>>Dessert</option>
		</select>

		<button>Update Meal</button>
	</form>

	<div class="recipe-actions">
		<c:forEach var="recipe" items="${meal.recipes}">
			<div class="recipe-item">
				<p>${recipe.name}</p>
				<form action="removeRecipe.do" method="POST" class="action-form"
					onsubmit="return window.confirm('Confirm Delete?');">
					<input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${recipe.id}' />"> 
					
					<input type="hidden" id="mealId" name="mealId" value="<c:out value='${meal.id}' />">
					
					<button type="submit" class="button">Remove Recipe</button>
				</form>
			</div>
		</c:forEach>
	</div>
=======
    <header>
        <p>Meal Update</p>
    </header>

    <h2>Update Meal: ${meal.name}</h2>

    <jsp:include page="navbar.jsp" />

    <div class="form-section">
        <form action="updateMeal.do" method="POST">
            <input type="hidden" name="mealId" value="${meal.id}">
            
            <label for="name">Enter the meal name:</label>
            <input type="text" id="name" name="name" placeholder="${meal.name}" required="required" value="${meal.name}">
            
            <label for="notes">Notes:</label>
            <input type="text" id="notes" name="notes" size="80" placeholder="${meal.notes}" value="${meal.notes}">
            
            <label for="imageUrl">Image Url:</label>
            <input type="text" id="imageUrl" name="imageUrl" placeholder="${meal.imageUrl}" value="${meal.imageUrl}">
            
            <label for="mealTypeId">Choose meal type:</label>
            <select name="mealTypeId.id" id="mealTypeId">
                <option value="1" <c:if test='${meal.mealTypeId.id =="1"}'>selected</c:if>>Breakfast</option>
                <option value="2" <c:if test='${meal.mealTypeId.id =="2"}'>selected</c:if>>Lunch</option>
                <option value="3" <c:if test='${meal.mealTypeId.id =="3"}'>selected</c:if>>Dinner</option>
                <option value="4" <c:if test='${meal.mealTypeId.id =="4"}'>selected</c:if>>Snack</option>
                <option value="5" <c:if test='${meal.mealTypeId.id =="5"}'>selected</c:if>>Dessert</option>
            </select>

            <button>Update Meal</button>
        </form>
    </div>

    <div class="recipe-actions">
        <c:forEach var="recipe" items="${meal.recipes}">
            <div class="recipe-item">
                <p>${recipe.name}</p>
                <form action="removeRecipe.do" method="POST" class="action-form" onsubmit="return window.confirm('Confirm Delete?');">
                    <input type="hidden" id="recipeId" name="recipeId" value="<c:out value='${recipe.id}' />">
                    <input type="hidden" id="mealId" name="mealId" value="<c:out value='${meal.id}' />">
                    <button type="submit" class="button">Remove Recipe</button>
                </form>
            </div>
        </c:forEach>
    </div>
>>>>>>> 98bb5e165c0518cad184dfa5c083bba47bb348a6

</body>
</html>
