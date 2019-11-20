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
	<br>
	<div class="card shadow p-5 m-5">
		<h1 class="font-weight-bold text-center">환영합니다!</h1>
		<form action="/login" method="post" class="was-validated card-body">
		  <div class="form-group">
		    <label for="uname">인증코드</label>
		    <input type="text" class="form-control" id="uname" placeholder="인증코드를 입력해주세요" name="confirmCode" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">인증 코드를 입력해주세요 🎆</div>
		  </div> 
		  <button type="submit" class="btn btn-block btn-outline-primary">로그인</button>
		</form> 
		<a href="/sendMail" class="small text-center">제게 메일을 보내주세요!</a>
	</div>
</body>
</html>