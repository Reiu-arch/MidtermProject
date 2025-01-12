<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>No Forks Given</title>
</head>
<body>

	<h1>No Forks Given</h1>
	<p>Why Fork Around. Just Eat</p>

	<form action="browseResults.do" method="GET">
		<fieldset>
			<label for="keyword"></label> 
			<input type="text" name="keyword" id="keyword" placeholder="Search"> 
		</fieldset>
	</form>

<!-- "View All Recipes" Button -->
<a href="browseResults.do" class="button">View All Recipes</a>

<!-- Login Button -->
<a href="login.do" class="button">Login</a>

</body>
</html>