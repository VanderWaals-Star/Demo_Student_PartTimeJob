<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="student.StudentAccount" %>
<%
StudentAccount sa = (StudentAccount)session.getAttribute("studentAccount");
%>
<!DOCTYPE html>
<html>
  <head>
    <title>大学生操作</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body>
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="left"></div>
   <div class="right">
   <div class="txt"><p class="title">你好，学生 <%=sa.getName() %></p></div>
   <a href="resume.jsp"><div class=" a3">完善个人信息</div></a>
   <a href="stuseacher.jsp"><div class=" a4">查询工作信息</div></a>
   </div>
  </body>
</html>
