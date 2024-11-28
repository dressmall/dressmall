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

	<title>주문목록</title>
</head>
<body>
  
  <div class="site-wrap">
	    <header class="site-navbar" role="banner">
	      <div class="site-navbar-top">
	        <div class="container">
	          <div class="row align-items-center justify-content-end">
	
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
	                  	<li>
		                  	<a href="${pageContext.request.contextPath}/on/customer/myPage"><span class="icon icon-person"></span>
		                  	</a>
	                  	</li>
	                  	<li>
	                   		<a href="${pageContext.request.contextPath}/on/customer/cartList" class="site-cart">
	                     		<span class="icon icon-shopping_cart"></span>
		                    </a>
	                 	 </li> 
	                  	<li class="d-inline-block d-md-none ml-md-0">
		                  	<a href="#" class="site-menu-toggle js-menu-toggle">
		                  		<span class="icon-menu"></span>
		                  	</a>
	                  	</li>
	                </ul>
	              </div> 
	            </div>
	
	          </div>
	        </div>
	      </div> 
	    </header>
	
	    <div class="site-section">
	      <div class="container">
	
			  <div class="d-flex">
		          <div class="col-md-3 order-0 mb-5 mb-md-0">
		            <div class="border p-4 rounded mb-4">
		              <h3 class="mb-3 h6 text-black d-block">MyPage</h3>
		              <ul class="list-unstyled mb-0">
		                <li class="mb-1"><a href="${pageContext.request.contextPath}/on/customer/ordersList" class="d-flex"><span class="main-text">주문목록</span> <span class="text-black ml-auto"></span></a></li>
		                <li class="mb-1"><a href="${pageContext.request.contextPath}/on/customer/myPage" class="d-flex"><span>회원정보</span> <span class="text-black ml-auto"></span></a></li>
		              </ul>
		            </div>
		          </div>
		          
		          <div class="d-flex w-100">
			          <div class=" order-0 m-2 mb-md-0 w-100">
			          	<h5>주문목록</h5>
			          	<!-- 주문목록 리스트 출력 -->
			          	<div class="border w-100 content ordersList-box">
				          	<form action="${pageContext.request.contextPath}/on/customer/ordersList" method="post">
				          		<c:forEach items="${ordersList }" var="o">
				          			<div class="payment-box d-flex align-items-center justify-content-between mb-3">
					          			결제번호 No.${o.paymentNo }
					          			<div>
					          				<span class="main-text">
							          			${o.paymentState }					          				
					          				</span>
						          			<!-- 결제완료일 경우 -->
						          			<c:if test="${o.paymentState == '결제완료' }">
						          				<button class="btn-main ms-3">주문취소</button>
						          			</c:if>		
						          			<!-- 배송중일 경우 -->	          			
						          			<c:if test="${o.paymentState == '배송중' }">
						          				<button class="btn-main ms-3">구매확정</button>
						          			</c:if>			 
						          			<!-- 배송완료일 경우 -->         			
						          			<c:if test="${o.paymentState == '배송완료' }">
						          				<button class="btn-disa ms-3" disabled>구매확정</button>
						          			</c:if>	
					          			</div>
				          			</div>
				          			<div class="orders-box content border d-flex align-items-center justify-content-center">
				          				<div class="img-box">	
				          				 	<c:if test="${o.goodsFileName == null}">
					          					<img src="${pageContext.request.contextPath}/upload/noImage.png" class="img-fluid" style="width: 150px; height: 150px; object-fit: cover;">			          				 	
				          				 	</c:if>
				          					<c:if test="${o.goodsFileName != null}">
							          			${o.goodsFileName }
							          			.${o.goodsFileExt }
				          					</c:if>	          			
				          				</div>
				          				<div class="text-box d-flex flex-column">
				          					<span>Title : ${o.goodsTitle }</span>
				          					<span class=" text-memo">상세설명 : ${o.goodsMemo }</span>
				          					<span>가격 : ${o.goodsPrice }</span>
				          					<span>수량 : ${o.ordersAmount }</span>				          				
				          				</div>
				          				<c:if test="${o.paymentState == '배송완료' }">
					          				<a class="btn-main" href="${pageContext.request.contextPath}/on/customer/addBoard">리뷰등록</a>
					          			</c:if>	
				          			</div>
				          		</c:forEach>
				          	</form>			          	
			          	</div>
			        </div>
			      </div>
			   </div>
			</div>
		</div>	
	</div>
    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p class="sub-text">
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved dressmall 
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
      </div>
     </div>
    </footer>

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