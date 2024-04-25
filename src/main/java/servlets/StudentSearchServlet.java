package servlets;

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.business.Report;

@WebServlet("/search-student")
public class StudentSearchServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost/eustudents";
    private static final String DB_USER = "prog";
    private static final String DB_PASSWORD = "netsh";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String regNumber = request.getParameter("regNumber");
        String studentName = request.getParameter("studentName");
        
        Report details = new Report();
        details.setRegNumber(regNumber);
        details.setStudentName(studentName);
        
        request.setAttribute("reportDetails", details);

        // Set up database connection
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT reg_number, student_name, email_address, phone_number FROM students WHERE reg_number = ?";
            PreparedStatement statement = conn.prepareStatement(query);
            statement.setString(1, regNumber);
            ResultSet resultSet = statement.executeQuery();
            
            if (resultSet.next()) {
                // Found matching student, set attributes to pass to JSP
                request.setAttribute("regNumber", resultSet.getString("reg_number"));
                request.setAttribute("studentName", resultSet.getString("student_name"));
                request.setAttribute("emailAddress", resultSet.getString("email_address"));
                request.setAttribute("phoneNumber", resultSet.getString("phone_number"));
            } else {
                
            	request.getRequestDispatcher("/report.jsp").forward(request, response);
            }
            
            // Forward to the JSP for displaying results
            request.getRequestDispatcher("/searchresults.jsp").forward(request, response);

        } catch (SQLException ex) {
            ex.printStackTrace();
            throw new ServletException("Database access error", ex);
        }
    }
}
