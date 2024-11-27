<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<meta charset="UTF-8">
<title>상품수정</title>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Dress Mall_STAFF</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <a href="${pageContext.request.contextPath}/on/staff/logout" class="btn btn-danger ms-auto me-4">
           		로그아웃
            </a>
            
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">MENU</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/staffList">                           
                                스태프 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/goodsList">                           
                               	상품 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/customerList">                           
                                고객 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/paymentList">                           
                                주문 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/categoryList">                           
                                카테고리 관리
                            </a>
                        </div>
                        
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${loginStaff}
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-5">
                        <h1 class="mt-5">상품 수정</h1>
                       	
						<form id="formGoods" action="${pageContext.request.contextPath}/on/staff/modifyGoods" method="post"
								enctype="multipart/form-data">
							<input type="hidden" name="goodsNo" value="${goodsNo}">
							<table class="table">
								<tr>
									<td>상품 이름</td>
									<td>
										<input type="text" name="goodsTitle" id="goodsTitle" value="${goods.goodsTitle}">
										<span class="msg d-block mt-1" id="errTitle"></span> <!-- errMsg 출력 -->
									</td>
								</tr>
								<tr>
									<td>상품 설명</td>
									<td>
										<textarea name="goodsMemo" id="goodsMemo" rows="4" cols="50">${goods.goodsMemo}</textarea>
										<span class="msg d-block mt-1" id="errMemo"></span> <!-- errMsg 출력 -->
									</td>
								</tr>
								<tr>
									<td>재고</td>
									<td>
										<c:if test="${goods.goodsState == '재고있음'}">
										    <input type="radio" name="goodsState" value="재고있음" checked>재고있음&nbsp;
										    <input type="radio" name="goodsState" value="재고없음">재고없음
										</c:if>
										<c:if test="${goods.goodsState != '재고있음'}">
										    <input type="radio" name="goodsState" value="재고있음">재고있음&nbsp;
										    <input type="radio" name="goodsState" value="재고없음" checked>재고없음
										</c:if>										
									</td>
								</tr>
								<tr>
									<td>상품 가격</td>
									<td>
										<input type="number" name="goodsPrice" id="goodsPrice" value="${goods.goodsPrice}">
										<span class="msg d-block mt-1" id="errPrice"></span> <!-- errMsg 출력 -->
									</td>
								</tr>
								<tr>
									<td>카테고리</td>
									<td>
										<select name="categoryNo" id="categoryNo">
											<option value="" disabled>카테고리 선택</option>
											<c:forEach var="c" items="${categoryList}">
												<option value="${c.categoryNo}" <c:if test="${c.categoryTitle == goods.categoryTitle}">selected</c:if>>
													${c.categoryTitle}
												</option>
											</c:forEach>
										</select>									
									</td>
								</tr>
								<tr>
									<td>기존 파일</td>
									<td>
										<c:if test="${goods.goodsFileNo == null }">
											파일이 없습니다.
										</c:if>
										<c:if test="${goods.goodsFileNo != null }">
											${goods.goodsFileOrigin}.${goods.goodsFileExt}
										</c:if>
									</td>
								</tr>
								<tr>
									<td>상품 이미지 첨부</td>
									<td>
										<div>
											<input type = "file" name="goodsFile" class="goodsFile" value=>
										</div>
										<span class="msg d-block mt-1">${param.errFileMsg}</span> <!-- 이미지파일 아닐시 errMsg 출력 -->
									</td>
								</tr>
							</table>
							<button type="button" class="btn btn-main" id="btnModifyGoods">상품 수정</button>
						</form>	

                       	<script>
                       		// 유효성 체크
	                       		$('#btnModifyGoods').click(function(){
	                       	 	let isValid = true;
	                       	 	
	                       		// 상품 이름 유효성 검사
	                    		if($('#goodsTitle').val() == null || $('#goodsTitle').val() == ''){
	                    			$('#errTitle').text('상품이름을 입력해주세요.');
	                    			console.log("상품이름 미입력");
	                    			isValid = false;
	                    		} else{
	                    			$('#errTitle').text('');	// 오류메시지 초기화
	                    		}
	                    		// 상품 상세정보 유효성 검사
	                    		if($('#goodsMemo').val() == null || $('#goodsMemo').val() == ''){
	                    			$('#errMemo').text('상품 상세정보를 입력해주세요.');
	                    			console.log("상품설명 미입력");
	                    			isValid = false;
	                    		} else{
	                    			$('#errMemo').text('');	// 오류메시지 초기화
	                    		}  		
	                    		// 상품가격 유효성 검사
	                    		let price = $('#goodsPrice').val();
    							if (price == '' || isNaN(price) || price < 0) {
	                    			$('#errPrice').text('가격을 입력해주세요.');
	                    			console.log("가격 유효성 오류");
	                    			isValid = false;
	                    		} else{
	                    			$('#errPrice').text('');	// 오류메시지 초기화
	                    		}	                    		
    							    							
    							// 서버에서 전달받은 errFileMsg 값을 자바스크립트에서 사용
                   				let errFileMsg = "${errFileMsg}";  // JSP에서 전달된 값
                   				
	                    		// 전체 유효성 통과 시 폼 제출
                   				if (isValid && errFileMsg === '') {
                   			        console.log('submit...');
                   			        $('#formGoods').submit();
                   			    }	                    		
	                    		
	                    	});
                       		
                       	</script>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Dress Mall 2024</div>
                           
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
</body>
</html>