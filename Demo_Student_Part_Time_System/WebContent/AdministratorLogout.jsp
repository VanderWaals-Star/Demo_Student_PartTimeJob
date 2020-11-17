<%@ page contentType="text/html;charset=gb2312" %>
<%
if(null != session.getAttribute("administratorAccount")){
	session.invalidate();
}
%>
<html>
	<head>
		<title>管理员退出</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;}
		</style>
	</head>
	
	<body>
		<p>您已退出,5秒后跳转至<a href="AdministratorLogin.jsp">登录界面</a></p>
<%
response.setHeader("refresh","5;url=AdministratorLogin.jsp");
%>
	</body>
</html>

<!-- 20177710750 张仪 -->

