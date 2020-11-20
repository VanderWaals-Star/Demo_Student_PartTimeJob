package administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdministratorLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public AdministratorLogin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		HttpSession session = request.getSession();
		
		int accountNumber = 0;
		
		//�˺�Ϊ�գ����ص�¼����
		try {
			accountNumber = Integer.parseInt(request.getParameter("accountNumber"));
		}
		catch(NumberFormatException e) {
			System.out.println("administrator.AdministratorLogin.doPost NumberFromatException: " + e);
			response.sendRedirect("AdministratorLogin.jsp");
			return;
		}
		
		AdministratorAccount aa = new AdministratorAccount(accountNumber);
		
		//�˺�������ƥ�䣬��AdministratorAccountʵ������session���ض�������������
		if(aa.checkAccount((String) request.getParameter("password"))) {
			session.setAttribute("administratorAccount", aa);
			session.removeAttribute("isError");
			
			response.sendRedirect("AdministratorOperation.jsp");
			//request.getRequestDispatcher("AdministratorOperation.jsp").forward(request, response);
		}
		else {
			session.setAttribute("administratorAccount", aa.getAccountName());
			session.setAttribute("isError","true");
			response.sendRedirect("AdministratorLogin.jsp");
			//request.getRequestDispatcher("AdministratorLogin.jsp").forward(request, response);
		}
	}
}
