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

import com.business.Student;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String regNumber = request.getParameter("regNumber");
        String studentName = request.getParameter("studentName");
        String emailAddress = request.getParameter("emailAddress");
        String phoneNumber = request.getParameter("phoneNumber");

        // Create a new Student object with form data
        Student student = new Student();
        student.setRegNumber(regNumber);
        student.setStudentName(studentName);
        student.setEmailAddress(emailAddress);
        student.setPhoneNumber(phoneNumber);

        // JDBC Connection Parameters
        String jdbcUrl = "jdbc:mysql://localhost:3306/eustudents";
        String dbUser = "prog";
        String dbPassword = "netsh";
        
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        try (Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword)) {
            String sql = "INSERT INTO students (reg_number, student_name, email_address, phone_number) VALUES (?, ?, ?, ?);";
            PreparedStatement statement = conn.prepareStatement(sql);
            
            // Set values using Student object
            statement.setString(1, student.getRegNumber());
            statement.setString(2, student.getStudentName());
            statement.setString(3, student.getEmailAddress());
            statement.setString(4, student.getPhoneNumber());
            
            // Execute the SQL statement
            statement.executeUpdate();
            
            request.setAttribute("student", student);
            // Forward to a JSP page to display success message or handle further actions
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Database connection error: " + e.getMessage());
        }
    }
}

