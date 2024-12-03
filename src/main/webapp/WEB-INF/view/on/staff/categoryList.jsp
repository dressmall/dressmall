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
<title>카테고리 리스트</title>


</head>
<body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="${pageContext.request.contextPath}/on/staff/staffList">Dress Mall STAFF</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="${pageContext.request.contextPath}/on/staff/staffList"><i class="fas fa-bars"></i></button>
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
                        <h1 class="mt-5">카테고리</h1>
                        <!-- 추가 버튼 -->
                        <div class="d-flex justify-content-end mb-4">
                        	<button class="btn-main btn" onclick="openPopupAddCategory()">카테고리 추가</button>
			            </div>
                        <!-- 테이블 -->
                        <table class="table table-bordered ">
                              <thead style="background-color: #f0f0f0;">
                                  <tr>
                                      <th>번호</th>
                                      <th>카테고리명</th>
                                      <th>업데이트 날짜</th>
                                      <th>생성 날짜</th>
                                      <th>삭제</th>
                                  </tr>
                              </thead>
                              <tbody>                                    
                                  <c:forEach var="c" items="${categoryList}">
                                  	<tr>
                                  		<td>${c.categoryNo}</td>
                                  		<td>${c.categoryTitle}</td>
                                  		<td>${c.updateDate}</td>
                                  		<td>${c.createDate}</td>
                                  		<td>
                                  			<a href="${pageContext.request.contextPath}/on/staff/removeCategory?categoryNo=${c.categoryNo}" class="btn btn-main w-100">삭제</a>
                                  		</td>
                                  	</tr>
                                  </c:forEach>
                           
                              </tbody>
                       	</table>
                        
                        <!-- 페이징 -->
                        <div class="text-center">
								<c:if test="${currentPage > numPerPage}">
									<a href="${pageContext.request.contextPath}/on/staff/categoryList?currentPage=${beginPagingNum - numPerPage}">이전</a>
								</c:if>
								<c:forEach var="num" begin="${beginPagingNum}" end="${endPagingNum}">
									<c:if test="${num==currentPage}">
										${num}&nbsp;
									</c:if>
									<c:if test="${num!=currentPage}">
										<a href="${pageContext.request.contextPath}/on/staff/categoryList?currentPage=${num}">${num}</a>
										&nbsp;
									</c:if>
								</c:forEach>
								<c:if test="${currentPage < lastPage - numPerPage }">
									<a href="${pageContext.request.contextPath}/on/staff/categoryList?currentPage=${beginPagingNum + numPerPage}">다음</a>
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
        <script>
     	// 카테고리추가 팝업
      	function openPopupAddCategory() {
    	  	  // 화면의 크기 (뷰포트 크기)
    	  	  const screenWidth = window.innerWidth;
    	  	  const screenHeight = window.innerHeight;
    	
    	  	  // 팝업 크기
    	  	  const popupWidth = 400;
    	  	  const popupHeight = 400;
    	
    	  	  // 중앙 위치 계산
    	  	  const left = Math.max((screenWidth - popupWidth) / 2, 0);
    	  	  const top = Math.max((screenHeight - popupHeight) / 2, 0);
    	  	  
    	      // 팝업창 옵션 설정
    	      const url = '${pageContext.request.contextPath}/popup/staff/addCategory'; // 호출할 JSP 경로
    	      const name = '카테고리 추가'; // 팝업창 이름
    	      const options = 'width=' + popupWidth + ',height=' + popupHeight + ',top=' + top + ',left=' + left + ',scrollbars=yes,resizable=no';
    	      window.open(url, name, options);
    	}
        </script>
</body>
</html>