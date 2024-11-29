<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/staffStyles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

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

<meta charset="UTF-8">
<title>상품 추가</title>


</head>
<body>
	<div class="loginBox">
		<form id="formGoods"
			action="${pageContext.request.contextPath}/on/staff/addGoods"
			enctype="multipart/form-data">
			<div>
				<h4>상품 추가</h4>
			</div>
			<div class="inputBox mb-2">
				<div>
					<div class="mt-3 fw-bold">상품이름</div>
					<input type="text" name="goodsTitle" id="goodsTitle">
					<span class="msg d-block mt-1" id="errTitle"></span>		
				</div>
				<div>
					<div class="mt-3 fw-bold">상품설명</div>
					<textarea name="goodsMemo" id="goodsMemo" rows="4" cols="50"></textarea>
					<span class="msg d-block mt-1" id="errMemo"></span>	
				</div>
				<div>
					<div class="mt-3 fw-bold">재고</div>
					<input type='radio' name='goodsState' value='재고있음'>재고있음&nbsp;
					<input type='radio' name='goodsState' value='재고없음'>재고없음
					<span class="msg d-block mt-1" id="errState"></span>
				</div>
				<div>
					<div class="mt-3 fw-bold">가격</div>
					<input type="number" name="goodsPrice" id="goodsPrice" value="0">
					<span class="msg d-block mt-1" id="errPrice"></span>
				</div>
				<div>
					<div class="mt-3 fw-bold">카테고리</div>
					<select name="categoryNo" id="categoryNo">
						<option value="" disabled selected>카테고리 선택</option>
						<!-- 기본값 추가 -->
						<c:forEach var="c" items="${categoryList}">
							<option value="${c.categoryNo}">${c.categoryTitle}</option>
						</c:forEach>
					</select>
					<span class="msg d-block mt-1" id="errCategory"></span>
				</div>
				<div>
					<div class="mt-3 fw-bold">상품 이미지 첨부</div>
					<div>
						<input type="file" name="goodsFile" class="goodsFile">
					</div>
					<span class="msg d-block mt-1" id="errFile"></span> <!-- 파일 미선택시 errMsg 출력 -->
					<span class="msg d-block mt-1">${param.errFileMsg}</span> <!-- 이미지파일 아닐시 errMsg 출력 -->
				</div>
				
			</div>
			<div class="text-center">
				<button type="button" class="btn btn-main mt-3" id="btnAddGoods">상품등록</button>
			</div>
			
		</form>
	</div>
</body>
<script>
	// 유효성 체크
	$('#btnAddGoods').click(function() {
		let isValid = true;

		// 상품 이름 유효성 검사
		if ($('#goodsTitle').val() == null || $('#goodsTitle').val() == '') {
			$('#errTitle').text('상품이름을 입력해주세요.');
			console.log("상품이름 미입력");
			isValid = false;
		} else {
			$('#errTitle').text(''); // 오류메시지 초기화
		}
		// 상품 상세정보 유효성 검사
		if ($('#goodsMemo').val() == null || $('#goodsMemo').val() == '') {
			$('#errMemo').text('상품 상세정보를 입력해주세요.');
			console.log("상품설명 미입력");
			isValid = false;
		} else {
			$('#errMemo').text(''); // 오류메시지 초기화
		}
		// 재고 상태(라디오 버튼) 유효성 검사
		if (!$('input[name="goodsState"]:checked').val()) {
			$('#errState').text('재고 상태를 선택해주세요.');
			console.log("재고 상태 미선택");
			isValid = false;
		} else {
			$('#errState').text(''); // 오류 메시지 초기화
		}
		// 상품가격 유효성 검사
		let price = $('#goodsPrice').val();
		if (price == '' || isNaN(price) || price < 0) {
			$('#errPrice').text('가격을 입력해주세요.');
			console.log("가격 유효성 오류");
			isValid = false;
		} else {
			$('#errPrice').text(''); // 오류메시지 초기화
		}
		// 카테고리 유효성 검사
		if ($('#categoryNo').val() == null || $('#categoryNo').val() == '') {
			$('#errCategory').text('카테고리를 선택해주세요.');
			console.log("상품설명 미입력");
			isValid = false;
		} else {
			$('#errCategory').text(''); // 오류메시지 초기화
		}
		// 파일첨부 유효성 검사
		if ($('.goodsFile').val() == '') {
			$('#errFile').text('파일이 첨부되지 않았습니다.');
			console.log("상품설명 미입력");
			isValid = false;
		} else {
			$('#errFile').text(''); // 오류메시지 초기화
		}

		// 서버에서 전달받은 errFileMsg 값을 자바스크립트에서 사용
		let errFileMsg = "${errFileMsg}"; // JSP에서 전달된 값

		// 전체 유효성 통과 시 폼 제출
		if (isValid && errFileMsg === '') {
			// `FormData` 객체 생성
			let formData = new FormData($('#formGoods')[0]);

			// AJAX로 폼 제출
			$.ajax({
				type: 'POST',
				url: $('#formGoods').attr('action'),
				data: formData, // FormData 객체 사용
				processData: false, // 데이터 처리를 하지 않음
				contentType: false, // `multipart/form-data` 헤더 설정
				success: function (response) {
					// 완료 후 부모 새로고침 및 팝업 닫기
					if (window.opener) {
						window.opener.location.reload(); // 부모 새로고침
					}
					window.close(); // 팝업 닫기
				},
				error: function (xhr, status, error) {
					alert('폼 제출 실패: ' + (xhr.responseText || error));
				},
			});
		}

	});
</script>

</html>