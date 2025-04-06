package com.example.expensetracker.servlet;

import com.example.expensetracker.dao.UserDAO;
import com.example.expensetracker.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if user already exists
        if (userDAO.getUserByUsername(username) != null) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "User already exists. Please login.");
            response.sendRedirect("register.jsp"); // Redirect back to registration page
            return;
        }

        // Register new user
        User newUser = new User(username, password);
        boolean isRegistered = userDAO.registerUser(newUser);

        if (isRegistered) {
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "Registration successful! Please log in.");
            response.sendRedirect("login.jsp");
            return;
        }
        else {
            request.setAttribute("errorMessage", "Registration failed. Try again.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
