<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="administrator.AdministratorAccount" %>
<%
AdministratorAccount aa = (AdministratorAccount)session.getAttribute("administratorAccount");
//���û�е�¼����ת����¼����
if(null == aa){
%>
<jsp:forward page="AdministratorLogin.jsp" />
<%
}
//�Ѳ���������������Ϊsession��������
session.setAttribute("administrator","administrator");
session.setAttribute("student","student");
session.setAttribute("employer","employer");

//���ò����Ķ���target��Ĭ��Ϊadministrator��������Ϊsession��һ������
String target = request.getParameter("target");
if(null == target){
	target = (String)session.getAttribute("administrator");
}
session.setAttribute("target",target);
//���صĲ�ѯ�������Ĭ��Ϊ���е�����
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
		<title>����Ա����</title>
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
				<td id="head1"align="center"><h1 align="left">ѧ����ְϵͳ</h1></td>
			
				<td id="head2" align="center">��ã�<%=aa.getAccountName() %>��
					<br>
					<a href="AdministratorUpdate.jsp">�޸���Ϣ</a>&nbsp;
					<a href="AdministratorLogout.jsp">�˳���¼</a>
				</td>
			</tr>
		</table>
		
		<table id="body">
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("administrator") %>">����Ա�˺Ų���</a>
				</td>
				<td id="body2" rowspan="3" align="right">
					<form action="AdministratorSearch" method="post">
						<input type="text" name="searchValue" />
						<input type="submit" value="����" />
					</form>
				</td>
			</tr>
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("student") %>">ѧ���˺Ų���</a>
				</td>
			</tr>
			<tr>
				<td class="body1">
					<a href="AdministratorOperation.jsp?target=<%=(String)session.getAttribute("employer") %>">�����˺Ų���</a>
				</td>
			</tr>
		</table>
<%
//����Ա
if(target.equals((String)session.getAttribute("administrator"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>����Ա�˺�</td>
				<td>�˺�����</td>
				<form action="AdministratorInsert" method="post">
				<td colspan="2">����
					<input type="submit" value="���" />
				</td>
				</form>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("AccountName") + "</td>"
				+ "<td><a href='AdministratorResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>��������</a></td>"
				+ "<td><a href='AdministratorDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>ɾ��</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

<%
//ѧ��
if(target.equals((String)session.getAttribute("student"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>ѧ���˺�</td>
				<td>����</td>
				<td>�绰</td>
				<td colspan="2">����</td>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("Name") + "</td><td>" + rs.getString("PhoneNumber") + "</td>"
				+ "<td><a href='StudentResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>��������</a></td>"
				+ "<td><a href='StudentDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>ɾ��</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

<%
//����
if(target.equals((String)session.getAttribute("employer"))){
%>
		<div class="show">
		<table class="show">
			<tr>
				<td>�����˺�</td>
				<td>����</td>
				<td>�绰</td>
				<td colspan="2">����</td>
			</tr>
<%
	while(rs.next()){
		out.println("<tr><td>" + rs.getInt("AccountNumber") + "</td><td>" + rs.getString("Name") + "</td><td>" + rs.getString("PhoneNumber") + "</td>"
				+ "<td><a href='EmployerResetPassword?accountNumber=" + rs.getInt("AccountNumber") +"'>��������</a></td>"
				+ "<td><a href='EmployerDelete?accountNumber=" + rs.getInt("AccountNumber") +"'>ɾ��</a></td></tr>");
	}
%>
		</table>
		</div>
<%}%>

	</div></body>
</html>

<!-- 20177710750 ���� -->

