package administrator;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.Database;

public class AdministratorInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdministratorInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Statement stat = Database.getStatement();
		try {
			stat.execute("INSERT INTO administrator_information VALUE ();");
		} catch (SQLException e) {
			System.out.println("administrator.AdministratorInsert.doGet SQLException: " + e);
		}
		request.getRequestDispatcher("AdministratorSearch").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

//20177710750 уерг

