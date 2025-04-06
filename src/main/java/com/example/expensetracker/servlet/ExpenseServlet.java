package com.example.expensetracker.servlet;

import com.example.expensetracker.dao.ExpenseDAO;
import com.example.expensetracker.model.Expense;
import com.example.expensetracker.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/expense")
public class ExpenseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        ExpenseDAO expenseDAO = new ExpenseDAO();
        List<Expense> expenses = expenseDAO.getExpensesByUser(user);

        request.setAttribute("expenses", expenses); // ✅ Very important!
        RequestDispatcher dispatcher = request.getRequestDispatcher("expense.jsp");
        dispatcher.forward(request, response); // ✅ this shows the JSP

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        ExpenseDAO dao = new ExpenseDAO();

        if ("delete".equalsIgnoreCase(action)) {
            // Handle delete request
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int id = Integer.parseInt(idParam);
                Expense expense = dao.getExpenseById(id);

                if (expense != null && expense.getUser().getId() == user.getId()) {
                    dao.deleteExpense(id);
                }
            }

            response.sendRedirect("expense");
            return;
        }

        // Add or Update
        String idParam = request.getParameter("id");

        if (idParam == null || idParam.isEmpty()) {
            // Add new expense
            try {
                String title = request.getParameter("title");
                double amount = Double.parseDouble(request.getParameter("amount"));
                String date = request.getParameter("date");

                Expense newExpense = new Expense(title, amount, date, user);
                dao.saveExpense(newExpense);
            } catch (Exception e) {
                System.out.println("Error adding expense: " + e.getMessage());
            }
        } else {
            // Update existing expense
            try {
                int id = Integer.parseInt(idParam);
                Expense existingExpense = dao.getExpenseById(id);

                if (existingExpense != null && existingExpense.getUser().getId() == user.getId()) {
                    existingExpense.setTitle(request.getParameter("title"));
                    existingExpense.setAmount(Double.parseDouble(request.getParameter("amount")));
                    existingExpense.setDate(request.getParameter("date"));
                    dao.updateExpense(existingExpense);
                }
            } catch (Exception e) {
                System.out.println("Error updating expense: " + e.getMessage());
            }
        }

        response.sendRedirect("expense");
    }


    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        ExpenseDAO dao = new ExpenseDAO();
        Expense expense = dao.getExpenseById(id);

        if (expense != null && expense.getUser().getId() == user.getId()) {
            dao.deleteExpense(id);
        }

        response.sendRedirect("expense");
    }
}
