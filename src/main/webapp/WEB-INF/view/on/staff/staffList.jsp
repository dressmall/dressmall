<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/staffStyles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>주문 관리</title>
</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html">Dress Mall_STAFF</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <a href="${pageContext.request.contextPath}/on/staff/logout" class="btn btn-danger ms-auto me-4">
           		로그아웃
            </a>
            
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">MENU</div>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/staffList">                           
                                스태프 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/goodsList">                           
                               	상품 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/customerList">                           
                                고객 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/paymentList">                           
                                주문 관리
                            </a>
                            <a class="nav-link" href="${pageContext.request.contextPath}/on/staff/categoryList">                           
                                카테고리 관리
                            </a>
                        </div>
                        
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${loginStaff.staffId}
                    </div>
                </nav>
            </div>
            
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-5">
                        <h1 class="mt-5">스태프 관리</h1>
                        <!-- 추가 버튼 -->
                        <div class="d-flex justify-content-end mb-4">
			                <button class="btn-main btn" onclick="openPopupAddStaff()">스태프 추가</button>
			            </div>
                        <!-- 테이블 -->
                         <table class="table table-bordered">
	                          <thead style="background-color:#f0f0f0;">
	                              <tr>
	                                  <th>번호</th>
	                                  <th>아이디</th>
	                                  <th>수정날짜</th>
	                                  <th>입사날짜</th>
	                              </tr>
	                          </thead>
	                          <tbody>
	                          	<c:forEach var="s" items="${staffList}">
	                          		<tr>
	                                  <td>${s.staffNo}</td>
	                                  <td>${s.staffId}</td>
	                                  <td>${s.updateDate}</td>
	                                  <td>${s.createDate}</td>
	                             	</tr>
	                          	</c:forEach>
	                          </tbody>
                          </table>
                          	<!-- 페이징 -->
							<div class="text-center">
								<c:if test="${currentPage > numPerPage}">
									<a href="${pageContext.request.contextPath}/on/staff/staffList?currentPage=${beginPagingNum - numPerPage}">이전</a>
								</c:if>
								<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
									<c:if test="${num==currentPage}">
										${num}&nbsp;
									</c:if>
									<c:if test="${num!=currentPage}">
										<a href="${pageContext.request.contextPath}/on/staff/staffList?currentPage=${num}">${num}</a>
										&nbsp;
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < lastPage - numPerPage }">
									<a href="${pageContext.request.contextPath}/on/staff/staffList?currentPage=${beginPagingNum + numPerPage}">다음</a>
								</c:if>
							</div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Dress Mall 2024</div>
                           
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/js/datatables-simple-demo.js"></script>
        <script >
        // 상품수정 팝업
      	function openPopupAddStaff() {
    	  	  // 화면의 크기 (뷰포트 크기)
    	  	  const screenWidth = window.innerWidth;
    	  	  const screenHeight = window.innerHeight;
    	
    	  	  // 팝업 크기
    	  	  const popupWidth = 500;
    	  	  const popupHeight = 500;
    	
    	  	  // 중앙 위치 계산
    	  	  const left = Math.max((screenWidth - popupWidth) / 2, 0);
    	  	  const top = Math.max((screenHeight - popupHeight) / 2, 0);
    	  	  
    	      // 팝업창 옵션 설정
    	      const url = '${pageContext.request.contextPath}/on/staff/addStaff'; // 호출할 JSP 경로
    	      const name = '스태프 추가'; // 팝업창 이름
    	      const options = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left + ',scrollbars=yes,resizable=no';
    	      window.open(url, name, options);
    	}
        </script>
</body>
</html>