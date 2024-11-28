<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>장바구니</title>
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
                  	<li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>

          </div>
        </div>
      </div> 
    </header>

    
	<form id="cartForm" method="post" action="${pageContext.request.contextPath}/on/customer/paymentList">
    <div class="site-section">
      <div class="container">
      	 <div class="row">
      	 	<div class="col-9">
      	 		<table class="table table-bordered mr-3" >
      	 			<thead>
		        	<tr>
		        		<th class="text-center">선택</th>
		        		<th class="text-center">이미지</th>
		        		<th class="text-center">이름</th>
		        		<th class="text-center">가격</th>
		        		<th class="text-center">수량</th>
		        		<th class="text-center">총 가격</th>
		        		<th class="text-center">삭제</th>
		        	</tr>
		        	</thead>
		        	<tbody>
		        	<c:if test="${cart.isEmpty()}">
		        		<tr>
		        			<td colspan="7" class="text-center">상품이 비었습니다.</td>
		        		</tr>
		        	</c:if>
		        	<c:if test="${!cart.isEmpty()}">
		        		<c:forEach var="c" items="${cart}">
			        		<tr>
				        		<td class="text-center"><input type="checkbox" name="goodsChoice" id="goodsChoice" value="${c.cartNo }"></td>
				        		<td>
				        			<c:if test="${empty c.goodsFileName}">
			                            <img src="${pageContext.request.contextPath}/upload/noImage.png" class="img-fluid" style="width: 150px; height: 150px; object-fit: cover;">
			                        </c:if>
			                        <c:if test="${not empty c.goodsFileName}">		                        
					                    <img src="${pageContext.request.contextPath}/upload/${c.goodsFileName}.${c.goodsFileExt}" class="img-fluid" style="width: 150px; height: 150px; object-fit: cover;">
			                        </c:if>
				        		</td>
				        		<td><a class="text-dark text-decoration-none" href="${pageContext.request.contextPath }/on/customer/goodsOne?goodsNo=${c.goodsNo}">${c.goodsTitle}</a></td>
				        		<td>${c.goodsPrice }원</td>
				        		<td>${c.cartAmount }개</td>
				        		<td>${c.goodsTotalPrice }원</td>
				        		<td>
		                        	<a class="btn btn-main w-100" href="${pageContext.request.contextPath}/on/customer/removeCart?cartNo=${c.cartNo}">삭제</a>
		                        </td>
				        	</tr>
			        	</c:forEach>
		        	</c:if>
		        	</tbody>
		        </table>
      	 	</div>
      	 	<div class="col-3">
      	 		<table class="table table-bordered mr-3 sticky-top bg-light">
		        	<tr>
		        		<th class="text-center">Cart Total Price</th>
		        	</tr>
		        	<c:if test="${cart.isEmpty()}">
			        	<tr>
			        		<td>0원</td>
			        	</tr>
			        </c:if>
		        	<c:if test="${!cart.isEmpty()}">
			        	<tr>
			        		<td>${cart[0].totalPrice}원</td>
			        	</tr>
			        </c:if>
		        	<tr>
		        		<td><button class="btn btn-main w-100" type="button" id="cartButton">결제</button></td>
		        	</tr>
		        </table>
      	 	</div>
      	</div>
      </div>
    </div>
    </form>

    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved dressmall 
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
        </div>
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
  <script>
 	  $('#cartButton').click(function() {
	      // 체크박스가 하나라도 선택되지 않으면 경고 메시지 출력
	      if ($('input[name="goodsChoice"]:checked').length === 0) {
	          alert('상품을 선택해주세요.');
	      } else {
	    	  console.log(goodsChoice);
	    	  $('#cartForm').submit();
	      }
	  });
  </script>
    
  </body>

</html>