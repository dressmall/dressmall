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
    <form id="paymentForm" method="post" action="${pageContext.request.contextPath}/on/customer/paymentComplete">
    <div class="site-section">
      <div class="container">
      	 <div class="row">
      	 	<div class="col-6">
      	 		<h5>Address</h5>
      	 		<div class="border p-4 overflow-auto">
	      	 		<table class="table table-bordered">
			        	<c:forEach var="c" items="${customer}" varStatus="status">
						    <tr>
						        <td>${c.addressDetail}</td>
						        <td>
						            <input type="radio" name="addressNo" value="${c.addressNo}" <c:if test="${status.index == 0}">checked</c:if>>
						        </td>
						    </tr>
						</c:forEach>
			        </table>
		        </div>
      	 	</div>
      	 	<div class="col-6">
      	 		<h5>Your Order</h5>
      	 		<div class="border p-4 overflow-auto">
      	 			<input type="hidden" name="paymentPrice" value="${totalPrice }">
	      	 		<table class="table table-bordered mr-3">
	      	 		<tr>
		        		<th>Product</th>
		        		<th>Total</th>
		        	</tr>
			        	<c:forEach var="c" items="${cartList}">
			        		<input type="hidden" name="cartNo" value="${c.cartNo }">
			        		<tr>
				        		<td>${c.goodsTitle } X ${c.cartAmount }</td>
				        		<td>${c.goodsTotalPrice }원</td>
				        	</tr>
			        	</c:forEach>
			        	<tr>
			        		<td class="bg-light">Order Total</td>
			        		<td class="bg-light">${totalPrice }원</td>
			        	</tr>
			        </table>
			        <div class="border p-3 d-flex justify-content-around align-items-center">
					  <div>
					    <input type="radio" name="paymentMethod" value="카드" checked>
					    <label for="payCard" class="ms-1">카드</label>
					  </div>
					  <div>
					    <input type="radio" name="paymentMethod" value="페이">
					    <label for="payPay" class="ms-1">페이</label>
					  </div>
					</div>
					<button class="btn btn-main w-100 mt-3" type="submit">결제</button>
			     </div>
			     
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
    
  </body>

</html>