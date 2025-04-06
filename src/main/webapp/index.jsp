<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker | Simple Money Management</title>
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --secondary: #f59e0b;
            --light: #f8fafc;
            --dark: #1e293b;
            --gray: #64748b;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, sans-serif;
            background: linear-gradient(135deg, #1e3a8a, #3b82f6);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            color: var(--dark);
            line-height: 1.6;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 1000px;
            padding: 2rem;
        }

        .hero-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            width: 100%;
            display: grid;
            grid-template-columns: 1fr 1fr;
        }

        .hero-content {
            padding: 3rem;
        }

        .hero-image {
            background: linear-gradient(to bottom right, #eff6ff, #dbeafe);
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem;
        }

        .hero-image img {
            width: 100%;
            max-width: 350px;
            height: auto;
        }

        .logo {
            display: flex;
            align-items: center;
            margin-bottom: 1.5rem;
        }

        .logo-icon {
            font-size: 2.5rem;
            margin-right: 1rem;
            color: var(--primary);
        }

        h1 {
            font-size: 2.5rem;
            margin: 0 0 1rem 0;
            color: var(--primary-dark);
            line-height: 1.2;
        }

        .tagline {
            font-size: 1.25rem;
            color: var(--gray);
            margin-bottom: 2rem;
            font-weight: 500;
        }

        .features {
            margin: 2rem 0;
        }

        .feature-item {
            display: flex;
            align-items: center;
            margin-bottom: 1rem;
        }

        .feature-icon {
            width: 24px;
            height: 24px;
            background-color: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .btn {
            padding: 0.5rem 0.6rem;
            border-radius: 8px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-block;
            text-align: center;
            flex: 1;
            min-width: 120px;
        }

        .btn-primary {
            background-color: var(--primary);
            color: white;
            border: 2px solid var(--primary);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-secondary {
            background-color: white;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-secondary:hover {
            background-color: #f8fafc;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .hero-card {
                grid-template-columns: 1fr;
            }

            .hero-image {
                order: -1;
                padding: 1rem;
            }

            .hero-content {
                padding: 2rem;
            }

            .btn {
                flex: 100%;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="hero-card">
        <div class="hero-content">
            <div class="logo">
                <div class="logo-icon">💰</div>
                <h1>ExpenseTracker</h1>
            </div>
            <p class="tagline">The simplest way to track your daily expenses</p>

            <div class="features">
                <div class="feature-item">
                    <div class="feature-icon">✓</div>
                    <div>Quick expense recording</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon">✓</div>
                    <div>Basic spending categories</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon">✓</div>
                    <div>Clear transaction history</div>
                </div>
                <div class="feature-item">
                    <div class="feature-icon">✓</div>
                    <div>100% free with no ads</div>
                </div>
            </div>

            <div class="btn-group">
                <a href="register.jsp" class="btn btn-primary">Create Free Account</a>
                <a href="login.jsp" class="btn btn-secondary">Sign In</a>
            </div>
        </div>
        <div class="hero-image">
            <img src="https://illustrations.popsy.co/amber/digital-nomad.svg" alt="Expense tracking illustration" onerror="this.src='data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0ibm9uZSIgc3Ryb2tlPSIjMjU2M2ViIiBzdHJva2Utd2lkdGg9IjEuNSI+PHBhdGggZD0iTTEyIDJ2MjBNMTcgNUg5LjVhMy41IDMuNSAwIDEwMCA3aDVhMy41IDMuNSAwIDExMCA3SDYiLz48L3N2Zz4='">
        </div>
    </div>
</div>
</body>
</html>