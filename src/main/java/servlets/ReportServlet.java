package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String regNumber = request.getParameter("regNumber");
        String studentName = request.getParameter("studentName");
        

        // Database connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/eustudents";
        String dbUser = "prog";
        String dbPassword = "netsh";
        
        //the driver
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        // SQL query to insert into 'reported' table
        String sql = "INSERT INTO reported (reg_number, student_name) VALUES (?, ?);";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            // Set parameters
            stmt.setString(1, regNumber);
            stmt.setString(2, studentName);
            

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Check if the insertion was successful
            if (rowsAffected > 0) {
                // Redirect to reportsuccessful.jsp upon success
                response.sendRedirect("reportsuccessful.jsp");
            } else {
                // Display error message if insertion failed
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to generate report.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error.");
        }
    }
}
