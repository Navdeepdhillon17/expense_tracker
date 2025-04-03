<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Tracker</title>
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
            text-align: center;
        }
        .container {
            background: #ffffff;
            color: #333;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            width: 400px;
        }
        h1 {
            color: #1e3a8a;
        }
        p {
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            background: #1e3a8a;
            color: white;
            padding: 10px 15px;
            margin: 10px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 16px;
        }
        .btn:hover {
            background: #152c70;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to Expense Tracker</h1>
    <p>Manage your expenses easily & efficiently.</p>
    <a href="login.jsp" class="btn">Login</a>
    <a href="register.jsp" class="btn">Register</a>
</div>
</body>
</html>
