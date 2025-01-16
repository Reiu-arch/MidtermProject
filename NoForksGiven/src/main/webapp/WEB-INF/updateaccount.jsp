<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Update</title>
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
        padding: 20px;
        text-align: center;
    }

    header p {
        font-size: 1.5em;
        margin: 0;
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

    h1 {
        text-align: center;
        color: #296A4B;
        margin-top: 30px;
        font-size: 2.5em;
        font-family: 'Georgia', serif;
    }

    form {
        background-color: #ffffff;
        max-width: 600px;
        margin: 30px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    label {
        display: block;
        font-size: 1.1em;
        color: #296A4B;
        margin: 10px 0 5px;
    }

    input[type="text"] {
        width: 100%;
        padding: 10px;
        font-size: 1em;
        border: 1px solid #ddd;
        border-radius: 5px;
        box-sizing: border-box;
    }

    button {
        background-color: #D4B57F;
        color: white;
        font-size: 1.1em;
        padding: 12px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        width: 100%;
    }

    button:hover {
        background-color: #2c6e48;
    }
</style>
</head>
<body>
<header>
    <p>Account Update</p>
</header>

<jsp:include page="navbar.jsp" />

<h1>Update Your Account</h1>

<form action="updateAccount.do" method="POST">
    <input type="hidden" name="id" value="${loggedInUser.id}">
    
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" placeholder="${loggedInUser.username}" required value="${loggedInUser.username}">
    
    <label for="password">Password:</label>
    <input type="text" id="password" name="password" placeholder="${loggedInUser.password}" required value="${loggedInUser.password}">
    
    <label for="email">Email:</label>
    <input type="text" id="email" name="email" placeholder="${loggedInUser.email}" required value="${loggedInUser.email}">
    
    <label for="profileImage">Edit Profile Image URL:</label>
    <input type="text" id="profileImage" name="profileImage" placeholder="${loggedInUser.profileImage}" required value="${loggedInUser.profileImage}">
    
    <label for="biography">Edit Biography:</label>
    <input type="text" id="biography" name="biography" placeholder="${loggedInUser.biography}" required value="${loggedInUser.biography}">
    
    <button type="submit">Update</button>
</form>    
</body>
</html>
