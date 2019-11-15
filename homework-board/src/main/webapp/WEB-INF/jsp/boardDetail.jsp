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
	<label>�۾���: </label>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr> 
	<textarea class="form-control" name="boardContent" value="${board.boardContent}" readonly></textarea>
	<hr>
	<c:if test="${board.boardFile != null }">
		<label>÷�� ����</label>
		<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
			${board.boardFile.originName}
		</a>
	</c:if>
	<hr>
	<a class="btn btn-primary" href="/modifyBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<a class="btn btn-primary" href="/removeBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<hr> 
	<textarea class="form-control" id="commentContent" placeholder="������ �Է����ּ���"></textarea>
	<label for="commentUser">�г���</label>
	<input class="form-control" id="commentUser" type="text" >
	<label for="commentPw">��й�ȣ</label>
	<input class="form-control" id="commentPw" type="password"> 
	<button class="btn btn-success" id="addComment">��۴ޱ�</button>
	<hr>
	���� ���	
	<table class="table" id="comments"></table>
</body>
<script>
$(document).ready(function(){
	// ���� ����Ʈ
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
				html += "<button class='btn btn-light' id='removeComment' value='"+item.commentNo+"'>����</button>";
				html += "</td></tr>";
				$("#comments").append(html);
			})
		},
	}); 
	
// ���� ���� 
	$("#removeComment").click(function(){
		console.log("������ �ڸ�Ʈ�� ��ȣ : ",this.value, "??? ", $(this).prev().val() );

	)};
	
// ���� �߰�
	$("#addComment").click(function(){
		console.log("lets add comment!");
		//�� ������ ������ �� �� �����ϴ�.
		if($("#commentContent").val() =="" || $("#commentPw").val()==""){
			alert("��ĭ�� ä���ּ��� !");	
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