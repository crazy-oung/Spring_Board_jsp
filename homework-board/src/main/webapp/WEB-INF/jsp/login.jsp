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
	    <label for="uname">���̵�:</label>
	    <input type="text" class="form-control" id="uname" placeholder="" name="memberId" required>
	    <div class="valid-feedback">���ƿ�.</div>
	    <div class="invalid-feedback">���̵� �Է����ּ���.</div>
	  </div>
	  <div class="form-group">
	    <label for="pwd">��й�ȣ:</label>
	    <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="memberPw" required>
	    <div class="valid-feedback">���ƿ�.</div>
	    <div class="invalid-feedback">��й�ȣ�� �Է����ּ���.</div>
	  </div> 
	  <button type="submit" class="btn btn-primary">�α���</button>
	</form>
</body>
</html>