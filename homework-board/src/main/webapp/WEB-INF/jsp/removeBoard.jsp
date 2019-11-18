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
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1>remove Board</h1>
	<form action="/removeBoard" method="post">
		<b>글번호</b>
		<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
		<hr> 
		<b>글제목</b>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
		<hr>
		<b>글쓴이</b>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr> 
		<b>글내용</b>
		<textarea class="form-control" name="boardContent" readonly>${board.boardContent}</textarea>
		<hr>
		<c:if test="${board.boardFile != null }">
			<label>첨부 파일</label>
			<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
				${board.boardFile.originName}
			</a>
		</c:if>
		<b>비밀번호 확인 **</b>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-danger" type="submit">글 삭제하기</button> 
		<a class="btn btn-warning" href="/">취소</a> 
	</form>
</body>
</html>