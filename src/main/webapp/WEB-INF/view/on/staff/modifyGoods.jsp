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
									<td><input type="text" name="goodsTitle" id="goodsTitle" value="${goods.goodsTitle}"></td>
								</tr>
								<tr>
									<td>상품 설명</td>
									<td>
										<textarea name="goodsMemo" id="goodsMemo" rows="4" cols="50">${goods.goodsMemo}</textarea>
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
									<td><input type="number" name="goodsPrice" id="goodsPrice" value="${goods.goodsPrice}"></td>
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
											${goods.goodsFileOriginName }.${goods.goodsFileExt }
										</c:if>
									</td>
								</tr>
								<tr>
									<td>상품 이미지 첨부</td>
									<td>
										<div>
											<input type = "file" name="goodsFile" class="goodsFile" value=>
										</div>
										<div>
										${param.errMsg}
										</div>
									</td>
								</tr>
							</table>
							<button type="btn btn-main" id="btnAddGoods">상품 등록</button>
							<span class="msg" id="errMsg"></span>
						</form>	

                       	<script>
                       	// 유효성 체크 해야됨
	                       	$('#btnAddGoods').click(function(){
	                    		if($('#goodsTitle').val() == ''){
	                    			alert('상품이름을 입력하세요');
	                    		} else if($('#categoryNo').val() == ''){
	                    			alert('카테고리를 선택하세요');
	                    		} else if($('.goodsFile').last().val() == ''){
	                    			alert('첨부하지 않은 파일이 존재합니다');
	                    		} else{
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