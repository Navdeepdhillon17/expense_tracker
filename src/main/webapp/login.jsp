<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background: #1e3a8a; /* Dark blue background */
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
        .register-link {
            margin-top: 10px;
            display: block;
            color: #1e3a8a;
            text-decoration: none;
        }
        .register-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Login</h2>
    <% String successMessage = (String) session.getAttribute("successMessage"); %>
    <% if (successMessage != null) { %>
    <p style="color: green; font-weight: bold;"><%= successMessage %></p>
    <% session.removeAttribute("successMessage"); %> <!-- Clear message after showing -->
    <% } %>


    <% String errorMessage = (String) session.getAttribute("errorMessage"); %>
    <% if (errorMessage != null) { %>
    <p class="error"><%= errorMessage %></p>
    <% session.removeAttribute("errorMessage"); %>
    <% } %>

    <form action="login" method="post">
        <label for="username"></label><input type="text" name="username" id="username" placeholder="Username" required>
        <label for="password"></label><input type="password" name="password" id="password" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>

    <p>New user? <a href="register.jsp" class="register-link">Register here</a></p>
</div>
</body>
</html>
