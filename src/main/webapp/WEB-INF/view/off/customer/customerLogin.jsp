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
    <title>customer login</title>
</head>
<body>
	<div class="loginBox">
		<div class="loginBtnBox">
			<a class="loginBtn btn" href="${pageContext.request.contextPath}/off/staff/staffLogin">
				<span>관리자</span>
			</a>		
			<button class="loginBtn btn active">일반회원</button>	
		</div>
		<form id="formCustomerLogin" action="${pageContext.request.contextPath}/off/customer/customerLogin" method="post">
			<div class="inputBox mb-2">
				<div class="idBox">
					<label for="customerMail">Email</label>
					<input id="customerMail" type="text" name="customerMail" placeholder="ex)abc@naver.com" > 
				</div>
				<div class="pwBox">
					<label for="customerPw" >Pw</label>
					<input type="password" id="customerPw" name="customerPw"> 
				</div>			
			</div>
			<span class="fs-6 text-danger ">${msg }</span>
			<div class="btnBox mt-2">
				<button id="customerLoginBtn" class="btn btn-main mr-3">로그인</button>
				<a class="btn-main btn hovernone" href="${pageContext.request.contextPath}/off/customer/signup">
					<span>회원가입</span>
				</a>
			</div>
		</form>
	</div>
</body>
</html>