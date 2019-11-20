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
	<a href="/logout">�α׾ƿ�</a>
	<a href="/removeMember">Ż���ϱ�</a>
	<h1>add Board</h1>
	<hr>
	<form action="/addBoard" method="post" enctype="multipart/form-data">
		<label>����</label>
		<input class="form-control" name="boardTitle">
		<hr>
		<label>����</label>
		<input class="form-control" name="boardContent">
		<hr>
		<label>�̸�</label>
		<input class="form-control" name="boardUser">
		<hr>
		<label>���</label>
		<input class="form-control" type="password" name="boardPw">
		<div class="custom-file">
		    <input type="file" class="custom-file-input" name="boardFile">
			<label class="custom-file-label" for="customFile">÷�������� �ø����� Ŭ���ϼ���</label>
		</div>
		<hr>
		<button class="btn btn-success" type="submit">�Է� �Ϸ� </button>
	</form>
	<hr>
	<a class="btn btn-warning" href="/boardList">���</a>
</body>
<script>
// ÷������ �Է¶� �ؽ�Ʈ ����
$(".custom-file-input").on("change", function() {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});
</script>
</html>