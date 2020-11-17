<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="administrator.AdministratorAccount" %>
<%
AdministratorAccount aa = (AdministratorAccount)session.getAttribute("administratorAccount");
if(null != aa){
%>
<html>
	<head>
		<title>修改个人信息</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;}
		</style>
	</head>
	
	<body>
		<h1>学生兼职系统</h1>
		<form action="AdministratorUpdate" method="post">
			<p>修改用户名称</p>
			<input type="text" name="accountName" value="<%=aa.getAccountName() %>" />
			<input type="submit" value="修改" />
		</form>
		
		<form action="AdministratorUpdate" method="post">
			<p>修改密码</p>
			<table>
				<tr>
					<td>新密码</td>
					<td><input type="password" name="newPassword" /></td>
				</tr>
				<tr>
					<td>再次输入</td>
					<td><input type="password" name="newPassword2" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="修改" />
				</tr>
			</table>
		</form>

		<a href="AdministratorOperation.jsp">返回</a>
<%
	String message = (String)session.getAttribute("message");
	if(null != message){
		out.println(message);
	}
%>
	</body>
	
</html>
<%
}
else{
%>
<jsp:forward page="AdministratorLogin.jsp" />
<%
}
%>

<!-- 20177710750 张仪 -->



