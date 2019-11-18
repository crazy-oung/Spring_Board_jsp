<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body class="container">
	<a href="/logout">로그아웃</a>
	<a href="/removeMember">탈퇴하기</a>
	<h1 class="text-center font-weight-bold">글 상세 정보</h1>
	<hr> 
	<b>글번호</b>
	<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
	<hr> 
	<b>제목</b>
	<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
	<hr>
	<b>글쓴이</b>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr> 
	<b>글내용</b>
	<textarea class="form-control" name="boardContent" readonly>${board.boardContent}</textarea>
	<hr>
	<c:if test="${board.boardFile != null }">
		<b>첨부 파일</b>
		<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
			${board.boardFile.originName}
		</a>
		<hr>
	</c:if>	
	<a class="btn btn-success" href="/boardList">목록으로 돌아가기</a>
	<a class="btn btn-warning" href="/modifyBoard?boardNo=${board.boardNo}">글 수정하러 가기</a>
	<a class="btn btn-danger" href="/removeBoard?boardNo=${board.boardNo}">글 삭제하러 가기</a>
	<hr> 
	<textarea class="form-control" id="commentContent" placeholder="코멘트를 남기시려면 내용과 닉네임 비밀번호를 입력하신후 등록 버튼을 클릭해주세요."></textarea>
	<div class="input-group mb-3"> 
		<div class="input-group-prepend">
	    	<span class="input-group-text">닉네임</span>
	  	</div>
	  	<input type="text" class="form-control" id="commentUser" placeholder="닉네임">
	  	<div class="input-group-prepend">
	    	<span class="input-group-text">비밀번호</span>
	  	</div>
	  	<input type="text" class="form-control" id="commentPw" placeholder="비밀번호">
	  	<div class="input-group-append">
			<button class="btn btn-success" id="addComment">등록</button>
		</div>
	</div>
 
	<hr>  
 	 <p class="text-center">코멘트 목록</p>
	 <table class="table table-stripped text-center" id="comments">
		<tr>
			<th width="20%">닉네임</th>
			<th>내용</th>			
			<th width="20%"></th>
			<th width="10%"></th>
		</tr>
	</table> 
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
//덧글 리스트
$.ajax({
	url:"/rest/getCommentList",
	data: {"boardNo": $("#boardNo").val() },
	method :"GET",
	success: function(json){
		console.log(json);
		$(json).each(function(index, item){
			let html = "<tr><td>";
			html += item.commentUser;
			html += "</td><td>";
			html += item.commentContent;
			html += "</td><td>";
			html += "<input class='form-control' type='password' placeholder='비밀번호 확인'>";
			html += "</td><td>"; 
			html += "<button class='btn btn-danger' id='removeComment' value='"+item.commentNo+"'>삭제</button>";
			html += "</td></tr>";
			$("#comments").append(html);
		})
	}, 
}); 

//덧글 삭제 
$("#removeComment").click(function(){
	console.log("삭제할 코멘트의 번호 : ",this.value, "??? ", $(this).prev().val() );

});

//덧글 추가
$("#addComment").click(function(){
	console.log("lets add comment!");
	//빈 내용은 코멘트 등록 취소
	if($("#commentContent").val() =="" || $("#commentPw").val()==""){
		alert("빈칸을 채워주세요 !");	
		return;
	}
	
	$.ajax({
		url: "/rest/addComment",
		method:"POST",
		data: {
			"commentContent":  $("#commentContent").val(),
			"commentUser" : $("#commentUser").val(),
			"boardNo" : $("#boardNo").val(),
			"commentPw" : $("#commentPw").val()
		},
		success:function(json){
			console.log(json);
			alert("코멘트 등록 완료 !"); 
			location.reload();
		},
	})
});

$(document).ready(function(){
	
	
});
</script>
</html>