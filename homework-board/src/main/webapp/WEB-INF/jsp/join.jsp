<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
</head>
<body class="container">
	<br>
	<div class="card shadow-lg p-5 m-5 mx-5">
		<h1 class="font-weight-bold text-center">회원가입</h1>
		<form class="was-validated card-body">
		  <div class="form-group">
		    <label for="id">아이디</label>
		    <input type="email" class="form-control" id="id" placeholder="E-Mail@example.com" name="memberId" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">이메일 입력해주세요.</div>
		  </div>
		  <div class="form-group">
		    <label for="name">닉네임</label>
		    <input type="text" class="form-control" id="name" placeholder="이름" name="memberName" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">닉네임을 입력해주세요.</div>
		  </div>
		  <div class="form-group">
		    <label for="pwd">비밀번호</label>
		    <input type="password" class="form-control" id="pwd" placeholder="비밀번호" name="memberPw" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">비밀번호를 입력해주세요.</div>
		  </div> 
		  <button type="button" id="join" class="btn btn-block btn-primary">입력완료</button> 
		  <!-- 입력 클릭시 인증코드 입력란 출력 -->
		  <div id="codeForm" style="display:none">
		  <p class="valid-feedback text-primary">인증 메일이 전송 되었습니다! 확인해 주세요!</p>
		  <hr>
		  	<div class="form-group">
		    	<label for="uname">인증코드</label>
		    	<input type="text" class="form-control" id="code" placeholder="인증코드를 입력해주세요" name="confirmCode" required>
		    	<div class="valid-feedback">좋아요.</div>
		    	<div class="invalid-feedback">인증 코드를 입력해주세요 🎆</div> 
		  	</div> 
		  	<button type="button" id="confirmCode" class="btn btn-block btn-outline-primary">확인</button>  
			<a href="/addMember" id="resend" class="small text-center">메일이 안왔나요?</a>
			<a href="/sendMail" class="small text-center">제게 메일을 보내주세요!</a>
		  </div>
		</form> 
	</div>
</body>
<script> 
		$("#join").click(function(){
			console.log("입력완료 메일전송 시작.");
			if($("#id").val()=="" || $("#name").val()=="" || $("#pwd").val()==""){
				alert("빈칸을 채워주세요!");
				return;
			}
			$("#codeForm").show(); 
			$('#id').prop('readonly', true); 
			$("#name").prop('readonly', true); 
			$("#pwd").prop('readonly', true); 
			$("#join").prop('disabled', true); 
			
			/* $.ajax({
				url:"/sendEmail",
				method:"POST",
				data: {"to":memberId},
				success:function(){
					console.log("메일 전송 완료 ")
					$("#codeForm").show(); 
					
					
				}
				
			}) */

		})/* 
		
		$("#confirmCode").click(function(){
			console.log("가입 완료");
			$.ajax({
				url:"/sendEmail",
				method:"POST",
				data:,
	
				})

		}) */
</script>
</html>