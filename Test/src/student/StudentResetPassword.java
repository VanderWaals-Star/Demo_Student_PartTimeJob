package student;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

public class StudentResetPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public StudentResetPassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String accountNumber = request.getParameter("accountNumber");
		
		Statement stat = Database.getStatement();
		try {
			stat.execute("UPDATE student_information SET password= WHERE AccountNumber=" + accountNumber + ";");
		} catch (SQLException e) {
			System.out.println("student.StudentResetPassword.doGet SQLException: " + e);
		}
		
		request.getRequestDispatcher("AdministratorSearch").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

//20177710750 уерг

