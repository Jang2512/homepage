<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#container{   border: 0px solid #bcbcbc;   }
#header{background-color: lightgreen;position: fixed;
top:0px;height:90px;line-height: 90px }
#body{   width:80%;text-align:center;
top:90px;height:80%;
margin-left:150px;
padding-left: 150px;   }
#footer{
clear:both;
width:100%;
height:35px;
line-height:30px;
font-size:20px;
color:#000000;
border : 0px solid  #bcbcbc;
background-color: lightblue;
position: fixed;
bottom: 0px;
text-align: center;
}
</style>
<meta charset="UTF-8">
<body >
   <div id="container">
         <div id="top">
            <tiles:insertAttribute name="top"/> 
         </div>
         <div id="body">
            <tiles:insertAttribute name="body" ignore="true"/> 
         </div>
         <div id="footer">
            <tiles:insertAttribute name="footer"/> 
         </div>

   </div>
</body>
</html>