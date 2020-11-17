<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="administrator.AdministratorAccount" %>
<%
AdministratorAccount aa = (AdministratorAccount)session.getAttribute("administratorAccount");
//如果没有登录就跳转至登录界面
if(null == aa){
%>
<jsp:forward page="AdministratorLogin.jsp" />
<%
}
//把操作对象名，设置为session三个属性
session.setAttribute("administrator","administrator");
session.setAttribute("student","student");
session.setAttribute("employer","employer");

//设置操作的对象target，默认为administrator，并设置为session的一个属性
String target = request.getParameter("target");
if(null == target){
	target = (String)session.getAttribute("administrator");
}
session.setAttribute("target",target);
//返回的查询结果集，默认为所有的数据
ResultSet rs = (ResultSet)request.getAttribute("ResultSet");
if(null == rs){
	%>
	<jsp:forward page="AdministratorSearch"></jsp:forward>
	<%
	//request.getRequestDispatcher("AdministratorSearch").forward(request,response);
}
%>

<html>
	<head>
		<title>管理员操作</title>
		<style type="text/css">
			body{background-image:url("images/AdministratorBackground.jpg");
				background-position:right;
				background-size:cover;
				margin:0;}
			div#main{width:700px;
				height:720px;
				margin:20px;
				border:solid;
				background-color:rgba(191,192,191,0.5);}
			table#head{width:100%;
				background-color:rgba(191,192,191,1);
				border-bottom:solid;}
			h1{margin:5px;}
			td#head1{width:70%;}
			td#head2{width:30%;}
			table#body{width:100%;
				padding:10px;}
			table#body{height:20%;}
			td.body1{width:20%;
				text-align:center;
				margin:4px;
				background-color:rgba(165,165,165,1);
				border:solid rgba(185,185,185,1);}
			td.body1 a{text-decoration:none;}
			td#body2{width:80%;}
			div.show{overflow-x:auto;
				overflow-y:auto;
				height:70%;
				width:73%;
				margin-left:25%;
				border:double;
				float:left;}
			table.show{width:100%;
				text-align:center;}
		</style>
	</head>
	
	<body><div id="main">
		<table id="head">
			<tr>
				<td id="head1"align="center"><h1 align="left">学生兼职系统</h1></td>
			
				<td id="head2" align="center">你好，<%=aa.getAccountName() %>！
					<br>
					<a href="AdministratorUpdate.jsp">修改信息</a>&nbsp;
					<a href="AdministratorLogout.jsp">退出登录</a>
				</td>
			</tr>
		</table>
		
		<table id="body">
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("administrator") %>">管理员账号操作</a>
				</td>
				<td id="body2" rowspan="3" align="right">
					<form action="AdministratorSearch" method="post">
						<input type="text" name="searchValue" />
						<input type="submit" value="搜索" />
					</form>
				</td>
			</tr>
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("student") %>">学生账号操作</a>
				</td>
			</tr>
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("employer") %>">雇主账号操作</a>
				</td>
			</tr>
		</table>
<%
//管理员
if(target.equals((String)session.getAttribute("administrator"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>管理员账号</td>
				<td>账号名称</td>
				<form action="AdministratorInsert" method="post">
				<td colspan="2">操作
					<input type="submit" value="添加" />
				</td>
				</form>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("AccountName") + "</td>"
				+ "<td><a href='AdministratorResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>重置密码</a></td>"
				+ "<td><a href='AdministratorDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>删除</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

<%
//学生
if(target.equals((String)session.getAttribute("student"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>学生账号</td>
				<td>姓名</td>
				<td>电话</td>
				<td colspan="2">操作</td>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("Name") + "</td><td>" + rs.getString("PhoneNumber") + "</td>"
				+ "<td><a href='StudentResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>重置密码</a></td>"
				+ "<td><a href='StudentDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>删除</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

<%
//雇主
if(target.equals((String)session.getAttribute("employer"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>雇主账号</td>
				<td>名称</td>
				<td>电话</td>
				<td colspan="2">操作</td>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("Name") + "</td><td>" + rs.getString("PhoneNumber") + "</td>"
				+ "<td><a href='EmployerResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>重置密码</a></td>"
				+ "<td><a href='EmployerDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>删除</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

	</div></body>
</html>

<!-- 20177710750 张仪 -->

