<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Board List</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body class="container">
	<h1>list of Board </h1>
	<p>��ü �� ����:<b>${map.totalRow}</b></p>
	<hr>
	<form action="/boardList" method="post" class="input-group mb-3"><!-- �˻� -->
		<input type="text" class="form-control" name="searchWord" placeholder="Search">
	  	<div class="input-group-append">
	    	<button class="btn btn-success" type="submit">�˻�</button>
	  	</div>
	</form>
	<hr>
	<table class="table table-hover table-bordered"> 
		<tr>
			<th>����</th>
			<th>�۾���</th>
			<th>��¥</th>
		</tr>
		<c:forEach var="board" items="${map.list}">
			<tr>
				<td>
					<a href="${pageContext.request.contextPath}/boardDetail?boardNo=${board.boardNo}">${board.boardTitle}</a>
				</td>
				<td>${board.boardUser}</td>
				<td>${board.boardDate}</td>
			<tr>
		</c:forEach>
	</table>
	<hr>
	<a class="btn btn-primary" href="/addBoard"> �� �Է� </a>
	<hr>
	<div class="d-flex justify-content-around">
		<c:if test="${map.currentPage > 1}">
			<a class="btn btn-primary" href="/boardList?currentPage=${map.currentPage-1}&searchWord=${map.searchWord}">����</a>
		</c:if>
		<c:if test="${map.currentPage < map.lastPage}">
			<a class="btn btn-primary" href="/boardList?currentPage=${map.currentPage+1}&searchWord=${map.searchWord}">����</a>
		</c:if>
	</div>
</body>
</html>