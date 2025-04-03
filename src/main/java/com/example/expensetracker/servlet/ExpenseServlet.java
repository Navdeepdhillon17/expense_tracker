package com.example.expensetracker.servlet;

import com.example.expensetracker.dao.ExpenseDAO;
import com.example.expensetracker.model.Expense;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/expense")
public class ExpenseServlet extends HttpServlet {

    // Handle GET requests (for edit form)
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ExpenseDAO expenseDAO = new ExpenseDAO();

        // Always load expenses (for initial page load and edit form)
        List<Expense> expenses = expenseDAO.getAllExpenses();
        request.setAttribute("expenses", expenses);

        String action = request.getParameter("action");
        if ("edit".equals(action)) {
            // Edit form handling
            int id = Integer.parseInt(request.getParameter("id"));
            Expense expense = expenseDAO.getExpenseById(id);
            request.setAttribute("expense", expense);
            request.getRequestDispatcher("editExpense.jsp").forward(request, response);
        } else {
            // Normal page load
            request.getRequestDispatcher("expense.jsp").forward(request, response);
        }
    }

    // Handle POST requests (for create and update)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");

        ExpenseDAO dao = new ExpenseDAO();
        if (idParam == null || idParam.isEmpty()) {
            // Create new expense
            String title = request.getParameter("title");
            double amount = Double.parseDouble(request.getParameter("amount"));
            String date = request.getParameter("date");

            Expense newExpense = new Expense(title, amount, date);
            dao.saveExpense(newExpense);
        } else {
            // Update existing expense
            int id = Integer.parseInt(idParam);
            Expense existingExpense = dao.getExpenseById(id);
            existingExpense.setTitle(request.getParameter("title"));
            existingExpense.setAmount(Double.parseDouble(request.getParameter("amount")));
            existingExpense.setDate(request.getParameter("date"));
            dao.updateExpense(existingExpense);
        }

        response.sendRedirect("expense");
    }

    // Handle DELETE requests
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        new ExpenseDAO().deleteExpense(id);
        response.sendRedirect("expense");
    }
}