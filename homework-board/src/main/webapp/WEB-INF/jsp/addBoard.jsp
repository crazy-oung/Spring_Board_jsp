<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body class="container">
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1>add Board</h1>
	<hr>
	<form action="/addBoard" method="post" enctype="multipart/form-data">
		<label>제목</label>
		<input class="form-control" name="boardTitle">
		<hr>
		<label>내용</label>
		<input class="form-control" name="boardContent">
		<hr>
		<label>이름</label>
		<input class="form-control" name="boardUser">
		<hr>
		<label>비번</label>
		<input class="form-control" type="password" name="boardPw">
		<div class="custom-file">
		    <input type="file" class="custom-file-input" name="boardFile">
			<label class="custom-file-label" for="customFile">첨부파일을 올리려면 클릭하세요</label>
		</div>
		<hr>
		<button class="btn btn-success" type="submit">입력 완료 </button>
	</form>
	<hr>
	<a class="btn btn-warning" href="/boardList">취소</a>
</body>
<script>
// 첨부파일 입력란 텍스트 변경
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
</html>