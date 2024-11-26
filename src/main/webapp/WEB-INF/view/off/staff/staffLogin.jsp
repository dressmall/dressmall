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
    <title>staff login</title>
</head>
<body>
	<div class="loginBox">
		<div class="loginBtnBox">
			<button class="loginBtn active btn ">관리자</button>
			<a class="loginBtn btn" href="${pageContext.request.contextPath}/off/customer/customerLogin">
				<span>일반 회원</span>
			</a>		
		</div>
		<form id="formStaffLogin" action="${pageContext.request.contextPath}/off/staff/staffLogin" method="post">
			<div class="inputBox mb-3">
				<div class="idBox">
					<label for="staffId">staffId</label>
					<input id="staffId" type="text" name="staffId" > 
				</div>
				<span class="msg id-error">아이디를 입력해주세요</span>
				<div class="pwBox mt-3">
					<label for="staffPw" >staffPw</label>
					<input type="password" id="staffPw" name="staffPw"> 
				</div>			
				<span class="msg pw-error">비밀번호는 4자 이상 입력해주세요</span>
			</div>
			<span class="fs-6 text-danger ">${msg }</span>
			<div class="btnBox mt-2">
				<button id="staffLoginBtn" class="btn-main btn" type="button">로그인</button>	
			</div>
		</form>
	</div>
</body>
	<script type="text/javascript">
		// 유효성 검사 
		$('#staffLoginBtn').click(function() {
			
			let isVal = true;
			
			if($('#staffId') == null || $('#staffId').val() == '') {
				$('#staffId').addClass("errorInput");
				$('.id-error').show();
				console.log("staffId 에러");
				isVal = false;
			} else {
				$('.id-error').hide();
				$('#staffId').removeClass("errorInput");
			}
			if($('#staffPw') == null || $('#staffPw').val().length < 4) {
				$('.pw-error').show();
				$('#staffPw').addClass("errorInput");
				console.log("staffPw 에러");
				isVal = false;
			} else {
				$('.pw-error').hide();
				$('#staffPw').removeClass("errorInput");
			}
			if (isVal) {
		        $('#formStaffLogin').submit();
		        console.log("submit 성공");
		    }		
		});
	</script>
</html>