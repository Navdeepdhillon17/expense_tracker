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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = userDAO.getUserByUsername(username);

        if (user == null || !user.getPassword().equals(password)) {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.setAttribute("prevUsername", username);
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // ✅ Correct session usage — only once
        HttpSession session = request.getSession();
        session.setAttribute("user", user);

        // ✅ Redirect to expense servlet (NOT .jsp directly)
        response.sendRedirect("expense");
    }
}
