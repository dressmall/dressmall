<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
    <title>main(회원)</title>

</head>
<body>
  <header class="site-navbar" role="banner">
  <div class="site-navbar-top">
    <div class="container">
      <div class="row align-items-center justify-content-between mt-3 mb-3">

        <!-- 로고 영역 -->
        <div class="col-2 mb-3 mb-md-0 col-md-3 w-100">
          <p class="site-logo">
            <a href="${pageContext.request.contextPath}/on/customer/main" class="js-logo-clone">DressMALL</a>
          </p>
        </div>

        <!-- 검색 영역 (확장) -->
        <div class="col-12 mb-3 mb-md-0 col-md-6 w-100"> <!-- col-6 -> col-8, col-md-5 -> col-md-6 변경 -->
          <form id="formSearchWord" action="${pageContext.request.contextPath}/on/customer/main" class="site-block-top-search w-100" method="get">
            <input type="hidden" name="categoryNo" value="${categoryNo }">
            <span class="icon icon-search2"></span>
            <input type="text" class="form-control border-0" placeholder="Search" name="searchWord" id="searchWord">
          </form>
        </div>

        <!-- 로그인 및 장바구니 아이콘 영역 -->
        <div class="col-2 col-md-2 order-3 order-md-3 text-right">
          <div class="site-top-icons">
            <ul>
              <li>
                <a href="${pageContext.request.contextPath}/on/customer/logout">
                  <span>로그아웃</span>
                </a>
              </li>
              <li><a href="${pageContext.request.contextPath}/on/customer/myPage"><span class="icon icon-person"></span></a></li> <!-- 마이페이지 -->
              <li>
                <a href="${pageContext.request.contextPath}/on/customer/cartList" class="site-cart">
                  <span class="icon icon-shopping_cart"></span>
                  <!-- 장바구니 담은 개수 표시 -->
                  <span class="count">${countCartList}</span>
                </a>
              </li>
              <li class="d-inline-block d-md-none ml-md-0">
                <a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a>
              </li>
            </ul>
          </div> 
        </div>

      </div>
    </div>
  </div> 
