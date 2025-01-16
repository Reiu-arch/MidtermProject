<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Plans</title>
</head>
<jsp:include page="navbar.jsp"/>
<body>
<h1>My Plans</h1>

<<<<<<< HEAD
<table>
<thead>
	<tr>
		<th></th>
		<th>Sunday</th>
		<th>Monday</th>
		<th>Tuesday</th>
		<th>Wednesday</th>
		<th>Thursday</th>
		<th>Friday</th>
		<th>Saturday</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>Breakfast</td>
		<td><select name="mealId">
		<option value="" selected disabled hidden>Choose Meal</option>
		<c:forEach var="meal" items="${loggedInUser.userMeals}">
        		<option value="${meal.id}">${meal.name}</option>
        </c:forEach><br>
		<c:forEach var="meal" items="${loggedInUser.userMeals}">
        		<option value="${meal.id}">${meal.name}</option>
        </c:forEach>
		</select>
		<td>
	
	</tr>







</tbody>


</table>


=======
>>>>>>> abc037d7c1854f073dddcdb765030d5ad79f022b

</body>
</html>