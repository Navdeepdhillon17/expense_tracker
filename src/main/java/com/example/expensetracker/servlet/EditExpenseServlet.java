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

@WebServlet("/editExpense")
public class EditExpenseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        ExpenseDAO dao = new ExpenseDAO();
        Expense expense = dao.getExpenseById(id);

        User user = (User) session.getAttribute("user");
        if (expense != null && expense.getUser().getId() == user.getId()) {
            request.setAttribute("expense", expense);
            RequestDispatcher dispatcher = request.getRequestDispatcher("editExpense.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("expense"); // fallback if invalid or unauthorized access
        }
    }
}
