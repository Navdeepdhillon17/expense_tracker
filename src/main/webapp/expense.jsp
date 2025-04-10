<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.expensetracker.model.Expense" %>
<%@ page import="com.example.expensetracker.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Expense> expenses = (List<Expense>) request.getAttribute("expenses");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Expense Tracker</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }
        header {
            background-color: #3949ab;
            color: white;
            padding: 15px;
            text-align: center;
        }
        .container {
            width: 85%;
            margin: 20px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        h2 {
            color: #3949ab;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        form {
            margin-top: 20px;
        }
        input[type="text"], input[type="number"], input[type="date"] {
            padding: 8px;
            margin-right: 10px;
            width: 20%;
        }
        input[type="submit"] {
            padding: 10px 20px;
            background-color: #3949ab;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .alert {
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
        }
        .alert-success {
            background-color: #d4edda;
            color: #155724;
        }
        .alert-error {
            background-color: #f8d7da;
            color: #721c24;
        }
        .actions a {
            color: #3949ab;
            text-decoration: none;
            margin: 0 5px;
        }
             /* Logout Button */
         .logout-btn {
             position: absolute;
             top: 20px;
             right: 30px;
             padding: 10px 18px;
             background-color: #ff5c5c;
             color: white;
             border: none;
             border-radius: 6px;
             text-decoration: none;
             font-weight: bold;
             box-shadow: 0 2px 6px rgba(0,0,0,0.2);
             transition: all 0.3s ease;
         }

        .logout-btn:hover {
            background-color: #d84343;
            transform: scale(1.05);
            box-shadow: 0 4px 10px rgba(0,0,0,0.3);
        }

        /* Common Button Style */
        .button {
            padding: 10px 16px;
            /*background-color: #9cc4e8;*/
            color: white;
            border: none;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
        }

        /* Hover Effect for Buttons */
        .button:hover {
            /*background-color: #2c80b4;*/
            border: 2px solid #3949ab;
            transform: scale(1);
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        .delete-btn:hover {
            background-color:  #3949ab;
        }

    </style>

</head>
<body>

<header>
    <h1>Welcome, <%= user.getUsername() %></h1>
    <a href="logout" class="logout-btn">Logout</a>
</header>

<div class="container">
    <% if (session.getAttribute("successMessage") != null) { %>
    <div class="alert alert-success">
        <%= session.getAttribute("successMessage") %>
    </div>
    <%
        session.removeAttribute("successMessage");
    %>
    <% } %>

    <% if (session.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-error">
        <%= session.getAttribute("errorMessage") %>
    </div>
    <%
        session.removeAttribute("errorMessage");
    %>
    <% } %>
    <%
        String expenseId = request.getParameter("id");
        String expenseTitle = request.getParameter("title");
        String expenseAmount = request.getParameter("amount");
        String expenseDate = request.getParameter("date");
    %>


    <h2>Add Expense</h2>
    <form method="post" action="expense">
        <input type="hidden" name="id" value="<%= expenseId != null ? expenseId : "" %>">

        <label>
            <input type="text" name="title" placeholder="Title" value="<%= expenseTitle != null ? expenseTitle : "" %>" required>
        </label>
        <label>
            <input type="number" name="amount" step="0.01" placeholder="Amount" value="<%= expenseAmount != null ? expenseAmount : "" %>" required>
        </label>
        <label>
            <input type="date" name="date" value="<%= expenseDate != null ? expenseDate : "" %>" required>
        </label>

        <input class="button" type="submit" value="<%= expenseId != null ? "Update Expense" : "Add Expense" %>">
    </form>


    <h2>Your Expenses</h2>
    <table>
        <thead>
        <tr>
            <th>Title</th>
            <th>Amount (₹)</th>
            <th>Date</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <% if (expenses != null && !expenses.isEmpty()) {
            for (Expense expense : expenses) { %>
        <tr>
            <td><%= expense.getTitle() %></td>
            <td><%= expense.getAmount() %></td>
            <td><%= expense.getDate() %></td>
            <td class="actions">
                <a href="expense.jsp?id=<%= expense.getId() %>&title=<%= expense.getTitle() %>&amount=<%= expense.getAmount() %>&date=<%= expense.getDate() %>" class="button">Edit</a>

                <form action="expense" method="post" style="display:inline;">
                    <input type="hidden" name="id" value="<%= expense.getId() %>">
                    <input type="hidden" name="action" value="delete">
                    <input class="delete-btn button" type="submit" value="Delete" onclick="return confirm('Are you sure?');">
                </form>

            </td>
        </tr>
        <%   }
        } else { %>
        <tr>
            <td colspan="4">No expenses yet. Add one above!</td>
        </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
