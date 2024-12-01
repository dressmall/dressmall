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
		<form id="formModifyCustomer" action="${pageContext.request.contextPath}/on/customer/modifyCustomer">
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
				<button type="button" id="modifyCustomerBtn" class="btn-main btn">수정</button>	
			</div>
		</form>
	</div>
</body>
	<script>
	// 유효성 검사 및 폼 제출 (AJAX)
	$('#modifyCustomerBtn').click(function() {
		let isVal = true;

		// PW 유효성 검사
		if ($('#customerPw').length === 0 || $('#customerPw').val().length < 4) {
			$('.pw-error').show().text("비밀번호는 4자 이상 입력해주세요");
			$('#customerPw').addClass("errorInput");
			console.log("customerPw 에러");
			isVal = false;
		} else {
			$('.pw-error').hide();
			$('#customerPw').removeClass("errorInput");
		}

		// 폼 제출
		if (isVal) {
			// AJAX로 폼 제출
			$.ajax({
				type: 'POST',
				url: $('#formModifyCustomer').attr('action'),
				data: $('#formModifyCustomer').serialize(),
				success: function(response) {
					// 서버에서 응답 성공 후 팝업창 닫기
					window.close();
				},
				error: function(xhr, status, error) {
					// 에러가 발생하면 처리할 로직 (필요시)
					alert('폼 제출 실패');
				}
			});
		}
	});
	
	// Enter 키를 눌렀을 때 로그인
    $('#formModifyCustomer').on('keydown', function(event) {
        if (event.keyCode === 13) { // Enter 키
            event.preventDefault(); // 기본 Enter 키 동작 방지
            $('#modifyCustomerBtn').click(); // 버튼 클릭 이벤트 트리거
        }
    });
</script>
</html>