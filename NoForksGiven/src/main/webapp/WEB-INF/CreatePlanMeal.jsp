<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="navbar.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Plan Meal</title>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<form action="CreatePlanMeal.do" method="POST">

<label for="dayNumber">Choose the Day :</label>
	<select name="dayNumber" id ="dayNumber">
		<option value="" disabled selected>Choose the Day</option>
		<option value="1">Sunday</option>
		<option value="2">Monday</option>
		<option value="3">Tuesday</option>
		<option value="4">Wednesday</option>
		<option value="5">Thursday</option>
		<option value="6">Friday</option>
		<option value="7">Saturday</option>
	</select>
	<button type="submit" class="button">Create Plan Meal</button>
	
			
			
</form>
</body>
</html>