<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>管理员操作</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body>
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="left"></div>
   <div class="right">
   <div class="txt"><p class="title">你好，管理员 <%=session.getAttribute("accountName") %></p></div>
   <a href="admseacher.jsp"><div class=" a3">管理招聘信息</div></a>
   <a href="admstucheck.jsp"><div class=" a4">查看学生信息</div></a>
   </div>
  </body>
</html>
