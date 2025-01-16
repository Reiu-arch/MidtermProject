<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Plans</title>
</head>
<jsp:include page="navbar.jsp"/>
<body>

<h1>Create Plans</h1>
	<form action="createPlanMeal.do" method="GET" class="action-form">
                <input type="hidden" id="id" name="id" value="<c:out value='${loggedInUser.id}' />">
                <button type="submit" class="button">Create Plan Meal</button>
            </form>

</body>
</html>