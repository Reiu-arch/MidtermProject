<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account Profile</title>
</head>
<body>

<jsp:include page="navbar.jsp"/>

<c:if test="${not empty sessionScope.loggedInUser}">
	<a href = "logout.do">Log Out</a>
</c:if>

<h2>Your Details</h2>
<c:choose>
<c:when test="${loggedInUser != null}">
	<h2>Welcome User Id:<c:out value = "${loggedInUser.id}"></c:out></h2>
	<h3>user name: <c:out value = "${loggedInUser.username}"></c:out></h3>
	
	<form action="createrecipe.do" method="GET" class="action-form">
                <input type="hidden" id="id" name="id" value="<c:out value='${loggedInUser.id}' />">
                <button type="submit" class="edit-button">Create New Recipe</button>
            </form>
</c:when>
	<c:otherwise>User not logged in</c:otherwise>
</c:choose>

</body>
</html>