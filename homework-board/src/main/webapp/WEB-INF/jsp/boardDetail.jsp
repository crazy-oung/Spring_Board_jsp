<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body class="container">
	<h1>detail of Board</h1>
	<hr> 
	<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
	<hr> 
	<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
	<hr>
	<label>글쓴이: </label>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr> 
	<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
	<hr>
	<c:if test="${board.boardFile != null }">
		<label>첨부 파일</label>
		<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
			${board.boardFile.originName}
		</a>
	</c:if>
	<hr>
	<a class="btn btn-primary" href="/modifyBoard?boardNo=${board.boardNo}">글 수정하러 가기</a>
	<a class="btn btn-primary" href="/removeBoard?boardNo=${board.boardNo}">글 삭제하러 가기</a>
	<hr> 
	<textarea class="form-control" id="commentContent" placeholder="덧글을 입력해주세요"></textarea>
	<label for="commentUser">닉네임</label>
	<input class="form-control" id="commentUser" type="text" >
	<label for="commentPw">비밀번호</label>
	<input class="form-control" id="commentPw" type="password"> 
	<button class="btn btn-success" id="addComment">댓글달기</button>
	<hr>
	덧글 목록	
	<table class="table" id="comments"></table>
</body>
<script>
$(document).ready(function(){
	// 덧글 리스트
	$.ajax({
		url:"/rest/getCommentList",
		data: {"boardNo": $("#boardNo").val() },
		method :"POST",
		success:function(json){
			$(json).each(function(index, item){
				let html = "<tr><td>";
				html += item.commentContent;
				html += "</td><td>";
				html += item.commentUser;
				html += "</td><td>";
				html += "<input class='form-control' type='password'>";
				html += "<button class='btn btn-light' id='removeComment' value='"+item.commentNo+"'>삭제</button>";
				html += "</td></tr>";
				$("#comments").append(html);
			})
		},
	}); 
	
// 덧글 삭제 
	$("#removeComment").click(function(){
		console.log("삭제할 코멘트의 번호 : ",this.value, "??? ", $(this).prev().val() );

	)};
	
// 덧글 추가
	$("#addComment").click(function(){
		console.log("lets add comment!");
		//빈 내용은 덧글을 달 수 없습니다.
		if($("#commentContent").val() =="" || $("#commentPw").val()==""){
			alert("빈칸을 채워주세요 !");	
			return;
		}
		
		$.ajax({
			url: "/rest/addComment",
			method:"POST",
			data: {
				"commentContent", $("#commentContent").val(),
				"commentUser", $("#commentUser").val(),
				"boardNo", $("#boardNo").val(),
				"commentPw", $("#commentPw").val()
			}
			success:function(json){
				alert(json);
			},
		})
	});
	
});
</script>
</html>