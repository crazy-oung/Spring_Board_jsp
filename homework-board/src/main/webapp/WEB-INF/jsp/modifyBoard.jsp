<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body class="container">
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1 class="text-center">글 수정</h1>
	<form action="/modifyBoard" method="post">
		<b>글 번호</b>
		<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
		<hr> 
		<b>제목</b>
		<input class="form-control" name="boardTitle" value="${board.boardTitle}" >
		<hr>
		<b>글쓴이</b>
		<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
		<hr> 
		<textarea class="form-control" name="boardContent">${board.boardContent}</textarea>
		<hr> 
		<div class="custom-file">
		    <input type="file" class="custom-file-input" name="boardFile">
			<label class="custom-file-label" for="customFile">첨부파일을 올리려면 클릭하세요</label>
		</div>
		<hr>
		<button class="btn btn-primary" type="submit">글 수정완료</button> 
	</form>
	<hr>
	<a class="btn btn-danger" href="/removeBoard?boardNo=${board.boardNo}">글 삭제하러 가기</a>
	<a class="btn btn-success" href="/boardList">목륵으로 돌아가기</a>
</body>
<script>
// 첨부파일 입력란 텍스트 변경
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
</html>