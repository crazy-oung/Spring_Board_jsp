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
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1 class="font-weight-bold text-center">게시판 글 목록</h1>
	<p class="text-center">전체 행 개수:<b>${map.totalRow}</b></p>
	<hr>
	<form action="/boardList" method="post" class="input-group mb-3"><!-- 검색 -->
		<input type="text" class="form-control" name="searchWord" placeholder="검색하려면 글을 입력한 후 검색버튼을 클릭해요">
	  	<div class="input-group-append">
	    	<button class="btn btn-success" type="submit">검색</button>
	  	</div>
	</form>
	<hr>
	<table class="table table-hover table-bordered text-center"> 
		<tr>
			<th width="8%">번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>날짜</th>
		</tr>
		<c:forEach var="board" items="${map.list}">
			<tr>
				<td>${board.boardNo}</td>
				<td>
					<a href="${pageContext.request.contextPath}/boardDetail?boardNo=${board.boardNo}">${board.boardTitle}</a>
				</td>
				<td width="20%">${board.boardUser}</td>
				<td width="20%">${board.boardDate}</td>
			<tr>
		</c:forEach>
	</table>
	<hr>
	<a class="btn btn-primary" href="/addBoard"> 글 입력 </a>
	<hr>
	<div class="d-flex justify-content-around">
		<c:if test="${map.currentPage > 1}">
			<a class="btn btn-primary" href="/boardList?currentPage=${map.currentPage-1}&searchWord=${map.searchWord}">이전</a>
		</c:if>
		<c:if test="${map.currentPage < map.lastPage}">
			<a class="btn btn-primary" href="/boardList?currentPage=${map.currentPage+1}&searchWord=${map.searchWord}">다음</a>
		</c:if>
	</div>
</body>
</html>