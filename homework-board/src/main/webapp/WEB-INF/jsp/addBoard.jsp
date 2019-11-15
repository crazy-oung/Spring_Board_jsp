<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="container">
	<h1>add Board</h1>
	<hr>
	<form action="/addBoard" method="post">
		<label for="boardTitle">제목</label>
		<input class="form-control" name="boardTitle">
		<hr>
		<label for="boardContent">내용</label>
		<input class="form-control" name="boardContent">
		<hr>
		<label for="boardUser">이름</label>
		<input class="form-control" name="boardUser">
		<hr>
		<label for="boardPw">비번</label>
		<input class="form-control" type="password" name="boardPw">
		<hr>
		<button class="btn btn-success" type="submit">입력 완료 </button>
	</form>
	<hr>
</body>
</html>