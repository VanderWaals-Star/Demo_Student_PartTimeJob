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

public class EmployerSearchStu extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EmployerSearchStu() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        Statement stat = Database.getStatement();
        ResultSet rs = null;

        try {
            rs = stat.executeQuery("SELECT * FROM student_information;");
//            while (rs.next()) {
//                System.out.println(rs.getString(1));
//                }
            }
        catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute("resultSet",rs);
        request.getRequestDispatcher("admstucheck.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
