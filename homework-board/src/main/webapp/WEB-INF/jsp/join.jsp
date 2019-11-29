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
		<form class="was-validated card-body" >
		  <div class="form-group">
		    <label for="id">아이디</label>
		    <input type="email" class="form-control" id="id" placeholder="E-Mail@example.com" name="memberId" required>
		    <div class="valid-feedback">좋아요.</div>
		    <div class="invalid-feedback">올바른 이메일을 입력해주세요.</div>
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
		  <button type="button" class="btn btn-block btn-success join">인증메일 받기</button> 
		 </form> 
		  <!-- 입력 클릭시 인증코드 입력란 출력 -->
		  <b class="text-sm card my-3 p-3 text-center text-primary shadow" id="notice" style="display:none">인증 메일이 전송 되었습니다! 확인해 주세요!</b>
		  <form class="was-validated card-body" > 
			  <div id="codeForm" style="display:none">	  
			  	<div class="form-group">
			    	<label for="uname">인증코드</label>
			    	<input type="text" class="form-control" id="code" placeholder="인증코드를 입력해주세요" name="confirmCode" required>
			    	<div class="valid-feedback">좋아요.</div>
			    	<div class="invalid-feedback">인증 코드를 입력해주세요 🎆</div> 
			  	</div> 
			  	<button type="button" id="confirmCode" class="btn btn-block btn-outline-primary">확인</button>  
				<a href="/sendMail" id="resend" class="small text-center">메일이 안왔나요?</a>
				<a href="/sendMail" class="small text-center">제게 메일을 보내주세요!</a>
			  </div>
		  </form>
		  <div class="card my-3 p-3 text-center shadow" style="display:none" id="joinComplete">
			  <h3 class="my-3 p-3 text-center text-success font-weight-bold" id="ok"></h3>
			  <a href="/login" class="font-weight-bold" id="toLogin"></a>
		  </div> 
	</div>
</body>
<script> 
		$(".join").click(function(){
			console.log("입력완료 메일전송 시작.");
			if($("#id").val()=="" || $("#name").val()=="" || $("#pwd").val()==""){
				alert("빈칸을 채워주세요!");
				return;
			} 
			
			$.ajax({
				url:"/rest/sendEmailToConfirm",
				data:{ "memberId" : $("#id").val() , "memberName" : $("#name").val() },
				method:"post", 
				success:function(){
					console.log("메일 전송 완료!")
					$("#notice").fadeIn(300); 
					setTimeout(function() {
						$("#codeForm").slideDown(500); 
					}, 300);			
					
					$('#id').prop('readonly', true); 
					$("#name").prop('readonly', true); 
					$("#pwd").prop('readonly', true);  
					$(".join").prop('disabled', true);  
					
					console.log($('#id').val());
					console.log($('#name').val()); 
				}

			})
			 
		})
		 
		$("#confirmCode").click(function(){
			console.log("코드 검사");
		 	$.ajax({
		 		url:"/rest/checkCode",
				data:{ 	"memberId" : $("#id").val() , 
						"memberName" : $("#name").val(),
						"memberPw" : $("#pwd").val(), 
						"code" : $("#code").val() },
				method:"post", 
				success:function(json){
					if(json === "false"){
						alert("코드가 틀렸습니다! 다시 시도하여 주세요. :(")
						return;
					}
					$("#confirmCode").prop("disabled", true);
					$("#joinComplete").fadeIn(300);
					setTimeout(function() {
						$("#ok").append("환영합니다.🎆 회원가입이 완료 되었어요!");
						$("#toLogin").append("로그인 하러 가볼까요?");
					}, 300);	
					
				},
				fail:function(){
					alert("코드가 틀렸습니다! 다시 시도하여 주세요. :(")
				}
			})

		})  
</script>
</html>