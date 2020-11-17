package administrator;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.Database;

public class AdministratorUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdministratorUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("gb2312");
		response.setContentType("text/html;charset=gb2312");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		
		AdministratorAccount aa = (AdministratorAccount)session.getAttribute("administratorAccount");
		
		String accountName = request.getParameter("accountName");
		if(null != accountName) {
			if(!accountName.contentEquals(aa.getAccountName())) {
				aa.updateAccountName(accountName);
				session.setAttribute("message", "用户名更新成功！");
			}
		}
		else {
			String newPassword = request.getParameter("newPassword");
			String newPassword2 = request.getParameter("newPassword2");
			
			if(null == newPassword || "".contentEquals(newPassword)) {
				session.setAttribute("message", "密码不能为空");
			}
			else if(!newPassword.contentEquals(newPassword2)) {
				session.setAttribute("message", "输入的密码不一致");
			}
			else {
				if(true == aa.updatePassword(newPassword)) {
					session.invalidate();
					out.println("密码已重置，请点击<a href='AdministratorLogin.jsp'>重新登录</a>");
					return;
				}
			}
		}
		
		response.sendRedirect("AdministratorUpdate.jsp");
	}
}

//20177710750 张仪

