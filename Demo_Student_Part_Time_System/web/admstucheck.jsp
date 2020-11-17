<%--
  Created by IntelliJ IDEA.
  User: VanderWaals
  Date: 2020/11/17
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
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
    <div class="head">
        <%
            session.setAttribute("target",request.getParameter("method"));
            request.setAttribute("searchValue","jobs");
            if (!request.getAttribute("ResultSet").equals(null)) {
                ResultSet resultSet = (ResultSet) request.getAttribute("ResultSet");
                int count = resultSet.getMetaData().getColumnCount();
                while (resultSet.next()) {
                    for (int i = 0; i < count; i++) {
                        out.print(resultSet.getString(i));
                        if (i < count)
                            out.println(",");
                    }
                }
            }
        %>
    </div>
</div>
<%
    }
%>
</body>
</html>
