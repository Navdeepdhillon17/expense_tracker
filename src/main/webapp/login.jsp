<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("expense");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Expense Tracker</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
        }

        body {
            background: #f8f9fa;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
        }

        .login-container {
            margin: 20px auto;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            background: white;
            border-radius: 12px;
            overflow: hidden;
            max-width: 1000px;
        }

        .login-left {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 20px 20px 0 30px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .login-right {
            padding: 40px;
        }

        .login-title {
            font-size: 26px;
            font-weight: 600;
            margin-bottom: 25px;
            color: var(--primary-dark);
        }

        .illustration {
            max-width: 100%;
            height: auto;
        }

        .btn-login {
            background-color: var(--primary);
            border: none;
            padding: 10px;
            font-weight: 500;
            transition: all 0.2s;
        }

        .btn-login:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .register-link {
            color: var(--primary);
            font-weight: 500;
        }

        .form-control:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.2);
        }

        @media (max-width: 768px) {
            .login-left {
                padding: 30px 20px;
                text-align: center;
            }

            .login-right {
                padding: 30px 20px;
            }

            .illustration {
                max-width: 80%;
                margin: 20px auto;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row login-container">
        <!-- Left Panel -->
        <div class="col-md-6 login-left">
            <h2 class="mb-3">Welcome to Expense Tracker</h2>
            <p>Track your expenses and manage your budget efficiently.</p>

            <img src="https://illustrations.popsy.co/amber/digital-nomad.svg"
                 alt="Expense tracking illustration"
                 class="illustration"
                 onerror="this.onerror=null;this.src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjZmZmIiBzdHJva2Utd2lkdGg9IjIiPjxwYXRoIGQ9Ik0xNiA3aDNhMiAyIDAgMDEyIDJ2OWEyIDIgMCAwMS0yIDJINWEyIDIgMCAwMS0yLTJWOGEyIDIgMCAwMTItMmgzbTAgMTBoNk0xMiA0YTIgMiAwIDExLTQgMCAyIDIgMCAwMTQgMHoiLz48L3N2Zz4='">
        </div>

        <!-- Right Panel -->
        <div class="col-md-6 login-right">
            <%
                if (session.getAttribute("user") != null) {
                    response.sendRedirect("expense");
                    return;
                }
            %>

            <% if (session.getAttribute("successMessage") != null) { %>
            <div class="alert alert-success">
                <%= session.getAttribute("successMessage") %>
            </div>
            <% session.removeAttribute("successMessage"); %>
            <% } %>

            <% if (request.getAttribute("errorMessage") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% request.removeAttribute("errorMessage"); %>
            <% } %>
            <div class="login-title">Login to Your Account</div>

            <form action="login" method="post">
                <div class="mb-3">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" name="username" id="username"
                           placeholder="Username"
                           value="<%= request.getAttribute("prevUsername") != null ? request.getAttribute("prevUsername") : "" %>"
                           required>

                </div>

                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>

                <button type="submit" class="btn btn-login btn-primary w-100 mb-3">Login</button>

                <p class="text-center">
                    Don't have an account? <a href="register.jsp" class="register-link">Register here</a>
                </p>
            </form>
        </div>
    </div>
</div>

</body>
</html>