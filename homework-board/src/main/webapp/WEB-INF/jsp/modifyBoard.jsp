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
	<h1>modify Board</h1>
	<form action="/modifyBoard" method="post">
		<label for="boardNo">��ȣ</label>
		<input class="form-control" name="boardNo" value="${board.boardNo}" readonly>
		<hr>
		<label for="boardTitle">����</label>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}"  >
		<hr>
		<label for="boardContent">����</label>
		<textarea class="form-control" name="boardContent" value="${board.boardContent}"></textarea>
		<hr>
		<label for="boardUser">�۾���</label>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr>
		<label for="boardPw">��й�ȣ</label>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-primary" type="submit">�� �����Ϸ�</button> 
	</form>
	<hr>
	<a class="btn btn-danger" href="/removeBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<a class="btn btn-success" href="/boardList">������ ���ư���</a>
</body>
</html>