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
	<form id="formStaffLogin" action="${pageContext.request.contextPath}/on/staff/login" method="post">
		<div class="loginBox">
			<button class="loginBtn active">관리자</button>
			<a class="loginBtn" href="${pageContext.request.contextPath}/off/customer/login">
				<span>일반 회원</span>
			</a>		
		</div>
		<div class="inputBox">
			<div class="idBox">
				<label for="staffId">Email</label>
				<input id="staffId" type="text" name="staffId" placeholder="ex)abc@naver.com" > 
			</div>
			<div class="pwBox">
				<label for="staffPw" >Pw</label>
				<input type="text" id="staffPw" name="staffPw"> 
			</div>			
		</div>
		<div class="btnBox">
			<button class="btn-main btn">로그인</button>	
		</div>
	</form>
</body>
</html>