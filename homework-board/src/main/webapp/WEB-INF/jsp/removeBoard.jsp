<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body class="container">
	<h1>remove Board</h1>
	<form action="/removeBoard" method="post">
		<label for="boardNo">번호</label>
		<input class="form-control" name="boardNo" value="${board.boardNo}" readonly>
		<hr>
		<label for="boardTitle">제목</label>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly >
		<hr>
		<label for="boardContent">내용</label>
		<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
		<hr>
		<label for="boardUser">글쓴이</label>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr>
		<label for="boardPw">비밀번호 확인 **</label>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-danger" type="submit">글 삭제완료</button> 
		<a class="btn btn-primary" href="/">돌아가기</a> 
	</form>
</body>
</html>