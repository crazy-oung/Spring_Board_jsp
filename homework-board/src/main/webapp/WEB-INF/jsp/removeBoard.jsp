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
	<h1>remove Board</h1>
	<form action="/removeBoard" method="post">
		<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
		<hr> 
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
		<hr>
		<label>글쓴이: </label>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr> 
		<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
		<hr>
		<c:if test="${board.boardFile != null }">
			<label>첨부 파일</label>
			<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
				${board.boardFile.originName}
			</a>
		</c:if>
		<label for="boardPw">비밀번호 확인 **</label>
		<input class="form-control" name="boardPw" type="password">
		<hr>
		<button class="btn btn-danger" type="submit">글 삭제완료</button> 
		<a class="btn btn-warning" href="/">취소</a> 
	</form>
</body>
</html>