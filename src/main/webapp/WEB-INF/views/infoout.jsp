<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <table class="table table-bordered">
    <thead>
      <tr>
        <th>아이디</th>
        <th>비밀번호</th>
        <th>이름</th>
        <th>전화번호</th>
        <th>이메일</th>
        <th>주소</th>
        <th>생일</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list}" var="my">
      <tr>
        <td>${my.id }</td>
        <td>${my.pw }</td>
        <td>${my.name }</td>
        <td>${my.tel }</td>
        <td>${my.email }</td>
        <td>${my.adr }</td>
        <td>${my.birth }</td>
        <td><a href="modifya?id=${my.id }">수정</a> &emsp;
			<a href="del?id=${my.id }">삭제</a>
		</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>
</body>
</html>