<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1>게시물 답변 달기</h1>
  <form class="form-horizontal" action="replysave" method="post">
  <c:forEach items="${list }" var="my">
  <input type="hidden" name="groups" value="${my.groups}">
  <input type="hidden" name="step" value="${my.step}">
  <input type="hidden" name="indent" value="${my.indent}">
    <div class="form-group">
      <label class="control-label col-sm-2" for="writer">작성자 :</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="writer" placeholder="${my.writer }" name="writer">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목 :</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="title" placeholder="${my.title }" name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용 :</label>
      <div class="col-sm-10">
        <textarea rows="10" cols="120" name="content" id="content" placeholder="${my.content }"></textarea>
      </div>
    </div>
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" value="전송"/>
        <button onclick="location.href='boardout'" type="button">취소</button>
    </div>
    </c:forEach>
  </form>
</div>
</body>
</html>