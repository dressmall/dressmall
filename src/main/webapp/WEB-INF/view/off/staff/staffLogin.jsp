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
			<div class="inputBox mb-2">
				<div class="idBox">
					<label for="staffId">Email</label>
					<input id="staffId" type="text" name="staffId" placeholder="ex)abc@naver.com" > 
				</div>
				<div class="pwBox">
					<label for="staffPw" >Pw</label>
					<input type="password" id="staffPw" name="staffPw"> 
				</div>			
			</div>
			<span class="fs-6 text-danger ">${msg }</span>
			<div class="btnBox mt-2">
				<button id="staffLoginBtn" class="btn-main btn" >로그인</button>	
			</div>
		</form>
	</div>
</body>
	<script type="text/javascript">
		// 유효성 검사 필요
	
		$("#staffLoginBtn").click(function() {
			$('#formStaffLogin').submit();
		});
	</script>
</html>