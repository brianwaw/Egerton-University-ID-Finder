package com.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/eustudents";
    private static final String DB_USERNAME = "prog";
    private static final String DB_PASSWORD = "netsh";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("userName");
        String email = request.getParameter("emailAddress");
        String phoneNumber = request.getParameter("phoneNumber");

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, DB_USERNAME, DB_PASSWORD);

            String sql = "SELECT * FROM admin WHERE username = ? AND email = ? AND phone_number = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, email);
            pstmt.setString(3, phoneNumber);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Authentication successful
                String adminUsername = rs.getString("username");
                // Create a cookie to store the username
                Cookie usernameCookie = new Cookie("adminUsername", adminUsername);
                response.addCookie(usernameCookie);
                // Redirect to admin panel
                response.sendRedirect("admin.jsp");
            } else {
                // Authentication failed
                request.setAttribute("error", "Credentials mismatch. Please try again.");
                request.getRequestDispatcher("adminlogin.jsp").forward(request, response);
            }

            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("admin_form.jsp").forward(request, response);
        }
    }
}
