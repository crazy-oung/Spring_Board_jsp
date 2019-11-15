<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body class="container">
	<h1>detail of Board</h1>
	<hr>
	<label for="boardNo">��ȣ</label>
	<input class="form-control" name="boardNo" value="${board.boardNo}" readonly>
	<hr>
	<label for="boardTitle">����</label>
	<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
	<hr>
	<label for="boardContent">����</label>
	<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
	<hr>
	<label for="boardUser">�۾���</label>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr>
	<a class="btn btn-primary" href="/modifyBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<a class="btn btn-primary" href="/removeBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<hr>
	<input value="${board.boardNo}" id="boardNo" hidden="hidden">
	<textarea class="form-control" id="commentContent" placeholder="������ �Է����ּ���"></textarea>
	<label for="commentUser">�г���</label>
	<input class="form-control" id="commentUser" type="text" >
	<label for="commentPw">��й�ȣ</label>
	<input class="form-control" id="commentPw" type="password"> 
	<button class="btn btn-success" id="addComment">��۴ޱ�</button>
	<hr>
	���� ���	
	<table id="comments"></table>
</body>
<script>
	$.ajax(function(){
		url: "/rest/commentList",
		method:"GET",
		success:function(){

		},
	})
</script>
</html>