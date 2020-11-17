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
      if(!request.getParameter("text5").equals(null){
       if(!request.getAttribute("ResultSet").equals(null)){
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
     <form id="text5" action="AdministratorSearch">
    <table>
     <tr>
      <td>
     &nbsp请选择查询条件：
     <select>
     <option value="地址">地址</option>
     <option value="薪金">薪金</option>
     <option value="时间">时间</option>
     </select>
      </td>
      <td>
     &nbsp&nbsp&nbsp请输入查询信息
     <input type="text" id="input" size="20">
     <input type="submit" id="input" value="查询">
     <input type="reset"  id="input" value="重置">
      </td>
      <td>
     &nbsp&nbsp&nbsp增加工作：
     <input type="submit" id="input" value="增加"/>
      </td>
       <td>
     &nbsp&nbsp&nbsp删除工作：
     <input type="submit" id="input" value="删除"/>
      </td>
      </tr>
      </table>
            
     </form>
     </div>
     </div>
  </body>
</html>
