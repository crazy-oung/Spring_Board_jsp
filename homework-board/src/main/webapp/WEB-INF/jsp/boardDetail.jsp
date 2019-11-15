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
	<label for="boardNo">번호</label>
	<input class="form-control" name="boardNo" value="${board.boardNo}" readonly>
	<hr>
	<label for="boardTitle">제목</label>
	<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
	<hr>
	<label for="boardContent">내용</label>
	<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
	<hr>
	<label for="boardUser">글쓴이</label>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr>
	<a class="btn btn-primary" href="/modifyBoard?boardNo=${board.boardNo}">글 수정하러 가기</a>
	<a class="btn btn-primary" href="/removeBoard?boardNo=${board.boardNo}">글 삭제하러 가기</a>
	<hr>
	<input value="${board.boardNo}" id="boardNo" hidden="hidden">
	<textarea class="form-control" id="commentContent" placeholder="덧글을 입력해주세요"></textarea>
	<label for="commentUser">닉네임</label>
	<input class="form-control" id="commentUser" type="text" >
	<label for="commentPw">비밀번호</label>
	<input class="form-control" id="commentPw" type="password"> 
	<button class="btn btn-success" id="addComment">댓글달기</button>
	<hr>
	덧글 목록	
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