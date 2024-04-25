package com.servlets;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

import com.business.ReportData;

@WebServlet("/AdminReportServlet")
public class AdminReportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/eustudents";
        String username = "prog";
        String password = "netsh";

        // Retrieve start_date and end_date from request parameters
        String startDate = request.getParameter("start_date");
        String endDate = request.getParameter("end_date");

        // List to hold retrieved report data
        List<ReportData> reportList = new ArrayList<>();
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection(url, username, password);

            // SQL query to retrieve records within the specified time range
            String sql = "SELECT reg_number, student_name, report_time FROM reported WHERE report_time BETWEEN ? AND ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, startDate);
            pstmt.setString(2, endDate);

            // Execute the query
            ResultSet rs = pstmt.executeQuery();

            // Process the result set
            while (rs.next()) {
                String regNumber = rs.getString("reg_number");
                String studentName = rs.getString("student_name");
                String reportTime = rs.getString("report_time");

                // Create a new ReportData object and add to the list
                ReportData report = new ReportData(regNumber, studentName, reportTime);
                reportList.add(report);
            }

            // Close JDBC objects
            rs.close();
            pstmt.close();
            conn.close();

            // Forward the reportList to the reportResult.jsp
            if (!reportList.isEmpty()) {
                request.setAttribute("reportList", reportList);
            } else {
                request.setAttribute("noRecords", true);
            }
            request.getRequestDispatcher("/adminreport.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Error accessing database.");
        }
    }
}
