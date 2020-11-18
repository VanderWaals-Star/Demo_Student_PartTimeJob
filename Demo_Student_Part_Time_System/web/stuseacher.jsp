<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>大学生</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body >
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="main">
    <div class="head">
     <form id="text5" action="StudentSearch" method="post">
      <table>
       <tr>
         <td>
         &nbsp请选择查询条件：
          <select name="searchBy">
          <option value="AreaId">地址</option>
          <option value="PayValue">薪金</option>
          <option value="PayTime">时间</option>
          </select>
         </td>
         <td>
         &nbsp&nbsp&nbsp请输入查询信息
            <input type="text" id="input" name="searchValue" size="20">
            <input type="submit" id="input" value="查询">
            <input type="reset"  id="input" value="重置">
         </td>
        <td>
         &nbsp&nbsp&nbsp申请工作：
         <input type="submit" id="input" value="申请"/>
        </td>
        </tr>
       </table>
     </form>
     </div>
    <table>
     <tr>
      <td width = "100" align = "center">AccountNumber</td>
      <td width = "100" align = "center">Name</td>
      <td width = "100" align = "center">AreaId</td>
      <td width = "100" align = "center">Phone</td>
     </tr>
      <%
       if(!(session.getAttribute("resultSet")==null)){
        ResultSet resultSet = (ResultSet) session.getAttribute("resultSet");
        int count = resultSet.getMetaData().getColumnCount();
        while(resultSet.next()){
           String AccountNumber = resultSet.getString(1);
           String Name = resultSet.getString(3);
           String AreaId = resultSet.getString(4);
           String Phone = resultSet.getString(5);
         %>
     <tr>
      <td height="40" align="center" valign="middle"><%=AccountNumber%></td>
      <td valign="middle" align="center"><%=Name%></td>
      <td height="40" align="center" valign="middle"><%=AreaId%></td>
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
