<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<meta charset="UTF-8">

<title>마이페이지</title>
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
                     		<!-- 장바구니 담은 개수 표시 -->
	                        <span class="count">${countCartList }</span>
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

    

    <div class="site-section">
      <div class="container">
        <div class="row mb-5">
		  <div class="d-flex">
	          <div class="col-md-3 order-0 mb-5 mb-md-0">
	            <div class="border p-4 rounded mb-4">
	              <h3 class="mb-3 h6 d-block">MyPage</h3>
	              <ul class="list-unstyled mb-0">
	                <li class="mb-1"><a href="${pageContext.request.contextPath}/on/customer/ordersList" class="d-flex"><span >주문목록</span> <span class="text-black ml-auto"></span></a></li>
	                <li class="mb-1"><a href="${pageContext.request.contextPath}/on/customer/myPage" class="d-flex"><span class=" main-text">회원정보</span> <span class="text-black ml-auto"></span></a></li>
	              </ul>
	            </div>
	          </div>
	          
	          <div class="d-flex w-100">
		          <div class=" order-0 m-2 mb-md-0 w-50 vh-100">
		          	<h5>회원정보</h5>
		            <div class="border p-5 rounded mb-4">
		                <div class="inputBox mb-2">
						  <div class="idBox">
							  <div class="mt-2 text-black">Email</div>
							  <div><c:out value="${customer[0].customerMail}" /></div>
						  </div>
						  <div class="birthBox">
							  <div class="mt-2 text-black">Birth</div>
							  <div>${customer[0].customerBirth}</div>
						  </div>
						  <div class="genderBox">
							  <div class="mt-2 text-black">Gender</div>
							  <div>${customer[0].customerGender}</div>
						  </div>
					    </div>
						<div class="btnBox mt-3 d-flex justify-content-end">
							<a type="button" class="btn-main btn text-white" href="${pageContext.request.contextPath}/on/customer/modifyCustomer">비밀번호 변경</a>	
						</div>
		            </div>
		          </div>
	          
		          <div class=" order-1 m-2 mb-md-0 w-50">
		          <h5>주소리스트</h5>
		            <div class="border p-5 rounded mb-4">
		              <div class="scroll-box">
		              <table class="table">
		              	<c:forEach var="c" items="${customer}">
		              		<tr>
		              			<c:if test="${c.addressDetail == null }">
				              	  등록된 주소가 없습니다.
				                </c:if>
				                <c:if test="${c.addressDetail != null }">
				              	  <td style="word-break: keep-all;">${c.addressDetail}</td>
			              		  <td style="vertical-align:middle"><a type="button" class="btn-main btn w-100" href="${pageContext.request.contextPath}/on/customer/modifyAddress?addressNo=${c.addressNo}">수정</a></td>
			              		  <td style="vertical-align:middle"><a type="button" class="btn-main btn w-100" href="${pageContext.request.contextPath}/on/customer/removeAddress?addressNo=${c.addressNo}">삭제</a></td>
				                </c:if>
			              	</tr>
		              	</c:forEach>
		              </table>
		              </div>
		              <div class="btnBox mt-3 d-flex justify-content-end">
						<a type="button" class="btn-main btn text-white" href="${pageContext.request.contextPath}/on/customer/addAddress">주소 추가</a>
					  </div>
		            </div>
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