<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body {
            background: #1e3a8a;
            color: white;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background: #ffffff;
            color: #333;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 320px;
            text-align: center;
        }
        h2 {
            margin-bottom: 1rem;
            color: #1e3a8a;
        }
        input {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        .error {
            color: red;
            font-weight: bold;
        }
        button {
            background: #1e3a8a;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background: #152c70;
        }
        .login-link {
            margin-top: 10px;
            display: block;
            color: #1e3a8a;
            text-decoration: none;
        }
        .login-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Register</h2>

    <% String errorMessage = (String) session.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <p style="color: red; font-weight: bold;"><%= errorMessage %></p>
    <% session.removeAttribute("errorMessage"); %>
    <% } %>

    <form action="register" method="post">
        <label for="username"></label><input type="text" name="username" id="username" placeholder="Username" required>
        <label for="password"></label><input type="password" name="password" id="password" placeholder="Password" required>
        <label for="email"></label><input type="email" name="email" id="email" placeholder="Email" required>
        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp" class="login-link">Login here</a></p>
</div>
</body>
</html>
