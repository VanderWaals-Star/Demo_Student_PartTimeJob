<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<%
    request.setCharacterEncoding("utf8");
%>
  <head>
    <title>招聘方登录</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body>
  <%
    if(null==request.getParameter("usr")){
  %>
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="left"></div>
   <div class="right">
      <div class="txt"><p class="title">招聘方登录页面</p></div>
       <form method="post" action="">
          <div class="txt">
                <input name="usr" type="text" class="txtphone" placeholder="请输入用户名"/>
          </div>

          <div class="txt">
                <input name="pwd" type="password" class="txtphone" placeholder="请输入登录密码"/>
          </div>

          <div class="jizhu">
                <input name="" type="checkbox" value="" checked="checked"/>
                记住密码 <span class="blue" style=" padding-left:215px; cursor:pointer">重置</span></a>
          </div>
           <div>
           <input class="denglu" name="" type="submit" value="登录"  checked="checked"/>
          </div>
           <a href="admregister.jsp"><div class="denglu">注册</div></a>
      </form>
<%
    }
    else{
        session.setAttribute("accountName",request.getParameter("usr"));
        %>

       <jsp:forward page="administeatoroperation.jsp"></jsp:forward>
       <%
    }
%>
   </div>
  </body>
</html>
