package com.example.expensetracker.servlet;

import com.example.expensetracker.dao.UserDAO;
import com.example.expensetracker.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.getUserByUsername(username);

        HttpSession session = request.getSession();

        if (user == null || !user.getPassword().equals(password)) {
            session.setAttribute("errorMessage", "Invalid username or password.");
            response.sendRedirect("login.jsp"); // Redirect to login page
            return;
        }

        // Successful login
        session.setAttribute("user", user);
        response.sendRedirect("expense.jsp");
    }
}
