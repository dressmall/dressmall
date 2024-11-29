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
    <title>goodsOne(회원)</title>

</head>
<body>
	<!-- header -->
	<div class="site-wrap">
	    <header class="site-navbar" role="banner">
	      <div class="site-navbar-top">
	        <div class="container">
	          <div class="row align-items-center">
	
	            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
	              <form action="" class="site-block-top-search">
	                <span class="icon icon-search2"></span>
	                <input type="text" class="form-control border-0" placeholder="Search">
	              </form>
	            </div>
	
	            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
	              <div class="site-logo">
	                <a href="${pageContext.request.contextPath}/off/customer/main" class="js-logo-clone">Shoppers</a>
	              </div>
	            </div>
	
	            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
	              <div class="site-top-icons">
	                <ul>
	                  	<li>
	                  		<!-- 로그인 -->
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
	                  	<li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
	                </ul>
	              </div> 
	            </div>
	
	          </div>
	        </div>
	      </div> 
	    </header>
	
	    <div class="bg-light py-3">
	      <div class="container">
	        <div class="row">
	          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath}/on/customer/main">Home</a> 
	          <span class="mx-2 mb-0">/</span> 
	          <strong class="text-black">Shop</strong></div>
	        </div>
	      </div>
	    </div>
	</div>
	<div class="site-section">
      <div class="container">
        <div class="row">
        	 <!-- 상품 상세정보 -->
	          <div class="col-md-6">
                <c:if test="${empty goods.goodsFileName}">
                    <img 
                        src="${pageContext.request.contextPath}/upload/noImage.png"  
                        class="img-fluid">
                </c:if>
                <c:if test="${not empty goods.goodsFileName}">		                        
             		 <img src="${pageContext.request.contextPath}/upload/${goods.goodsFileName}.${goods.goodsFileExt}" class="img-fluid">
                </c:if>
	          </div>
	          
	          <div class="col-md-6">
	            <h2 class="text-black">${goods.goodsTitle}</h2>
	            <p>${goods.goodsMemo}</p>
	            <p><strong class="text-primary h4">${goods.goodsPrice} 원</strong></p>
	            <div class="mb-1 d-flex">
					<c:if test="${goods.goodsState == '재고있음'}">
	                   <p class="text-dark font-weight-bold">재고있음</p>	                   
                   	</c:if>
					<c:if test="${goods.goodsState == '재고없음'}">
	                   <p class="text-danger font-weight-bold">품절</p>	                   
                   	</c:if>
	            </div>
	            
	            <div class="mb-5 mt-3">
	              	<div class="input-group mb-3" style="max-width: 120px;">
		              <div class="input-group-prepend">
		                <button class="btn btn-outline-primary js-btn-minus" type="button">&minus;</button>
		              </div>
		              <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
		              <div class="input-group-append">
		                <button class="btn btn-outline-primary js-btn-plus" type="button">&plus;</button>
		              </div>
	            	</div>
	            </div>
	                        
	            
	            <c:if test="${goods.goodsState == '재고있음'}">
		            <p><a href="${pageContext.request.contextPath}/on/customer/cartList" class="buy-now btn btn-sm btn-primary">Add To Cart</a></p>	            
	            </c:if>
	            <!-- 버튼 비활성화 -->
	            <c:if test="${goods.goodsState == '재고없음'}"> 
		            <p>
			            <a href="${pageContext.request.contextPath}/on/customer/cartList" 
			            	class="buy-now btn btn-sm btn-primary disabled" 
			            	tabindex="-1"
       						aria-disabled="true">
			            	Add To Cart
			            </a>
		            </p>	            
	            </c:if>
			
	          </div>
        </div>
      </div>
    </div>

    <div class="site-section block-3 site-blocks-2 bg-light">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-md-7 site-section-heading text-center pt-4">
            <h2>후기</h2>
          </div>
        </div>
        <!-- 후기 리스트 출력 -->
        <div class="row">
          <div class="col-md-12">
            <div class="nonloop-block-3 owl-carousel">
              <div class="item">
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>