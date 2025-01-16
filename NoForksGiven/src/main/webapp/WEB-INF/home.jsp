<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.hero-section {
	text-align: center;
	padding: 40px 20px;
	background-color: #E5F4ED;
	font-family: 'Georgia', serif;
	font-style: italic;
	margin-top: 20px;
}

.hero-section h1 {
	font-size: 3.5em;
	color: #296A4B;
	margin-bottom: 10px;
}

.hero-section p {
	font-size: 1.2em;
	color: #555;
	margin-bottom: 30px;
}

.search-section {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.search-section form {
	display: flex;
	align-items: center;
	padding: 10px 20px;
	background-color: white;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.search-section input {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 1em;
	margin-right: 15px;
	width: 250px;
}

.search-section a {
	padding: 12px 20px;
	background-color: #D4B57F;
	color: white;
	text-decoration: none;
	font-size: 1em;
	border-radius: 8px;
	transition: background-color 0.3s;
}

.search-section a:hover {
	background-color: #2c6e48;
}

.content {
	text-align: center;
	padding: 30px;
	margin-top: 40px;
	font-size: 1.1em;
	color: #444;
	line-height: 1.6;
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

.tagline {
	font-size: 1.5em;
	font-weight: bold;
	color: #D4B57F;
	text-align: center;
	margin-top: 20px;
	font-family: 'Georgia', serif;
	letter-spacing: 1px;
}

.welcome {
	font-size: 1.2em;
	color: #555;
	text-align: center;
	padding: 15px 30px;
	line-height: 1.8;
	margin-top: 20px;
	font-style: italic;
	font-family: 'Arial', sans-serif;
}

.image-banner {
	width: 100%;
	text-align: center;
	margin-top: 30px;
	overflow: hidden;
}

.image-banner img {
	width: 100%;
	height: auto;
	border-radius: 8px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

@media ( max-width : 768px) {
	.image-banner img {
		width: 100%;
	}
}
</style>

</head>
<body>
	<header>
		<p>Our Recipes Your Choice!</p>
	</header>
	<h1>No Forks Given</h1>
	<jsp:include page="navbar.jsp" />
	<p class="tagline">Why Fork Around. Just Eat</p>

	<form action="browseResults.do" method="GET" class="search-section">
		<fieldset>
			<label for="keyword"></label> <input type="text" name="keyword"
				id="keyword" placeholder="Search"> <a
				href="browseResults.do" class="view-all">View All Recipes</a>
		</fieldset>
	</form>
	
	<div class="image-banner">
		<img
			src="https://v.cdn.ww.com/media/system/cms/au/WeightWatchers_ZeroPoint_food_categories.png"
			alt="Zero Point Food Categories">
	</div>


	<p class="welcome">Craft your perfect meal plan with ease! Whether
		you're aiming to eat healthier, save time, or explore new flavors, our
		customizable meal planning tool has you covered. Select your favorite
		ingredients, dietary preferences, and portion sizes to create
		balanced, delicious meals tailored to your lifestyle. Say goodbye to
		food boredom and hello to stress-free dining!</p>
</body>
</html>
