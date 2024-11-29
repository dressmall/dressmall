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
<title>상품 리스트</title>
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
                        <h1 class="mt-5">상품 목록</h1>
                        
                        <!-- 추가 버튼 -->
                        <div class="d-flex justify-content-end mb-4">
                     	   <button class="btn-main btn" onclick="openPopupAddGoods()">상품 추가</button>
			            </div>
			            <!-- 상품 리스트 -->
			            <div class="row">
			            	<c:forEach var="g" items="${goodsList}">
				              <div class="col-sm-5 col-lg-3 mb-4" data-aos="fade-up">
				                <div class="block-4 text-center border">
				                  <figure class="block-4-image">
				                  	<c:if test="${empty g.goodsFileName}">
			                            <img 
			                                src="${pageContext.request.contextPath}/upload/noImage.png"  
			                                class="img-fluid">
			                        </c:if>
			                        <c:if test="${not empty g.goodsFileName}">		                        
					                    <img src="${pageContext.request.contextPath}/upload/${g.goodsFileName}.${g.goodsFileExt}" class="img-fluid">
			                        </c:if>
				                  </figure>
				                  <div class="block-4-text p-4">
				                    <h5><a class="text-dark text-decoration-none" href="${pageContext.request.contextPath}/on/staff/goodsOne?goodsNo=${g.goodsNo}">${g.goodsTitle}</a></h5>
				                    <p class="mb-0">${g.goodsMemo}</p>
				                    <p class="text font-weight-bold">${g.goodsPrice}원</p>
				                  </div>
				                  <div class="block-4 p-4">
				                  	<button class="btn-main btn" onclick="openPopupModifyGoods(${g.goodsNo})">상품 수정</button>
					                <a href="${pageContext.request.contextPath}/on/staff/removeGoods?goodsNo=${g.goodsNo}" class="btn btn-danger">
					                   상품 삭제
					                </a>
				                  </div>
				                </div>
				              </div>
			       			 </c:forEach>
			             </div>
                        <!-- 페이징 -->
                        <div class="text-center">
							<c:if test="${currentPage > numPerPage}">
								<a href="${pageContext.request.contextPath}/on/staff/goodsList?currentPage=${beginPagingNum - numPerPage}">이전</a>
							</c:if>
							<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
								<c:if test="${num==currentPage}">
									${num}&nbsp;
								</c:if>
								<c:if test="${num!=currentPage}">
									<a href="${pageContext.request.contextPath}/on/staff/goodsList?currentPage=${num}">${num}</a>
									&nbsp;
								</c:if>
							</c:forEach>
							<c:if test="${currentPage < lastPage - numPerPage }">
								<a href="${pageContext.request.contextPath}/on/staff/goodsList?currentPage=${beginPagingNum + numPerPage}">다음</a>
							</c:if>
						</div>
                      
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
        <script>
        // 상품등록 팝업
      	function openPopupAddGoods() {
    	  	  // 화면의 크기 (뷰포트 크기)
    	  	  const screenWidth = window.innerWidth;
    	  	  const screenHeight = window.innerHeight;
    	
    	  	  // 팝업 크기
    	  	  const popupWidth = 500;
    	  	  const popupHeight = 800;
    	
    	  	  // 중앙 위치 계산
    	  	  const left = Math.max((screenWidth - popupWidth) / 2, 0);
    	  	  const top = Math.max((screenHeight - popupHeight) / 2, 0);
    	  	  
    	      // 팝업창 옵션 설정
    	      const url = '${pageContext.request.contextPath}/on/staff/addGoods'; // 호출할 JSP 경로
    	      const name = '상품 등록'; // 팝업창 이름
    	      const options = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left + ',scrollbars=yes,resizable=no';
    	      window.open(url, name, options);
    	}
     
        // 상품수정 팝업
      	function openPopupModifyGoods(goodsNo) {
    	  	  // 화면의 크기 (뷰포트 크기)
    	  	  const screenWidth = window.innerWidth;
    	  	  const screenHeight = window.innerHeight;
    	
    	  	  // 팝업 크기
    	  	  const popupWidth = 500;
    	  	  const popupHeight = 800;
    	
    	  	  // 중앙 위치 계산
    	  	  const left = Math.max((screenWidth - popupWidth) / 2, 0);
    	  	  const top = Math.max((screenHeight - popupHeight) / 2, 0);
    	  	  
    	      // 팝업창 옵션 설정
    	      const url = '${pageContext.request.contextPath}/on/staff/modifyGoods?goodsNo=' + goodsNo; // 호출할 JSP 경로
    	      const name = '상품 수정'; // 팝업창 이름
    	      const options = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left + ',scrollbars=yes,resizable=no';
    	      window.open(url, name, options);
    	}
        </script>
</body>
</html>