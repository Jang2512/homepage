<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.dropdown:hover .dropdown-menu {
    display: block;
    margin-top: 0;
}
</style>
<c:import url="cdn.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="result" value="${param.result }"/>
<c:choose>
	<c:when test="${result=='loginfail' }">
		<script type="text/javascript">
			window.onload=function(){
				alert("로그인을 하십시오.");
			}
		</script>
	</c:when>
</c:choose>

<header style="text-align: center;">
<h1 style="background-color:olive;"><a id="ti" href="index">회원 관리 프로그램</a></h1>
</header>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"><img src="img/dong.gif" width="80" height="30"/></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">회원관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="infoinput">회원등록</a></li>
          <li><a href="infoout">회원목록</a></li>         
        </ul>
      </li>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">게시판관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="boardin">게시물등록</a></li>
          <li><a href="notice">게시물목록</a></li>
        </ul>
      </li>
      <!--  -->
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">상품관리<span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="#">상품등록</a></li>
          <li><a href="#">상품목록</a></li>
          <li><a href="#">상품합계목록</a></li>
        </ul>
      </li>
      <!--  -->
      
    </ul>
    	<button class="btn btn-info navbar-btn navbar-right" onclick="location.href='index'">메인으로</button>&emsp;
    <c:choose>
    <c:when test="${islogin == true && member != null}">
    	<button class="btn btn-danger navbar-btn navbar-right" onclick="location.href='logout'">로그아웃</button>&emsp;
    </c:when>
    <c:otherwise>
    	<button class="btn btn-primary navbar-btn navbar-right" onclick="location.href='loginform'">로그인</button>&emsp;
    </c:otherwise>
    </c:choose>
    <p class="navbar-text navbar-right">
    <c:choose>
    <c:when test="${islogin == true && member != null}">
    ${member.id}님 &emsp;
    </c:when>
    <c:otherwise>
    로그인해주세요&emsp;
    </c:otherwise>
    </c:choose>
    </p>
  </div>
</nav>
</body>
</html>