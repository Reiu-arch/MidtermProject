<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Forks Given</title>
<style>
	
	body{
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f9f9f9;
	color: #333;
	}
	
	header {
	background-color: #296A4B;
	color: white;
	padding: 10px 20px;
	text-align: center;
	}
	
	header a {
	color: white;
	text-decoration: none;
	margin: 0 15px;
	font-weight: bold;
	}
	
	.hero-section {
	text-align: center;
	padding: 20px;
	}
	
	.hero-section {
	font-family: 'Georgia', serif;
	font-style: italic;
	}
	
	
</style>





















</head>
<body>
	<header>
	<jsp:include page="navbar.jsp"/>
	</header>
	<h1>No Forks Given</h1>
	<p>Why Fork Around. Just Eat</p>

	<form action="browseResults.do" method="GET">
		<fieldset>
			<label for="keyword"></label> 
			<input type="text" name="keyword" id="keyword" placeholder="Search"> 
		</fieldset>
	</form>
<p>
Craft your perfect meal plan with ease! Whether you're aiming to eat healthier, save time, or explore new flavors, our customizable meal planning tool has you covered. Select your favorite ingredients, dietary preferences, and portion sizes to create balanced, delicious meals tailored to your lifestyle. Say goodbye to food boredom and hello to stress-free dining!
</p>
<!-- "View All Recipes" Button -->
<a href="browseResults.do" class="button">View All Recipes</a>

<!-- Login Button -->
<a href="login.do" class="button">Login</a>

</body>
</html>