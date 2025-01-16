<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
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

    .error-container {
        text-align: center;
        max-width: 800px;
        margin: 50px auto;
        padding: 20px;
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    h1 {
        color: #D9534F;
        font-size: 2.5em;
        margin: 20px 0;
    }

    p {
        font-size: 1.2em;
        color: #555;
        margin: 10px 0;
    }

    .home-button {
        background-color: #296A4B;
        color: white;
        font-size: 1.1em;
        padding: 12px 20px;
        margin-top: 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
        transition: background-color 0.3s ease;
    }

    .home-button:hover {
        background-color: #2c6e48;
    }
</style>
</head>
<body>
<header>
    <p>Error Page</p>
</header>

<jsp:include page="navbar.jsp" />

<div class="error-container">
    <h1>Oops! Something went wrong.</h1>
    <p>We're sorry, but we couldn't process your request. Please try again later or contact support if the issue persists.</p>
    <a href="home.jsp" class="home-button">Return to Home</a>
</div>
</body>
</html>
