package student;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

public class CreateCurriculumVitae extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateCurriculumVitae() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		StudentAccount sa = (StudentAccount)session.getAttribute("studentAccount");
		int accountNumber = sa.getAccountNumber();
		String areaId = request.getParameter("areaId");
		String occupationId = request.getParameter("occupationId");
		String payTime = request.getParameter("payTime");
		String payValue = request.getParameter("payValue");
		String other = request.getParameter("other");
		
		Statement stat = Database.getStatement();
		try {
			stat.execute("INSERT INTO curriculum_vitaes (AccountNumber,AreaId,OccupationId,PayTime,PayValue,Other)"
					+ "VALUE (" + accountNumber + "," + areaId + "," + occupationId + "," + payTime + "," + payValue + "," + other + ");");
		} catch (SQLException e) {
			System.out.println("student.CreateCurriculumVitae.doPost SQLException: " + e);
		}
		
		request.getRequestDispatcher("student.jsp").forward(request, response);
	}

}
