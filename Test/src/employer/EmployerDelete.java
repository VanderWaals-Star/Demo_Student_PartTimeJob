package employer;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

public class EmployerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EmployerDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String accountNumber = request.getParameter("accountNumber");
		
		Statement stat = Database.getStatement();
		try {
			stat.execute("DELETE FROM employer_information WHERE AccountNumber=" + accountNumber + ";");
		} catch (SQLException e) {
			System.out.println("employer.EmployerDelete.doGet SQLException: " + e);
		}
		
		request.getRequestDispatcher("AdministratorSearch").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

//20177710750 уерг

