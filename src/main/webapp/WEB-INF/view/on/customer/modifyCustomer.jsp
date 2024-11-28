<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <!-- 로그인 .css 추가 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <title>비밀번호 수정</title>
</head>
<body>
	<div class="loginBox">
		<form id="formModifyCustomer" action="${pageContext.request.contextPath}/on/customer/modifyCustomer" method="post">
			<div>
				<h4>회원 비밀번호수정</h4>
			</div>
			<div class="inputBox mb-2">
				<div class="pwBox">
					<div>PW</div>
					<input type="password" id="customerPw" name="customerPw"> 
					<span class="msg pw-error">비밀번호는 4자 이상 입력해주세요.</span>			
				</div>
			</div>
			<div class="btnBox mt-2">
				<button type="button" id="staffAddBtn" class="btn-main btn">수정</button>	
			</div>
		</form>
	</div>
</body>
	<script >
	// 유효성 검사
	$('#staffAddBtn').click(function() {
		let isVal = true;

		// PW 유효성 검사
		if ($('#customerPw').length === 0 || $('#customerPw').val().length < 4) {
			$('.pw-error').show().text("비밀번호는 4자 이상 입력해주세요");
			$('#customerPw').addClass("errorInput");
			console.log("staffPw 에러");
			isVal = false;
		} else {
			$('.pw-error').hide();
			$('#staffPw').removeClass("errorInput");
		}

		// 폼 제출
		if (isVal) {
	        console.log("submit 성공");
	        $('#formModifyCustomer').submit();
	    }
	});
</script>
</html>