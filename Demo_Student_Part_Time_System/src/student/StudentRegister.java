package student;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

/**
 * Servlet implementation class StudentRegister
 */
public class StudentRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf8");
		String name = request.getParameter("name");
		int gender = request.getParameter("gender").equals("0")? 0 : 1;
		Date birthDate = Date.valueOf(request.getParameter("birthDate"));
		String educationalQualification = request.getParameter("educationalQualification");
		String phoneNumber = request.getParameter("phoneNumber");
		String password = request.getParameter("password");
		
		Statement stat = Database.getStatement();
		
		try {
			stat.execute("INSERT INTO student_information (Name,Gender,BirthDate,EducationalQualification,PhoneNumber,Password) VALUE ('"+
					name + "','" + gender + "','" + birthDate + "','" + educationalQualification + "','" + phoneNumber + "','" + password + "');");
			request.getRequestDispatcher("stulogin.jsp").forward(request, response);
		} catch (SQLException e) {
			System.out.println("student.StudentRegister.doPost SQLException: " + e);
			request.getRequestDispatcher("sturegister.jsp").forward(request, response);
		}
		
	}

}
