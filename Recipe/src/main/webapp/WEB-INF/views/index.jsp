<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RecipeTime</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light fs-5">
<%@include file="/WEB-INF/views/include/head.jsp"%>
    <div class="py-3 px-4 bg-warning bg-opacity-25" style="width: 100%">
		  <ul class="nav d-flex justify-content-between align-items-center" style="width: 62%; margin: 0 auto;">
		    <li class="nav-item">
		      <a class="nav-link text-dark fw-bold fs-5"
		         href="${pageContext.request.contextPath}/recipe/all">추천 Recipe</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-dark fw-bold fs-5"
		         href="${pageContext.request.contextPath}/recipe/korean">인기 Recipe</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-dark fw-bold fs-5"
		         href="${pageContext.request.contextPath}/chef/best">Best Chef</a>
		    </li>
		    <li class="nav-item">
		      <a class="nav-link text-dark fw-bold fs-5"
		         href="${pageContext.request.contextPath}/question/qlist">Help</a>
		    </li>
		  </ul>
	</div>
    <div class="container py-4">
	<!-- 헤더 바로 아래에 위치 -->
        <!-- Hot Recipe -->
        <section class="mb-5">
            <div class="card border-0">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
                        <h4 class="text-dark fw-bold">
                            <img src="${pageContext.request.contextPath}/resources/image/fire.png" alt="fire_icon" width="20"> Hot Recipe
                        </h4>
                        <a href="${pageContext.request.contextPath}/recipe/hot" class="btn btn-sm btn-outline-secondary">더보기 &raquo;</a>
                    </div>
                    <div class="row row-cols-2 row-cols-md-4 g-4 px-2">
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/kimchi_soup.jpg" alt="김치찌개" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">김치찌개</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/bean_noodles.jpg" alt="콩국수" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">콩국수</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/Dak-galbi.jpg" alt="닭갈비" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">닭갈비</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/tteokbokki.jpg" alt="떡볶이" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">떡볶이</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Best Recipe -->
        <section class="mb-5">
            <div class="card border-0">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
                        <h4 class="text-dark fw-bold">
                            <img src="${pageContext.request.contextPath}/resources/image/good_icon.png" alt="best_icon" width="20"> Best Recipe
                        </h4>
                        <a href="${pageContext.request.contextPath}/recipe/best" class="btn btn-sm btn-outline-secondary">더보기 &raquo;</a>
                    </div>
                    <div class="row row-cols-2 row-cols-md-4 g-4 px-2">
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/mushroom_rice.jpg" alt="버섯볶음밥" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">버섯볶음밥</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/dakbal.jpg" alt="닭발" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">닭발</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/cold_noodles.jpg" alt="냉면" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">냉면</p>
                        </div>
                        <div class="col text-center">
                            <img src="${pageContext.request.contextPath}/resources/image/toast.jpg" alt="토스트" class="img-fluid rounded shadow-sm w-100" style="height: 280px; object-fit: cover;">
                            <p class="mt-2 fw-semibold fs-5">토스트</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
		<!-- 내 추천 레시피 (로그인 사용자) -->
		<c:if test="${not empty recommendedList}">
		  <section class="mb-5">
		    <div class="card border-0">
		      <div class="card-body">
		        <div class="d-flex justify-content-between align-items-center mb-3 px-2">
		          <h4 class="text-dark fw-bold">내 추천 레시피</h4>
		        </div>
		        <div class="row row-cols-1 row-cols-md-4 g-4 px-2">
		          <c:forEach var="cook" items="${recommendedList}">
		            <div class="col">
		              <div class="card h-100 shadow-sm">
		                <img src="${pageContext.request.contextPath}${cook.mainimagepath}" class="card-img-top" alt="대표사진" style="height: 200px; object-fit: cover;">
		                <div class="card-body">
		                  <h5 class="card-title fs-5">${cook.recipetitle}</h5>
		                  <p class="card-text text-muted fs-6">작성자: ${cook.userid}</p>
		                  <p class="card-text text-muted fs-6">추천일: <fmt:formatDate value="${cook.writedate}" pattern="yyyy-MM-dd" /></p>
		                  <a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}" class="btn btn-sm btn-outline-primary">상세보기</a>
		                </div>
		              </div>
		            </div>
		          </c:forEach>
		        </div>
		      </div>
		    </div>
		  </section>
		</c:if>
		
        <!-- 사용자 추천 레시피 -->
        <section class="mb-5">
            <div class="card border-0">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
                        <h4 class="text-dark fw-bold">사용자 추천 레시피</h4>
                        <a href="${pageContext.request.contextPath}/recipe/user" class="btn btn-sm btn-outline-secondary">더보기 &raquo;</a>
                    </div>
                    <c:choose>
                        <c:when test="${not empty hotList}">
                            <div class="row row-cols-1 row-cols-md-3 g-4 px-2">
                                <c:forEach var="item" items="${hotList}">
                                    <div class="col">
                                        <div class="card h-100 shadow-sm">
                                            <img src="${pageContext.request.contextPath}${item.mainimagepath}" class="card-img-top" alt="${item.recipetitle}" style="height: 200px; object-fit: cover;">
                                            <div class="card-body">
                                                <h5 class="card-title fs-5">${item.recipetitle}</h5>
                                                <p class="card-text text-muted fs-6">${item.rcomment}</p>
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <small class="text-muted">by ${item.userid}</small>
                                                    <a href="${pageContext.request.contextPath}/cook/detail/${item.recipeid}" class="btn btn-sm btn-outline-primary">상세보기</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center text-muted py-5 fs-5">추천 레시피가 아직 없습니다.</div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </section>
        <!-- 공지사항 -->
        <section class="mb-5">
            <div class="card border-0">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3 px-2">
                        <h4 class="text-dark fw-bold">
                            <img src="${pageContext.request.contextPath}/resources/image/notice.png" alt="notice_icon" width="24"> 공지사항
                        </h4>
                        <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-sm btn-outline-secondary">더보기 &raquo;</a>
                    </div>
                    <table class="table table-bordered table-hover table-striped table-sm text-center fs-5">
                        <thead class="table-light">
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>날짜</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:choose>
                        		<c:when test="${empty noticeList}">
                        			<tr>
								       <td colspan="4" class="text-center text-muted">공지사항이 없습니다.</td>
								    </tr>
                        		</c:when>
                        		<c:otherwise>
	                        		<c:forEach var="n" items="${noticeList}">
		                                <tr>
		                                    <td>${n.noticeid}</td>
		                                    <td class="text-start">${n.noticename}</td>
		                                    <td>${n.writer}</td>
		                                    <td>${n.date}</td>
		                                </tr>
		                            </c:forEach>
                        		</c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </section>
    </div> <!-- container 끝 -->
	<footer style="background-color: #f0f0f0;" class="text-muted py-4 mt-5">
	    <div class="container text-center fs-6">
	        <p class="mb-1">© 2025 RecipeTime. All rights reserved.</p>
	        <p class="mb-1">대표: ooo | 사업자등록번호: 123-45-67890 | 이메일: support@recipetime.kr</p>
	        <p class="mb-0">주소: 대전광역시 Recipe로 123 | 고객센터: 1588-0000</p>
	    </div>
	</footer>
</body>
</html>