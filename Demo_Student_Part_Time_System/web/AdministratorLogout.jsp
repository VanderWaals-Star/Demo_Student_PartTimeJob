<%@ page contentType="text/html;charset=gb2312" %>
<%
if(null != session.getAttribute("administratorAccount")){
	session.invalidate();
}
%>
<html>
	<head>
		<title>����Ա�˳�</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;}
		</style>
	</head>
	
	<body>
		<p>�����˳�,5�����ת��<a href="AdministratorLogin.jsp">��¼����</a></p>
<%
response.setHeader("refresh","5;url=AdministratorLogin.jsp");
%>
	</body>
</html>

<!-- 20177710750 ���� -->

