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
		<h1 class="font-weight-bold text-center">���� ����</h1>
		<form action="/sendMail" method="post" class="was-validated card-body">
		  <div class="form-group">
		    <label for="to">�޴���</label>
		    <input type="text" class="form-control" id="to" placeholder="�޴»��" name="to" required>
		    <div class="valid-feedback">���ƿ�.</div>
		    <div class="invalid-feedback">�޴»�� �̸��� �ּҸ� �Է����ּ���.</div>
		  </div>
		  <div class="form-group">
		    <label for="subject">����</label>
		    <input type="text" class="form-control" id="subject" placeholder="����" name="subject" required>
		    <div class="valid-feedback">���ƿ�.</div>
		    <div class="invalid-feedback">���� �Է����ּ���.</div>
		  </div>
		  <div class="form-group">
		    <label for="content">����</label>
		    <textarea class="form-control" id="content" placeholder="����" rows="20" name="content" required></textarea>
		    <div class="valid-feedback">���ƿ�.</div>
		    <div class="invalid-feedback">������ �Է����ּ���.</div>
		  </div> 
		  <button type="submit" class="btn btn-lg btn-outline-success btn-block">����</button>
		</form> 
	</div>
</body>
</html>