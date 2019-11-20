<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="container">
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1>Spring Board Project</h1>
	<hr>
	페이지 리스트
	<ul class="navbar-nav">
		<li class="nav-item"><a class="btn btn-light" href="/boardList">보드 리스트</a></li>
		<li class="nav-item"><a class="btn btn-light" href="/addBoard">보드 추가</a></li>
		<li class="nav-item"><a class="btn btn-light" href="/modifyBoard">보드 수정</a></li>
		<li class="nav-item"><a class="btn btn-light" href="/removeBoard">보드 삭제</a></li>
	</ul>
	<hr>
</body>
</html>