</header>
  <div class="site-wrap">
    
    <div class="site-section">
      <div class="container">
        <div class="row mb-5 mt-5">
          <div class="col-md-9 order-2">

            <div class="row">
              <div class="col-md-12">
              <c:forEach var="c" items="${selectCategory}">
              	<div class="float-md-left mb-4"><h2 class="text-black h5">${c.categoryTitle}</h2></div>
              </c:forEach>
              </div>
            </div>
            
            <div class="row mb-5">
			  <!-- 상품 리스트 -->
			  <c:if test="${main.isEmpty()}">
              <div class="text-center">
              	상품이 없습니다.
              </div>
              </c:if>
              <c:if test="${!main.isEmpty()}">
			  <c:forEach var="m" items="${main}">
			  	<div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
	               <div class="block-4 text-center border">
	                 <figure class="block-4-image">
	                   <c:if test="${empty m.goodsFileName}">
                           <img 
                               src="${pageContext.request.contextPath}/upload/noImage.png"  
                               class="img-fluid">
                       </c:if>
                       <c:if test="${not empty m.goodsFileName}">		                        
	                    <img src="${pageContext.request.contextPath}/upload/${m.goodsFileName}.${m.goodsFileExt}" class="img-fluid">
                       </c:if>
	                 </figure>
	                 <div class="block-4-text p-4">
	                   <h3><a href="${pageContext.request.contextPath}/on/customer/goodsOne?goodsNo=${m.goodsNo}">${m.goodsTitle}</a></h3>
	                   <p class="mb-0 text-memo">${m.goodsMemo}</p>
	                   <p class="text-primary font-weight-bold">${m.goodsPrice}원</p>
	                   <c:if test="${m.goodsState == '재고없음'}">
		                   <p class="text-danger font-weight-bold">품절</p>	                   
	                   </c:if>
	                   <c:if test="${m.goodsState == '재고있음'}">
		                   <p >&nbsp;</p>	                   
	                   </c:if>
	                 </div>
	               </div>
	              </div>			  	
			  </c:forEach>
			  </c:if>
            </div>
            
            <!-- 페이지네이션 -->
            <div class="row" data-aos="fade-up">
              <div class="col-md-12 text-center">
                <div class="site-block-27">
                
                  <!-- 검색어 있는 경우 -->
                  <c:if test="${searchWord != null}">
	                  <ul>         
	                  	<c:if test="${currentPage > numPerPage}">
							<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum - numPerPage}&searchWord=${searchWord}">&lt;</a></li>
						</c:if>
						<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
							<c:if test="${num==currentPage}">
								<li class="active"><span>${num}</span></li>
							</c:if>
							<c:if test="${num!=currentPage}">
								<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${num}&searchWord=${searchWord}">${num}</a></li>
							</c:if>
						</c:forEach>
	                    <c:if test="${currentPage < lastPage - numPerPage }">
							<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum + numPerPage}&searchWord=${searchWord}">&gt;</a></li>
						</c:if>
	                  </ul>
                  </c:if>
                  
                  <!-- 검색어 없는 경우 -->
                  <c:if test="${searchWord == null}">
                  	  <!-- 카테고리 없는 경우 -->
                  	  <c:if test="${categoryNo == null}">
                  	  	<ul>                  
		                  	<c:if test="${currentPage > numPerPage}">
								<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum - numPerPage}">&lt;</a></li>
							</c:if>
							<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
								<c:if test="${num==currentPage}">
									<li class="active"><span>${num}</span></li>
								</c:if>
								<c:if test="${num!=currentPage}">
									<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${num}">${num}</a></li>
								</c:if>
							</c:forEach>
		                    <c:if test="${currentPage < lastPage - numPerPage }">
								<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum + numPerPage}">&gt;</a></li>
							</c:if>
		                </ul>
                  	  </c:if>
                  	  <!-- 카테고리 있는 경우 -->
                  	  <c:if test="${categoryNo != null}">
                  	  	<ul>                  
		                  	<c:if test="${currentPage > numPerPage}">
								<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum - numPerPage}&categoryNo=${categoryNo}">&lt;</a></li>
							</c:if>
							<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
								<c:if test="${num==currentPage}">
									<li class="active"><span>${num}</span></li>
								</c:if>
								<c:if test="${num!=currentPage}">
									<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${num}&categoryNo=${categoryNo}">${num}</a></li>
								</c:if>
							</c:forEach>
		                    <c:if test="${currentPage < lastPage - numPerPage }">
								<li><a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${beginPagingNum + numPerPage}&categoryNo=${categoryNo}">&gt;</a></li>
							</c:if>
		                </ul>
                  	  </c:if>
	                  
                  </c:if>
                  
                </div>
              </div>
            </div>
          </div>
           <div class="col-md-3 order-1 mb-5 mb-md-0">
            <div class="border p-4 rounded mb-4">
              <h3 class="mb-3 h6 text-uppercase text-black d-block">Categories</h3>
              <ul class="list-unstyled mb-0">
              	<li class="mb-1">
              		<a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${currentPage}" class="d-flex">
                		<span>전체</span>
                		<span class="text-black ml-auto">(${totalCount})</span>
	                </a>
              	</li>
              	<c:forEach var="c" items="${categoryCountList}">
	                <li class="mb-1">
						<a href="${pageContext.request.contextPath}/on/customer/main?currentPage=${currentPage}&categoryNo=${c.categoryNo}" class="d-flex">
	                		<span>${c.categoryTitle}</span>
	                		<span class="text-black ml-auto">(${c.count})</span>
		                </a>
	                </li>              	
              	</c:forEach>
              </ul>
            </div>
          </div>
          
        </div>
        
      </div>
    </div>
    
	<footer class="py-4 bg-light mt-auto">
       <div class="container-fluid px-4">
           <div class="d-flex align-items-center justify-content-between small">
               <div class="text-muted">Copyright &copy; Dress Mall 2024</div>
              
           </div>
       </div>
   </footer>
    
  </div>

  <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath}/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/aos.js"></script>

  <script src="${pageContext.request.contextPath}/js/main.js"></script>
    
  </body>

</html>