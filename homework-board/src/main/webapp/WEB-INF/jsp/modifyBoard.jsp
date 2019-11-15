<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
		<hr> 
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" >
		<hr>
		<label>�۾���: </label>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr> 
		<textarea class="form-control" name="boardContent" value="${board.boardContent}" ></textarea>
		<hr> 
		<label>÷�� ����</label>
		<input class="form-control" type="file" value="/upload/${board.boardFile.fileName}.${board.boardFile.extension}" name="boardFile">
		<hr>
		<button class="btn btn-primary" type="submit">�� �����Ϸ�</button> 
	</form>
	<hr>
	<a class="btn btn-danger" href="/removeBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<a class="btn btn-success" href="/boardList">������ ���ư���</a>
</body>
</html>