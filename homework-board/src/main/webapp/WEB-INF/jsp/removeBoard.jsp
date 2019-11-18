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
	<a href="/logout">�α׾ƿ�</a>
	<a href="/removeMember">Ż���ϱ�</a>
	<h1>remove Board</h1>
	<form action="/removeBoard" method="post">
		<b>�۹�ȣ</b>
		<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
		<hr> 
		<b>������</b>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
		<hr>
		<b>�۾���</b>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr> 
		<b>�۳���</b>
		<textarea class="form-control" name="boardContent" readonly>${board.boardContent}</textarea>
		<hr>
		<c:if test="${board.boardFile != null }">
			<label>÷�� ����</label>
			<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
				${board.boardFile.originName}
			</a>
		</c:if>
		<b>��й�ȣ Ȯ�� **</b>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-danger" type="submit">�� �����ϱ�</button> 
		<a class="btn btn-warning" href="/">���</a> 
	</form>
</body>
</html>