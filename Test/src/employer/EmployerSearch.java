package employer;

import database.Database;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class EmployerSearch  extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EmployerSearch() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchBy = request.getParameter("searchBy");
        String searchValue = request.getParameter("searchValue");
        String add = request.getParameter("add");
        String delete = request.getParameter("delete");

        HttpSession session = request.getSession();

        Statement stat = Database.getStatement();
        ResultSet rs = null;
        if ((null == searchBy || null == searchValue) && (null == add && null == delete)) {
            try {
                rs = stat.executeQuery("SELECT * FROM employer_information;");
            } catch (SQLException e) {
                System.out.println("employer.doGet SQLException: " + e);
            }
        } else if ((!(null == searchBy || null == searchValue)) && (null == add && null == delete)) {
            try {
                rs = stat.executeQuery("SELECT * FROM employer_information WHERE " + searchBy + "=" + searchValue + ";");
            } catch (SQLException e) {
                System.out.println("employer.doGet SQLException: " + e);
            }
        } else {
            String msg = "Please Contact Administrators";
            session.setAttribute("Error", msg);
        }

        session.setAttribute("resultSet", rs);
        request.getRequestDispatcher("admseacher.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}