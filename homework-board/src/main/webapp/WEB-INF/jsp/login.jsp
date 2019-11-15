<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Login</title>
</head>
<body class="login">
	<form action="/login" metho="post" class="was-validated">
	  <div class="form-group">
	    <label for="uname">아이디:</label>
	    <input type="text" class="form-control" id="uname" placeholder="" name="memberId" required>
	    <div class="valid-feedback">좋아요.</div>
	    <div class="invalid-feedback">아이디를 입력해주세요.</div>
	  </div>
	  <div class="form-group">
	    <label for="pwd">비밀번호:</label>
	    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="memberPw" required>
	    <div class="valid-feedback">좋아요.</div>
	    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
	  </div> 
	  <button type="submit" class="btn btn-primary">로그인</button>
	</form>
</body>
</html>