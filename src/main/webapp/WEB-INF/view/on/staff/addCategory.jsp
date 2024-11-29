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
    <title>카테고리  추가</title>
</head>
<body>
	<div class="loginBox">
		<form id="formAddCategory" action="${pageContext.request.contextPath}/on/staff/addCategory">
			<div>
				<h4>카테고리 추가</h4>
			</div>
			<div>
               <div>Title :<div>
               <input type="text" name="categoryTitle" id="categoryTitle">
            </div>
            <!-- errMsg 출력 -->
            <span class="msg d-block" id="errMsg"></span>
            <button id="btnAddCategory" type="button" class="btn btn-main mt-3">카테고리 추가</button>
		</form>
	</div>
</body>
	<script>
      // 유효성 검사
      $('#btnAddCategory').click(function() {
         // 미입력 유효성 체크
         if($('#categoryTitle').val() == null || $('#categoryTitle').val() == ''){
            $('#errMsg').text('카테고리를 입력해주세요.');
         } else{
            console.log('submit...');
            $('#errMsg').text(''); // 오류메시지 초기화
            
         // AJAX로 폼 제출
 			$.ajax({
 				type: 'POST',
 				url: $('#formAddCategory').attr('action'),
 				data: $('#formAddCategory').serialize(),
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