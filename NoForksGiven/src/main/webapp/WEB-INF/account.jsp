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

<jsp:include page="homebutton.jsp"/>

<h2>Your Details</h2>
<c:choose>
<c:when test="${loggedInUser != null}">
	<h2>Welcome User Id:<c:out value = "${loggedInUser.id}"></c:out></h2>
	<h3>First Name: <c:out value = "${loggedInUser.username}"></c:out></h3>
</c:when>
	<c:otherwise>User not logged in</c:otherwise>
</c:choose>

</body>
</html>