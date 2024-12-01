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
    <title>customer login</title>
</head>
<body>

	<div class="site-wrap">
		<header class="site-navbar" role="banner">
			<div class="site-navbar-top">
				<div class="container">
        			<!-- 로고 영역 -->
					<p class="site-logo text-center">
						<a href="${pageContext.request.contextPath}/on/customer/main" class="js-logo-clone">DressMALL</a>
					</p>
				</div>
			</div> 
		</header>
		<div class="loginBox">
			<div class="loginBtnBox">
				<a class="loginBtn btn" href="${pageContext.request.contextPath}/off/staff/staffLogin">
					<span>관리자</span>
				</a>		
				<button class="loginBtn btn active">일반회원</button>	
			</div>
			<form id="formCustomerLogin" action="${pageContext.request.contextPath}/off/customer/customerLogin" method="post">
				<div class="inputBox mb-3">
					<div class="idBox">
						<label for="customerMail">Email</label>
						<input id="customerMail" type="text" name="customerMail" placeholder="ex)abc@naver.com" > 
					</div>
					<span class="msg mail-error">이메일 주소가 올바르지 않습니다.</span>
					<div class="pwBox mt-3">
						<label for="customerPw" >Pw</label>
						<input type="password" id="customerPw" name="customerPw"> 
					</div>			
					<span class="msg pw-error">비밀번호는 4자 이상 입력해주세요</span>
				</div>
				<span class="fs-6 text-danger ">${msg }</span>
				<div class="btnBox mt-2">
					<button id="customerLoginBtn" class="btn btn-main mr-3" type="button">로그인</button>
					<a class="btn-main btn hovernone" href="${pageContext.request.contextPath}/off/customer/signup">
						<span>회원가입</span>
					</a>
				</div>
			</form>
		</div>
	</div>
</body>
	<script type="text/javascript">
		// 유효성 검사 
		$('#customerLoginBtn').click(function() {
			
			let emailPattern  = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
			let isVal = true;
			
			if($('#customerMail') == null || $('#customerMail').val() == '' || !(emailPattern.test($('#customerMail').val()))) {
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
			if (isVal) {
		        console.log("submit 성공");
		        $('#formCustomerLogin').submit();
		    }		
		});
		
		// Enter 키를 눌렀을 때 로그인
	    $('#formCustomerLogin').on('keydown', function(event) {
	        if (event.keyCode === 13) { // Enter 키
	            event.preventDefault(); // 기본 Enter 키 동작 방지
	            $('#customerLoginBtn').click(); // 버튼 클릭 이벤트 트리거
	        }
	    });
	</script>
</html>