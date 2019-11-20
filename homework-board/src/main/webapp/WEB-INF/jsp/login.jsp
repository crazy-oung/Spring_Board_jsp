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
		<h1 class="font-weight-bold text-center">�α���</h1>
		<form action="/login" method="post" class="was-validated card-body">
		  <div class="form-group">
		    <label for="uname">���̵�</label>
		    <input type="text" class="form-control" id="uname" placeholder="���̵�" name="memberId" required>
		    <div class="valid-feedback">���ƿ�.</div>
		    <div class="invalid-feedback">���̵� �Է����ּ���.</div>
		  </div>
		  <div class="form-group">
		    <label for="pwd">��й�ȣ</label>
		    <input type="password" class="form-control" id="pwd" placeholder="��й�ȣ" name="memberPw" required>
		    <div class="valid-feedback">���ƿ�.</div>
		    <div class="invalid-feedback">��й�ȣ�� �Է����ּ���.</div>
		  </div> 
		  <button type="submit" class="btn btn-primary">�α���</button>
		</form>
		<a href="/addMember" class="small text-center">���� ȸ���� �ƴϽŰ���?</a>
		<a href="/sendMail" class="small text-center">���� ������ �����ּ���!</a>
	</div>
</body>
</html>