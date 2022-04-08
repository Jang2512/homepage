<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{
text-align: center;
}
thead{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table class="table table-bordered">
    <thead>
      <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list }" var="my">
      <tr>
        <td>${my.num }</td>
        <td>${my.writer }</td>
        <td>${my.title }</td>
        <td>${my.writeday }</td>
        <td>${my.readcnt }</td>
      </tr>
      <tr>
      <th>내용</th>
      <td colspan="4"><textarea cols="130" rows="5" readonly="readonly">${my.content }</textarea></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
  <form action="commentinput" method="get">
  <br>댓글 작성<br>
  작성자 <input type="text" name="writer"><br>
  댓글 <input type="text" name="con"><br>
  <input type="submit" value="댓글 달기">
  </form>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>작성자</th>
        <th>댓글</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${comlist }" var="com">
      <tr>
        <td>${com.writer }</td>
        <td>${com.con}</td>
        <td><a href="comdel?comnum=${com.comnum }">삭제</a></td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>