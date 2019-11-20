<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Login</title>
</head>
<body class="container"> 
	<div class="card shadow-lg p-5 m-5">
		<h1 class="font-weight-bold text-center">메일 전송</h1>
		<form action="/sendMail" method="post" class="was-validated card-body">
		  <div class="form-group">
		    <label for="to">받는이</label>
		    <input type="text" class="form-control" id="to" placeholder="받는사람" name="to" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">받는사람 이메일 주소를 입력해주세요.</div>
		  </div>
		  <div class="form-group">
		    <label for="subject">제목</label>
		    <input type="text" class="form-control" id="subject" placeholder="제목" name="subject" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">제목 입력해주세요.</div>
		  </div>
		  <div class="form-group">
		    <label for="content">내용</label>
		    <textarea class="form-control" id="content" placeholder="내용" rows="20" name="content" required></textarea>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">내용을 입력해주세요.</div>
		  </div> 
		  <button type="submit" class="btn btn-lg btn-outline-success btn-block">전송</button>
		</form> 
	</div>
</body>
</html>