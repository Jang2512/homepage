<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<c:import url="cdn.jsp"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1>회원 수정</h1>
  <form class="form-horizontal" action="modifyb" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="id">ID :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="id" placeholder="Enter id" name="id" value="${id }" readonly="readonly">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">Password:</label>
      <div class="col-sm-10">          
        <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">Name :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="tel">Tel :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="tel" placeholder="Enter tel" name="tel">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">email :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="email" placeholder="Enter email" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="adr">address :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="adr" placeholder="Enter adr" name="adr">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="birth">Birth :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="birth" placeholder="Enter birth" name="birth">
      </div>
    </div>      
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" value="전송">
        <button onclick="location.href='main'">취소</button>
    </div>
  </form>
</div>

</body>
</html>