<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>管理员管理</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
</head>
<body >
<div class="up"><h1 class=title>大学生兼职网</h1></div>
<div class="main">
            <table>
                <tr>
                    <td width = "100" align = "center">AccountNumber</td>
                    <td width = "100" align = "center">Name</td>
                    <td width = "100" align = "center">Gender</td>
                    <td width = "100" align = "center">Edu</td>
                    <td width = "100" align = "center">Phone</td>
                </tr>
                <%
                    if(!(session.getAttribute("resultSet")==null)){
                        ResultSet resultSet = (ResultSet) session.getAttribute("resultSet");
                        while(resultSet.next()){
                            String AccountNumber = resultSet.getString(1);
                            String Name = resultSet.getString(3);
                            String Gender = resultSet.getString(4);
                            if(Gender=="1")
                                Gender="男";
                            else
                                Gender="女";
                            String Edu = resultSet.getString(6);
                            String Phone = resultSet.getString(7);
                %>
                <tr>
                    <td height="40" align="center" valign="middle"><%=AccountNumber%></td>
                    <td valign="middle" align="center"><%=Name%></td>
                    <td height="40" align="center" valign="middle"><%=Gender%></td>
                    <td height="40" align="center" valign="middle"><%=Edu%></td>
                    <td align="center" valign="middle"><%=Phone%></td>
                </tr>
                <%
                        }
                    }
                %>
            </table>
</div>
</body>
</html>
