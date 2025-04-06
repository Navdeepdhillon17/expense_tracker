<%--<%@ page contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ page language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Register</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            background: #1e3a8a;--%>
<%--            color: white;--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh;--%>
<%--            margin: 0;--%>
<%--        }--%>
<%--        .container {--%>
<%--            background: #ffffff;--%>
<%--            color: #333;--%>
<%--            padding: 2rem;--%>
<%--            border-radius: 10px;--%>
<%--            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);--%>
<%--            width: 320px;--%>
<%--            text-align: center;--%>
<%--        }--%>
<%--        h2 {--%>
<%--            margin-bottom: 1rem;--%>
<%--            color: #1e3a8a;--%>
<%--        }--%>
<%--        input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            margin: 8px 0;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--            font-size: 16px;--%>
<%--        }--%>
<%--        .error {--%>
<%--            color: red;--%>
<%--            font-weight: bold;--%>
<%--        }--%>
<%--        button {--%>
<%--            background: #1e3a8a;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            padding: 10px;--%>
<%--            width: 100%;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            font-size: 16px;--%>
<%--        }--%>
<%--        button:hover {--%>
<%--            background: #152c70;--%>
<%--        }--%>
<%--        .login-link {--%>
<%--            margin-top: 10px;--%>
<%--            display: block;--%>
<%--            color: #1e3a8a;--%>
<%--            text-decoration: none;--%>
<%--        }--%>
<%--        .login-link:hover {--%>
<%--            text-decoration: underline;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h2>Register</h2>--%>

<%--    <% if (session.getAttribute("successMessage") != null) { %>--%>
<%--    <div class="alert alert-success">--%>
<%--        <%= session.getAttribute("successMessage") %>--%>
<%--    </div>--%>
<%--    <% session.removeAttribute("successMessage"); %>--%>
<%--    <% } %>--%>

<%--    <% if (session.getAttribute("errorMessage") != null) { %>--%>
<%--    <div class="alert alert-error">--%>
<%--        <%= session.getAttribute("errorMessage") %>--%>
<%--    </div>--%>
<%--    <% session.removeAttribute("errorMessage"); %>--%>
<%--    <% } %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Expense Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa, #e9ecef);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .register-container {
            margin: 20px auto;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            background: white;
            border-radius: 15px;
            overflow: hidden;
            max-width: 500px;
            width: 100%;
        }

        .register-header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 25px;
            text-align: center;
            position: relative; /* Add this */
            z-index: 1; /* Add this */
        }
        .register-body {
            padding: 30px;
        }

        .register-title {
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 25px;
            color: var(--primary-dark);
            text-align: center;
        }

        .form-control {
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.25rem rgba(37, 99, 235, 0.25);
        }

        .btn-register {
            background-color: var(--primary);
            border: none;
            padding: 12px;
            font-weight: 500;
            transition: all 0.3s;
            width: 100%;
        }

        .btn-register:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .login-link {
            color: var(--primary);
            font-weight: 500;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-block;
            margin-top: 15px;
        }

        .login-link:hover {
            color: var(--primary-dark);
            text-decoration: underline;
        }

        .alert {
            border-radius: 8px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="register-container">
        <!-- Header -->
        <div class="register-header">
            <div class="text-center mb-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="60" height="60" fill="#fff" viewBox="0 0 24 24">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                </svg>
            </div>

            <h2>Create Your Account</h2>
            <p>Join Expense Tracker to start managing your finances</p>
        </div>

        <!-- Body -->
        <div class="register-body">
            <div class="register-title">Sign Up</div>

            <% if (session.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success">
                <%= session.getAttribute("successMessage") %>
            </div>
            <% session.removeAttribute("successMessage"); %>
            <% } %>

            <% if (session.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger">
                <%= session.getAttribute("errorMessage") %>
            </div>
            <% session.removeAttribute("errorMessage"); %>
            <% } %>

            <form action="register" method="post">
                <div class="mb-3">
                    <input type="text" class="form-control" name="username" id="username" placeholder="Username" required>
                </div>

                <div class="mb-3">
                    <input type="email" class="form-control" name="email" id="email" placeholder="Email" required>
                </div>

                <div class="mb-3">
                    <input type="password" class="form-control" name="password" id="password" placeholder="Password" required>
                </div>

                <button type="submit" class="btn btn-primary btn-register">Create Account</button>

                <div class="text-center mt-3">
                    <p>Already have an account? <a href="login.jsp" class="login-link">Sign in here</a></p>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


<%--    <form action="register" method="post">--%>
<%--        <label for="username"></label><input type="text" name="username" id="username" placeholder="Username" required>--%>
<%--        <label for="password"></label><input type="password" name="password" id="password" placeholder="Password" required>--%>
<%--        <label for="email"></label><input type="email" name="email" id="email" placeholder="Email" required>--%>
<%--        <button type="submit">Register</button>--%>
<%--    </form>--%>

<%--    <p>Already have an account? <a href="login.jsp" class="login-link">Login here</a></p>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
