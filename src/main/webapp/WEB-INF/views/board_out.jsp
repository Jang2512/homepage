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
        <th>비고</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${viewAll}" var="my">
      <tr>
        <td>${my.num }</td>
        <td>${my.writer }</td>
        <td>
			<a href="detail?num=${my.num }">
			<c:forEach begin="1" end="${my.indent}"><%="└" %></c:forEach>${my.title }</a>
	    </td>
        <td>${my.writeday }</td>
        <td>${my.readcnt }</td>
        <td>
			<a href="delbo?num=${my.num }">삭제</a> &emsp;
			<a href="replyview?num=${my.num }">답변달기</a>
		</td>
      </tr>
      </c:forEach>
      <tr>
      	<c:if>
      	</c:if>
      		
      	</c:forEach>
      </tr>
    </tbody>
  </table>
</body>
</html>