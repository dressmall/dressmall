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


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/fonts/icomoon/style.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">


<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">


<title>goodsOne_관리자페이지</title>


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
                        ${loginStaff.staffId}
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-5">
                        <h1 class="mt-5">상품 상세정보</h1>
                        <!-- ******************* -->
						<div class="container mt-5">
					        <div class="row">
					          <div class="col-md-6">
					          	<c:if test="${empty goods.goodsFileName}">
					          		<img src="${pageContext.request.contextPath}/upload/noImage.png" class="img-fluid">
					          	</c:if>
					          	<c:if test="${!empty goods.goodsFileName}">
					          		<img src="${pageContext.request.contextPath}/upload/${goods.goodsFileName}.${goods.goodsFileExt}" class="img-fluid">
					          	</c:if>
					            	
					          </div>
					          <div class="col-md-6">
						            <table class="table table-bordered ">
		                                  <tr>
		                                      <td>상품이름</td>
		                                      <td>${goods.goodsTitle}</td>
		                                  </tr>
		                                  <tr>
		                                      <td>상품설명</td>
		                                      <td>${goods.goodsMemo}</td>
		                                  </tr>
		                                  <tr>
		                                      <td>카테고리</td>
		                                      <td>${goods.categoryTitle}</td>
		                                  </tr>
		                                  <tr>
		                                      <td>가격</td>
		                                      <td>${goods.goodsPrice} 원</td>
		                                  </tr>
		                                  <tr>
		                                      <td>재고</td>
		                                      <td>${goods.goodsState}</td>
		                                  </tr>
		                                  <tr>
		                                      <td>등록날짜</td>
		                                      <td>${goods.goodsCreateDate}</td>
		                                  </tr>
		                                  <tr>
		                                      <td>업데이트 날짜</td>
		                                      <td>${goods.goodsUpdateDate}</td>
		                                  </tr>
		                                  
			                          </table>
						
					          </div>
					        </div>
					      </div>                
                        
                        
                        
                        
                        <!-- ******************* -->
                       
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