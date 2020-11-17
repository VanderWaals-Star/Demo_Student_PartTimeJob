<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <title>大学生兼职网</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link type="text/css" rel="stylesheet" href="样式.css" />
  </head>
  <body >
   <div class="up"><h1 class=title>大学生兼职网</h1></div>
   <div class="main">
    <div class="up2"><h1 class="title3">个人信息简历</div></h1>
     <div class="main0 ">
      <div class=left2>
      <form action="CreateCurriculumVitae" method="post">
         <div class="txt1">
               姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：<input name="name" type="text"class="txtphone"/>
         </div> 
          
         <div class="txt1">
               出生年月：<input name="birthDate" type="text"class="txtphone"/>
         </div> 
         <div class="txt1">
               性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别：
               <select id="gender" class="txtphone">
               <option value="男">男</option>
               <option value="女">女</option>
               </select>
         </div>
         <div class="txt1">  
               个人学历：<select id="educationalQualification" class="txtphone">
               <option value="中专在读">中专在读</option>
               <option value="高中在读">高中在读</option>
               <option value="专科在读">专科在读</option>
               <option value="本科在读">本科在读</option>
               <option value="研究生在读">研究生在读</option>
               </select>
        </div> 
        <div class="txt1">     
                工作时间： <select id="payTime" class="txtphone">
               <option value="小时">小时</option>
               <option value="日">日</option>
               <option value="周">周</option>
               <option value="月">月</option>
               </select>
        </div> 
        </div>
        <div class="right2">
        <div class="txt1">
               区&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp域：<input name="areaId" type="text"class="txtphone"/>
        </div>
        <div class="txt1">
               毕业院校：<input name="" type="text"class="txtphone"/>
         </div>
        <div class="txt1">
               个人邮箱：<input name="" type="text"class="txtphone"/>
        </div> 
        <div class="txt1">
               联系电话：<input name="phoneNumber" type="text"class="txtphone"/>
        </div> 
        <div class="txt1"><input type="submit" id="input" value="提交" class="tijiao"></div>
         </form>
        </div> 
     </div>
    </div>
  </body>
</html>
