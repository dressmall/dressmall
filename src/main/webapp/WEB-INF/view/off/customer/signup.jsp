<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>customer signUp</title>
</head>
<body>
	<div>
		<h1>회원가입</h1>
		<form id="formCustomerSignUp" action="${pageContext.request.contextPath}/off/customer/signup" method="post">
			<div class="inputBox mb-3">
				<div class="idBox">
					<label for="customerMail">Email</label>
					<input id="customerMail" type="email" name="customerMail" placeholder="ex)abc@naver.com" > 
				</div>
				<span class="msg mail-error">이메일 주소가 올바르지 않습니다.</span>
				<div class="pwBox mt-3">
					<label for="customerPw" >Pw</label>
					<input type="password" id="customerPw" name="customerPw"> 
				</div>			
				<span class="msg pw-error">비밀번호는 4자 이상 입력해주세요</span>
				<div class="birthBox mt-3">
					<label for="customerBirth" >Birth</label>
					<input type="date" id="customerBirth" name="customerBirth"> 
				</div>
				<span class="msg birth-error">날짜를 선택해주세요</span>
				<div class="genderBox mt-3">
					<span class="d-block">Gender</span>
					<input type="radio" id="customerGenderMale" name="customerGender" class="w-25" value="남자" checked> 남자 
					<input type="radio" id="customerGenderFeMale" name="customerGender" class="w-25" value="여자"> 여자 
				</div>
			</div>
			<div class="btnBox">
				<button type="button" class="btn btn-main w-100" id="customerSignUpBtn">회원가입</button>
			</div>
		</form>
	</div>
</body>
	<script type="text/javascript">
		// 유효성 검사 
		$('#customerSignUpBtn').click(function() {
			
			let isVal = true;
			
			if($('#customerMail') == null || $('#customerMail').val() == '') {
				$('#customerMail').addClass("errorInput");
				$('.mail-error').show();
				console.log("customerMail 에러");
				isVal = false;
			} else {
				$('.mail-error').hide();
				$('#customerMail').removeClass("errorInput");
			}
			if($('#customerPw') == null || $('#customerPw').val().length < 4) {
				$('.pw-error').show();
				$('#customerPw').addClass("errorInput");
				console.log("customerPw 에러");
				isVal = false;
			} else {
				$('.pw-error').hide();
				$('#customerPw').removeClass("errorInput");
			}
			if($('#customerBirth') == null || $('#customerBirth').val() == '') {
				$('.birth-error').show();
				$('#customerBirth').addClass("errorInput");
				console.log("customerBirth 에러");
				isVal = false;
			} else {
				$('.birth-error').hide();
				$('#customerBirth').removeClass("errorInput");
			}
			if (isVal) {
		        $('#formCustomerSignUp').submit();
		        console.log("submit 성공");
		    }		
		});
	</script>
</html>