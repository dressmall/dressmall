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
      <div class="row align-items-center justify-content-between mt-3 mb-3">

        <!-- 로고 영역 -->
        <div class="col-2 mb-3 mb-md-0 col-md-3 w-100">
          <p class="site-logo">
            <a href="${pageContext.request.contextPath}/on/customer/main" class="js-logo-clone">DressMALL</a>
          </p>
        </div>

        <!-- 가운데 공백 -->
        <div class="col-12 mb-3 mb-md-0 col-md-6 w-100">
          
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
			          	<div class="border w-100 content scroll-box">
			          		<c:if test="${ordersList.isEmpty()}">
			          			<div class="border w-100 content">
			          				주문내역이 없습니다.
			          			</div>
			          		</c:if>
			          		<c:if test="${!ordersList.isEmpty()}">
			          			<form action="${pageContext.request.contextPath}/on/customer/ordersList" method="post">
					          		<c:forEach items="${ordersList }" var="o">
					          			<div>
					          				<div class="payment-box d-flex align-items-center justify-content-between mb-3">
							          			결제번호 No.${o.paymentNo }
							          			<div>
							          				<span class="main-text">
									          			${o.paymentState }	    				
							          				</span>
								          			<!-- 결제완료일 경우 -->
								          			<c:if test="${o.paymentState == '결제완료' }">
								          				<a
								          					href="${pageContext.request.contextPath}/on/customer/deleteOrders?ordersNo=${o.ordersNo}&paymentNo=${o.paymentNo }"
								          					 class="btn-main ms-3">
								          					주문취소	
								          				</a>
								          			</c:if>		
								          			<!-- 배송중일 경우 -->	          			
								          			<c:if test="${o.paymentState == '배송중' }">
								          				<a	href="${pageContext.request.contextPath}/on/customer/modifyOrders?paymentNo=${o.paymentNo }"
								          					class="btn-main ms-3">구매확정</a>
								          			</c:if>			 
								          			<!-- 배송완료일 경우 -->         			
								          			<c:if test="${o.paymentState == '배송완료' }">
								          				<button class="btn-disa ms-3" disabled>구매확정</button>
								          			</c:if>	
							          			</div>
						          			</div>
						          			<div class="orders-box content border d-flex align-items-center justify-content-between mb-3">
						          				<div class="img-box">
						          					<input type="hidden" name="ordersNo" value="${o.ordersNo }">
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
						          				<c:if test="${o.paymentState == '배송완료' && !o.review}">
						          					<a class="btn-main" href="${pageContext.request.contextPath}/on/customer/addBoard?ordersNo=${o.ordersNo}">리뷰등록</a>
						          				</c:if>
						          				<c:if test="${o.paymentState == '배송완료' && o.review}">
						          					<span class="d-inline-block " style="word-break: keep-all;">리뷰등록</span>
						          				</c:if>
						          			</div>
						          		</div>	
					          		</c:forEach>
				          		</form>			
			          		</c:if>        	
			          	</div>
			        </div>
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