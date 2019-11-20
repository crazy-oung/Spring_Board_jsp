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
	<div class="card shadow p-5 m-5 mx-5">
		<h1 class="font-weight-bold text-center">로그인</h1>
		<form action="/login" method="post" class="was-validated card-body">
		  <div class="form-group">
		    <label for="uname">아이디</label>
		    <input type="text" class="form-control" id="uname" placeholder="아이디" name="memberId" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">아이디를 입력해주세요.</div>
		  </div>
		  <div class="form-group">
		    <label for="pwd">비밀번호</label>
		    <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="memberPw" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
		  </div> 
		  <button type="submit" class="btn btn-primary">로그인</button>
		</form>
		<a href="/addMember" class="small text-center">아직 회원이 아니신가요?</a>
		<a href="/sendMail" class="small text-center">제게 메일을 보내주세요!</a>
	</div>
</body>
</html>