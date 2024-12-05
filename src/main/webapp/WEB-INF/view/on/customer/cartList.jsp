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
	           		<c:if test="${cart.isEmpty() }" >
	           			<span class="count">0</span>
	           		</c:if>
	           		<c:if test="${!cart.isEmpty() }" >
	           			<span class="count">${cart[0].countCartList }</span>
	           		</c:if>
                </a>
              </li>
              
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
				        		<td class="text-center"><input type="checkbox" name="goodsChoice" id="goodsChoice" class="itemCheckbox" value="${c.cartNo }" data-price="${c.goodsTotalPrice}" onclick="calculateSum()"></td>
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
		        		<th class="text-center">All Item Price</th>
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
		        		<th class="text-center">Selected Item Price</th>
		        	</tr>
		        	<tr>
		        		<td><div id="sumResult">0원</div></td>
		        	</tr>
		        	<tr>
		        		<td><button class="btn btn-main w-100" type="button" id="cartButton">결제</button></td>
		        	</tr>
		        </table>
		        <h2 id="sumResult"></h2>
      	 	</div>
      	</div>
      </div>
    </div>
    </form>

    <footer class="site-footer border-top">
      <div class="container">
        <div class="row">
             <div class="d-flex align-items-center justify-content-between small">
               <div class="text-muted">Copyright &copy; Dress Mall 2024</div>
        </div>
      </div>
     </div>
    </footer>
  </div>
  
  <script>
  function calculateSum() {
      let checkboxes = document.querySelectorAll('input[type="checkbox"]:checked');
      let sum = 0;

      checkboxes.forEach(checkbox => {
          sum += parseFloat(checkbox.dataset.price);
      });

      document.getElementById("sumResult").innerText = sum + "원";
  }
  
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