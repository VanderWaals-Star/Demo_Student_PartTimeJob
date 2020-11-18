<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>大学生注册</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body>
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="left"></div>
   <div class="right right1">
      <div class="txt1"><p class="title">大学生注册页面</p></div>
      <form action="StudentRegister" method="post">
       <div class="txt1">
            <input name="name" type="text" class="txtphone" placeholder="请输入姓名"/>
           <br>
           <div align="center">
            <select name="gender">
                <option value="0" selected>男</option>
                <option value="1" selected>女</option>
            </select>
           </div>
       </div>
        <div class="txt1">
            <input name="birthDate" type="text" class="txtphone" placeholder="请输入出生日期，如：2020-01-01"/>
      </div>

        <div class="txt1">
            <input name="educationalQualification" type="text" class="txtphone" placeholder="中专/高中/专科/本科/研究生 在读"/>
      </div>

       <div class="txt1">
            <input name="phoneNumber" type="phoneNumber" class="txtphone" placeholder="请输入电话"/>
      </div>
      
      <div class="txt1">
            <input name="password" type="password" class="txtphone" placeholder="请输入密码"/>
      </div>
       <input class="denglu" type="submit" value="确认注册" />
      </form>
       <a href="stulogin.jsp"><div class="denglu">返回登录</div></a>
   </div>
  </body>
</html>