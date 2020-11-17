package administrator;

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

public class AdministratorSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
    public AdministratorSearch() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		HttpSession session = request.getSession();
		String target = (String)session.getAttribute("target");
		String searchValue = request.getParameter("searchValue");
		Statement stat = Database.getStatement();
		ResultSet rs = null;
		
		if(null != searchValue && !"".contentEquals(searchValue)) {
			try {
				if(target.contentEquals((String)session.getAttribute("administrator"))){
					rs = stat.executeQuery("SELECT * FROM administrator_information WHERE AccountNumber='" + searchValue + "' OR AccountName='" + searchValue + "';");
				}
				else if(target.contentEquals((String)session.getAttribute("student"))){
					rs = stat.executeQuery("SELECT * FROM student_information WHERE AccountNumber='" + searchValue + "' OR Name='" + searchValue + "' OR PhoneNumber='" + searchValue + "';");
				}
				else if(target.contentEquals((String)session.getAttribute("employer"))){
					rs = stat.executeQuery("SELECT * FROM employer_information WHERE AccountNumber='" + searchValue + "' OR Name='" + searchValue + "' OR PhoneNumber='" + searchValue + "';");
				}
			}
			catch(SQLException e) {
				System.out.println("administrator.AdministratorSearch.doGet SQLException: " + e);
			}
		}
		
		if(null == rs) {
			try {
				if(target.contentEquals((String)session.getAttribute("administrator"))){
					rs = stat.executeQuery("SELECT * FROM administrator_information;");
				}
				else if(target.contentEquals((String)session.getAttribute("student"))){
					rs = stat.executeQuery("SELECT * FROM student_information;");
				}
				else if(target.contentEquals((String)session.getAttribute("employer"))){
					rs = stat.executeQuery("SELECT * FROM employer_information;");
				}
			}
			catch(SQLException e) {
				System.out.println("administrator.AdministratorSearch.doGet SQLException: " + e);
			}
		}
		request.setAttribute("ResultSet",rs);
		request.getRequestDispatcher("AdministratorOperation.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

//20177710750 уерг

