<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>大学生登录</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body>
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="left"></div>
   <div class="right">
      <div class="txt"><p class="title">大学生登录页面</p></div>
<%
if("true".equals(request.getAttribute("isError"))){
%>
      <p>账号或密码错误</p>
<%
}
%>
      <form action="" method="post">
      <div class="txt">
            <input name="accountNumber" type="text" class="txtphone" placeholder="请输入账号"/>
      </div>

      <div class="txt">
            <input name="password" type="password" class="txtphone" placeholder="请输入登录密码"/>
      </div>

      <div class="jizhu">
            <input name="" type="checkbox" value="" checked="checked"/>
            记住密码 <span class="blue" style=" padding-left:215px; cursor:pointer">重置</span></a>
      </div>

      <input class="denglu" type="submit" value="登录" />
      </form>
      <a href="sturegister.jsp"><div class="denglu">注册</div></a>
   </div>
  </body>
</html>
