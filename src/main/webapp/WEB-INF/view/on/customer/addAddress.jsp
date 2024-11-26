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
    <title>주소 추가</title>
</head>
<body>
	<div class="loginBox">
		<form id="formaddAddress" action="${pageContext.request.contextPath}/on/customer/addAddress" method="post">
			<div>
				<h4>주소 추가</h4>
			</div>
			<div class="inputBox mb-2">
				<div class="addressBox">
					<div>상세주소</div>
					<input type="text" id=addressDetail name="addressDetail"> 
					<span class="msg address-error"></span>			
				</div>
			</div>
			<div class="btnBox mt-2">
				<button type="button" id="addressAddBtn" class="btn-main btn">추가</button>	
			</div>
		</form>
	</div>
</body>
	<script >
	// 유효성 검사
	$('#addressAddBtn').click(function() {
		let isVal = true;

		// PW 유효성 검사
		if ($('#addressDetail').val() == "") {
			$('.address-error').show().text("주소를 입력해주세요.");
			$('#addressDetail').addClass("errorInput");
			console.log("addressDetail 에러");
			isVal = false;
		} else {
			$('.address-error').hide();
			$('#staffPw').removeClass("errorInput");
		}

		// 폼 제출
		if (isVal) {
	        console.log("submit 성공");
	        $('#formaddAddress').submit();
	    }
	});
</script>
</html>