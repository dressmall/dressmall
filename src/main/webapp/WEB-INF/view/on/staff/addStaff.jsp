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
    <title>스태프 추가</title>
</head>
<body>
	<div class="loginBox">
		<form id="formStaffAdd" action="${pageContext.request.contextPath}/on/staff/addStaff" method="post">
			<div>
				<h2>스태프 추가</h2>
			</div>
			<div class="inputBox mb-2">
				<div class="idBox">
					<div>ID</div>
					<input type="text" id="staffId" name="staffId"> 
					<span class="msg mail-error">아이디를 입력해주세요.</span>			
				</div>
				<div class="pwBox">
					<div>PW</div>
					<input type="password" id="staffPw" name="staffPw"> 
					<span class="msg pw-error">비밀번호는 4자 이상 입력해주세요.</span>			
				</div>
				${param.errMsg}
			</div>
			<div class="btnBox mt-2">
				<button type="button" id="staffAddBtn" class="btn-main btn">추가</button>	
			</div>
		</form>
	</div>
</body>
	<script>
		// 서버에서 전달된 staffList를 JavaScript로 전달
    	
	</script>
	<script >
	// 유효성 검사
	$('#staffAddBtn').click(function() {
		let isVal = true;
		// ID 유효성 검사
		if ($('#staffId').length === 0 || $('#staffId').val() == '') {
			$('#staffId').addClass("errorInput");
			$('.mail-error').show().text("ID를 입력해주세요");
			console.log("staffId 에러");
			isVal = false;
		} else {
	        $('.mail-error').hide();
	        $('#staffId').removeClass("errorInput");
	    }

		// PW 유효성 검사
		if ($('#staffPw').length === 0 || $('#staffPw').val().length < 4) {
			$('.pw-error').show().text("비밀번호는 4자 이상 입력해주세요");
			$('#staffPw').addClass("errorInput");
			console.log("staffPw 에러");
			isVal = false;
		} else {
			$('.pw-error').hide();
			$('#staffPw').removeClass("errorInput");
		}

		// 폼 제출
		if (isVal) {
			// AJAX로 폼 제출
 			$.ajax({
 				type: 'POST',
 				url: $('#formStaffAdd').attr('action'),
 				data: $('#formStaffAdd').serialize(),
 				success: function(response) {
 					// 완료 후 부모 새로고침 및 팝업 닫기
 				    if (window.opener) {
 				        window.opener.location.reload(); // 부모 새로고침
 				    }
 				    window.close(); // 팝업 닫기
 				},
 				error: function(xhr, status, error) {
 					// 에러가 발생하면 처리할 로직 (필요시)
 					alert('폼 제출 실패');
 				}
 			});
	    }
	});
</script>
</html>