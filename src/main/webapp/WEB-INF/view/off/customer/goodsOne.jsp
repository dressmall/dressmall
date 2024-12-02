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
    <title>goodsOne(비회원)</title>

</head>
<body>
	<!-- header -->
	<div class="site-wrap">
	    <header class="site-navbar" role="banner">
	      <div class="site-navbar-top">
	        <div class="container">
	          <div class="row align-items-center">
	
	            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
	              
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
                  			<a href="${pageContext.request.contextPath}/off/customer/customerLogin">
                  				<span>로그인</span>
                  			</a>
	                  	</li> 
	                  	<li>
	                  	 	<!-- 비회원자가 마이페이지를 클릭했을 경우 일반회원 로그인 페이지로 넘어감 -->
		                  	<a href="${pageContext.request.contextPath}/off/customer/customerLogin"><span class="icon icon-person"></span>
		                  	</a>
	                  	</li>
	                  	<li>
	                  		<!-- 비회원자가 장바구니를 클릭했을 경우 일반회원 로그인 페이지로 넘어감 -->
	                   		<a href="${pageContext.request.contextPath}/off/customer/customerLogin" class="site-cart">
	                     		<span class="icon icon-shopping_cart"></span>
		                    </a>
	                 	</li> 
	                  	
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
	          <div class="col-md-12 mb-0"><a href="${pageContext.request.contextPath}/off/customer/main">Home</a> 
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
	            	            
	            <!-- 수량 +,- 버튼 -->
	            <div class="mb-5 mt-3">
	              	<div class="input-group mb-3" style="max-width: 120px;">
		              <div class="input-group-prepend">
		                <button class="btn btn-outline-primary js-btn-minus disabled" type="button">&minus;</button>
		              </div>
		              <input type="text" class="form-control text-center" value="1" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1">
		              <div class="input-group-append">
		                <button class="btn btn-outline-primary js-btn-plus disabled" type="button">&plus;</button>
		              </div>
	            	</div>
	            </div>
	            
	            <!--  장바구니 추가 버튼 비활성화 -->
	            <p>
		            <a href="${pageContext.request.contextPath}/on/customer/cartList" 
		            	class="buy-now btn btn-sm btn-primary disabled" 
		            	tabindex="-1"
      						aria-disabled="true">
		            	Add To Cart
		            </a>
	            </p>
	            
			
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
	           	<c:forEach items="${boardList }" var="board">
	           		<c:if test="${not empty board.boardContent}">
		            	<form action="${pageContext.request.contextPath}/on/customer/removeBoard">
					        <div class="board-box content text-center">
					            <span>${board.boardContent}</span>
					            <div class="block-4-text p-4">
					                <input type="hidden" name="goodsNo" value="${board.goodsNo}">
					                <input type="hidden" name="ordersNo" value="${board.ordersNo}">
					                <!-- 세션에 저장된 customerMail과 board.customerMail이 같을 경우 삭제 버튼 표시 -->
				                    <c:if test="${board.isCustomer == true}">
				                        <button class="btn-main" type="submit">삭제</button>
				                    </c:if>
					            </div>
					        </div>
		            	</form>
				    </c:if>
	            </c:forEach>	
            </div>
          </div>
        </div>
      </div>
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