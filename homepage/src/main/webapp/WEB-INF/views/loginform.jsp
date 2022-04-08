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

<c:set var="result" value="${param.result }"/>
<c:choose>
	<c:when test="${result=='loginfail' }">
		<script type="text/javascript">
			window.onload=function(){
				alert("아이디나 패스워드가 잘못 입력되었습니다.");
			}
		</script>
	</c:when>
</c:choose>

<form action="login" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" id="id" name="id">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" name="pw">
    </div>
    <input type="submit" value="로그인">
  </form>
</body>
</html>