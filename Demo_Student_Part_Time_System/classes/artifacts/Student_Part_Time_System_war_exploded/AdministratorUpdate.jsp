<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="administrator.AdministratorAccount" %>
<%
AdministratorAccount aa = (AdministratorAccount)session.getAttribute("administratorAccount");
if(null != aa){
%>
<html>
	<head>
		<title>�޸ĸ�����Ϣ</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;}
		</style>
	</head>
	
	<body>
		<h1>ѧ����ְϵͳ</h1>
		<form action="AdministratorUpdate" method="post">
			<p>�޸��û�����</p>
			<input type="text" name="accountName" value="<%=aa.getAccountName() %>" />
			<input type="submit" value="�޸�" />
		</form>
		
		<form action="AdministratorUpdate" method="post">
			<p>�޸�����</p>
			<table>
				<tr>
					<td>������</td>
					<td><input type="password" name="newPassword" /></td>
				</tr>
				<tr>
					<td>�ٴ�����</td>
					<td><input type="password" name="newPassword2" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="�޸�" />
				</tr>
			</table>
		</form>

		<a href="AdministratorOperation.jsp">����</a>
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

<!-- 20177710750 ���� -->



