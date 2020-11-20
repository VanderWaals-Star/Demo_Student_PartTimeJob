package student;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import administrator.AdministratorAccount;

/**
 * Servlet implementation class StudentLogin
 */
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=utf8");
		
		if(request.getParameter("accountNumber") == null) {
			request.setAttribute("isError","true");
			return;
		}
		
		StudentAccount sa = new StudentAccount(Integer.parseInt(request.getParameter("accountNumber")));
		
		if(sa.checkAccount((String) request.getParameter("password"))) {
			HttpSession session = request.getSession();
			session.setAttribute("studentAccount", sa);
			request.setAttribute("isError", "false");
			request.getRequestDispatcher("student.jsp").forward(request, response);
		}
		else {
			request.setAttribute("isError","true");
			request.getRequestDispatcher("stulogin.jsp").forward(request, response);
		}
	}

}
