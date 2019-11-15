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
		<label for="boardNo">��ȣ</label>
		<input class="form-control" name="boardNo" value="${board.boardNo}" readonly>
		<hr>
		<label for="boardTitle">����</label>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly >
		<hr>
		<label for="boardContent">����</label>
		<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
		<hr>
		<label for="boardUser">�۾���</label>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr>
		<label for="boardPw">��й�ȣ Ȯ�� **</label>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-danger" type="submit">�� �����Ϸ�</button> 
		<a class="btn btn-primary" href="/">���ư���</a> 
	</form>
</body>
</html>