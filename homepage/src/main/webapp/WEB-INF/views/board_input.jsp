<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <h1>게시물 등록</h1>
  <form class="form-horizontal" action="board_inputsave" method="post">
    <div class="form-group">
      <label class="control-label col-sm-2" for="title">제목 :</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="title" placeholder="Enter title" name="title">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="content">내용 :</label>
      <div class="col-sm-10">
        <textarea rows="10" cols="120" name="content" id="content" placeholder="Enter Content"></textarea>
      </div>
    </div>
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" value="전송"/>
        <button onclick="location.href='index'" type="button">취소</button>
    </div>
  </form>
</div>
</body>
</html>