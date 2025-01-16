<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Forks Given</title>
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

h1 {
    text-align: center;
    color: #296A4B;
    font-size: 3em;
    margin-top: 50px;
    font-family: 'Georgia', serif;
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

.search-section {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 20px;
}

.search-section form {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 10px 20px;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 100%;
    max-width: 500px;
}

.search-section input {
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 1em;
    margin-bottom: 10px;
    width: 100%;
}

.search-section button {
    padding: 12px 20px;
    background-color: #D4B57F;
    color: white;
    text-decoration: none;
    font-size: 1em;
    border-radius: 8px;
    transition: background-color 0.3s;
    width: 100%;
}

.search-section button:hover {
    background-color: #2c6e48;
}

.recipe-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    margin-top: 40px;
}

.recipe-item {
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    margin: 15px;
    padding: 20px;
    width: 250px;
    text-align: center;
}

.recipe-item img {
    width: 100%;
    height: auto;
    border-radius: 8px;
}

.recipe-item h3 {
    font-size: 1.3em;
    color: #296A4B;
    margin: 15px 0;
}

.recipe-item p {
    font-size: 1em;
    color: #555;
}

.recipe-item a {
    color: #296A4B;
    text-decoration: none;
    font-weight: bold;
    display: block;
    margin-top: 10px;
}

.recipe-item a:hover {
    text-decoration: underline;
}

@media (max-width: 768px) {
    .recipe-item {
        width: 100%;
        margin: 15px 0;
    }
}
</style>
</head>
<body>
    <header>
        <p>Our Recipes Your Choice!</p>
    </header>
    <h1>Recipes</h1>
    <jsp:include page="navbar.jsp"/>
    

    <div class="search-section">
        <form action="findRecipe.do" method="GET">
            <label for="keyword"></label>
            <input type="text" id="keyword" name="keyword" placeholder="Search By Keyword" value="${keyword}">
            <button type="submit">Search</button>
        </form>
    </div>


    <div class="recipe-list">
        <c:forEach var="recipe" items="${recipeList}">
            <div class="recipe-item">
                <img src="${recipe.imageUrl}" alt="${recipe.name}">
                <h3>
                <a href="Recipe.do?recipeId=${recipe.id}">${recipe.name}</a>
                </h3>
                <p>${recipe.description}</p>
                <p>Prep Time: ${recipe.prepTimeMin} minutes</p>
                <p>Cook Time: ${recipe.cookTimeMin} minutes</p>
                <a href="Recipe.do?recipeId=${recipe.id}">View Recipe</a>
            </div>
        </c:forEach>


        <c:if test="${empty recipeList}">
            <h2>No Results</h2>
        </c:if>
    </div>

</body>
</html>
