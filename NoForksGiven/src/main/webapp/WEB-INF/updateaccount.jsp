<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Update</title>
</head>
<h1>Account Update</h1>
<body>
<form action="updateAccount.do" method="POST">
    <input type="hidden" name="id" value="${loggedInUser.id}">
    
        <label for="username">Username:</label> <input type="text" id="username" name="username" size="20" placeholder="${loggedInUser.username}" required value="${loggedInUser.username}"><br>
       
        <label for="password">Password:</label> <input type="text" id="password" name="password" size="20" placeholder="${loggedInUser.password}" required value="${loggedInUser.password}"><br>
       
        <label for="email">Email:</label> <input type="text" id="email" name="email" size="20" placeholder="${loggedInUser.email}" required value="${loggedInUser.email}"><br>
		
		<label for="profileImage">Edit Profile Image URL:</label> <input type="text" id="profileImage" name="profileImage" size="100" placeholder="${loggedInUser.profileImage}" required value="${loggedInUser.profileImage}"><br>
		
		<label for="biography">Edit Biography:</label> <input type="text" id="biography" name="biography" size="100" placeholder="${loggedInUser.biography}" required value="${loggedInUser.biography}"><br>

		<button>Update</button>
</form>	
</body>
</html>