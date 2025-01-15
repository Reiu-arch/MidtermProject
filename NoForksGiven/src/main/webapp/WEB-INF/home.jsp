<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Forks Given</title>
</head>
<jsp:include page="navbar.jsp"/>
<body>

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