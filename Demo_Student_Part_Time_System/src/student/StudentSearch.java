package student;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

public class StudentSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public StudentSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchBy = request.getParameter("searchBy");
		String searchValue = request.getParameter("searchValue");
		
		Statement stat = Database.getStatement();
		ResultSet rs = null;
		if(null == searchBy || null == searchValue) {
			try {
				rs = stat.executeQuery("SELECT * FROM employer_information;");
			} catch (SQLException e) {
				System.out.println("student.StudentSearch.doGet SQLException: " + e);
			}
		}
		else {
			try {
				rs = stat.executeQuery("SELECT * FROM employer_information WHERE " + searchBy + "=" + searchValue + ";");
			} catch (SQLException e) {
				System.out.println("student.StudentSearch.doGet SQLException: " + e);
			}
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("resultSet",rs);
		request.getRequestDispatcher("stuseacher.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
