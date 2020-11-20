<%@ page contentType="text/html;charset=gb2312" %>
<html>
	<head>
		<title>管理员登录</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;
				margin:0;}
			div#main{width:500px;
				height:300px;
				margin-left:10%;
				margin-top:10%;
				border:solid;
				background-color:rgba(191,192,191,0.5);}
			table{border:double;
				padding:5px;}
			tr,tr input{font-size:x-large;
				line-height:30px}
			tr#title{font-weight:bold;}
			input.button{font-size:x-large;
				font-weight:bold;}
			p#prompt{color:rgba(255,0,0,0.9);
				font-size:large;
				text-align:center;}
		</style>
	</head>
	
	<body>
		<%
			if(null == session.getAttribute("administratorAccount")){
		%>
			<div id="main">
				<h1 align="center">学生兼职系统</h1>

				<form action="AdministratorLogin" method="post">
					<table align="center">
						<tr align="center" id="title"><td colspan="2">管理员登录</td></tr>
						<tr>
							<td>账号:&nbsp;</td>
							<td><input type="text" name="accountNumber" /></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr align="center">
							<td colspan="2"><input class="button" type="submit" value="登录" />&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="button" type="reset" value="重置" /></td>
						</tr>
					</table>
				</form>
			</div>
			<%
			}
			else{
				if("true".equals(session.getAttribute("isError"))){
			%>
				<p id="prompt">*账号或密码错误</p>
			<%
				}
				else{
			%>
			<jsp:forward page="AdministratorOperation.jsp" />
			<%
					}
				}
			%>
	</body>
</html>


