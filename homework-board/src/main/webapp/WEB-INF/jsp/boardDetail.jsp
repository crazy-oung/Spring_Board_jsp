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
	<a href="/logout">�α׾ƿ�</a>
	<a href="/removeMember">Ż���ϱ�</a>
	<h1 class="text-center font-weight-bold">�� �� ����</h1>
	<hr> 
	<b>�۹�ȣ</b>
	<input class="form-control" name="boardNo" id="boardNo" value="${board.boardNo}" readonly>
	<hr> 
	<b>����</b>
	<input class="form-control" name="boardTitle" value="${board.boardTitle}" readonly>
	<hr>
	<b>�۾���</b>
	<input class="form-control" name="boardUser" value="${board.boardUser}" readonly>
	<hr> 
	<b>�۳���</b>
	<textarea class="form-control" name="boardContent" readonly>${board.boardContent}</textarea>
	<hr>
	<c:if test="${board.boardFile != null }">
		<b>÷�� ����</b>
		<a href="/upload/${board.boardFile.fileName}.${board.boardFile.extension}">
			${board.boardFile.originName}
		</a>
		<hr>
	</c:if>	
	<a class="btn btn-success" href="/boardList">������� ���ư���</a>
	<a class="btn btn-warning" href="/modifyBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<a class="btn btn-danger" href="/removeBoard?boardNo=${board.boardNo}">�� �����Ϸ� ����</a>
	<hr> 
	<textarea class="form-control" id="commentContent" placeholder="�ڸ�Ʈ�� ����÷��� ����� �г��� ��й�ȣ�� �Է��Ͻ��� ��� ��ư�� Ŭ�����ּ���."></textarea>
	<div class="input-group mb-3"> 
		<div class="input-group-prepend">
	    	<span class="input-group-text">�г���</span>
	  	</div>
	  	<input type="text" class="form-control" id="commentUser" placeholder="�г���">
	  	<div class="input-group-prepend">
	    	<span class="input-group-text">��й�ȣ</span>
	  	</div>
	  	<input type="text" class="form-control" id="commentPw" placeholder="��й�ȣ">
	  	<div class="input-group-append">
			<button class="btn btn-success" id="addComment">���</button>
		</div>
	</div>
 
	<hr>  
 	 <p class="text-center">�ڸ�Ʈ ���</p>
	 <table class="table table-stripped text-center" id="comments">
		<tr>
			<th width="20%">�г���</th>
			<th>����</th>			
			<th width="20%"></th>
			<th width="10%"></th>
		</tr>
	</table> 
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
//���� ����Ʈ
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
			html += "<input class='form-control' type='password' placeholder='��й�ȣ Ȯ��'>";
			html += "</td><td>"; 
			html += "<button class='btn btn-danger' id='removeComment' value='"+item.commentNo+"'>����</button>";
			html += "</td></tr>";
			$("#comments").append(html);
		})
	}, 
}); 

//���� ���� 
$("#removeComment").click(function(){
	console.log("������ �ڸ�Ʈ�� ��ȣ : ",this.value, "??? ", $(this).prev().val() );

});

//���� �߰�
$("#addComment").click(function(){
	console.log("lets add comment!");
	//�� ������ �ڸ�Ʈ ��� ���
	if($("#commentContent").val() =="" || $("#commentPw").val()==""){
		alert("��ĭ�� ä���ּ��� !");	
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
			alert("�ڸ�Ʈ ��� �Ϸ� !"); 
			location.reload();
		},
	})
});

$(document).ready(function(){
	
	
});
</script>
</html>