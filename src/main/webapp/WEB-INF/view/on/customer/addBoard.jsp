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

	<title>리뷰등록</title>
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
			          <div class=" order-0 m-2 mb-md-0">
			          	<h5>리뷰 등록</h5>
			          	<!-- 리뷰 등록 컨텐츠 -->
			          	
			          	<div class="content border"> 
			          		<form  id="addBoardForm" action="${pageContext.request.contextPath}/on/customer/addBoard" method="post">
					          	<h6>주문번호 NO.${ordersNo }</h6> <!-- 주문번호 받기 -->
					          	<!-- @RequestParamfh ordersNo을 넘겨주기위해 -->
					          	<c:forEach items="${ordersByGoods}" var="og">
						          	<input type="hidden" name="ordersNo" value="${og.ordersNo}">
						          	<input type="hidden" name="goodsNo" value="${og.goodsNo}">
					          		<div class="d-flex align-items-center justify-content-start w-100 border content mb-3">
					          			<!-- 리뷰를 등록할 제품사진과 상세정보(title, subtext, price) -->
										<div class="img-box">
											<c:if test="${empty og.goodsFileName}">
					                           <img src="${pageContext.request.contextPath}/upload/noImage.png" class="img-fluid">
					                       	</c:if>
					                       	<c:if test="${not empty og.goodsFileName}">		                        
						                   		<img src="${pageContext.request.contextPath}/upload/${og.goodsFileName}.${og.goodsFileExt}" class="img-fluid">
					                      	</c:if>
										</div>
										<div class="text-box d-flex flex-column ms-3">
											<span>Title : ${og.goodsTitle }</span> 
											<span class=" text-memo">상품 설명 : ${og.goodsMemo }</span> 
											<span>Price : ${og.goodsPrice }</span> 
										</div>
										
					          		</div>
				          			<h6>리뷰 작성</h6>
				          			<div>
				          				<textarea id="boardContent" rows="5" cols="100" name="boardContent"></textarea>
				          				<span id="errBoardContent" class="msg d-block mt-1"></span><!-- 에러메세지 -->
				          			</div>
				          			<!-- 유효성 검사 후 에러 메세지 출력 -->
				          			<div class="text-end">
					          			<button id="btnBoard" class="btn-main" type="button">등록</button>			          			
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

    <script type="text/javascript">
	  	// 유효성 검사
	  	$('#btnBoard').click(function() {
	  		let isValid = true;
	  		
	  		if($('#boardContent') == null || $('#boardContent').val() == '') {
	  			$('#errBoardContent').text('리뷰를 작성해주세요');
	  			isValid = false;
	  		} else {
	  			console.log('리뷰등록')
	  			$('#errBoardContent').text('');
		  		$('#addBoardForm').submit();
	  		}
	  		
		})
	  </script>
  </body>

</html>