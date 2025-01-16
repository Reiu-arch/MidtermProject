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
	<form action="createPlan.do" method="POST" class="action-form">
	
		 	<label for="name">Enter the name for your plan:</label> <input
			type="text" id="name" name="name" size="50" required>
			

			<label for="notes">Enter your notes:</label> <textarea type="text"
			id="notes" name="notes" rows="5" cols="40"></textarea>
			
         	<label for="imageUrl">Enter the URL of your plan:</label> <input
			type="text" id="imageUrl" name="imageUrl">
			
       <button type="submit" class="button">Create Plan</button>
      </form>

</body>
</html>