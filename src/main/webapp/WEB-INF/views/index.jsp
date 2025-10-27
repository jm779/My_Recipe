<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>RecipeTime</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<%@include file="/WEB-INF/views/include/head.jsp" %>

<div class="container">

  <!-- 네비게이션 -->
  <nav class="my-4">
    <ul class="nav justify-content-between gap-3">
      <li class="nav-item"><a class="nav-link active" href="#" style="font-weight: bold; font-size: 20px;">추천 Recipe</a></li>
      <li class="nav-item"><a class="nav-link" href="#" style="font-weight: bold; font-size: 20px;">인기 Recipe</a></li>
      <li class="nav-item"><a class="nav-link" href="#" style="font-weight: bold; font-size: 20px;">Best Chef</a></li>
      <li class="nav-item"><a class="nav-link" href="#" style="font-weight: bold; font-size: 20px;">Help</a></li>
    </ul>
  </nav>

  <!-- Hot Recipe -->
  <section class="mb-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="fw-bold border-bottom pb-2">
      	<img src="${pageContext.request.contextPath}/resources/image/fire.png" alt="fire_icon" 
      		style="width: 20px; height: 20px;">
      	Hot Recipe
      </h4>
      <a href="#" class="text-decoration-none">더보기</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-4">
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/kimchi_soup.jpg" alt="김치찌개" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">김치찌개</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/bean_noodles.jpg" alt="콩국수" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">콩국수</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/Dak-galbi.jpg" alt="닭갈비" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">닭갈비</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/tteokbokki.jpg" alt="떡볶이" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">떡볶이</p>
      </div>
    </div>
  </section>

  <!-- Best Recipe -->
  <section class="mb-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
      <h4 class="fw-bold border-bottom pb-2">
      	<img src="${pageContext.request.contextPath}/resources/image/good_icon.png" alt="best_icon" 
      		style="width: 20px; height: 20px;">
      		Best Recipe 
      </h4>
      <a href="#" class="text-decoration-none">더보기</a>
    </div>
    <div class="row row-cols-2 row-cols-md-4 g-4">
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/mushroom_rice.jpg" alt="버섯볶음밥" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">버섯볶음밥</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/dakbal.jpg" alt="닭발" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">닭발</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/cold_noodles.jpg" alt="냉면" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">냉면</p>
      </div>
      <div class="col text-center">
        <img src="${pageContext.request.contextPath}/resources/image/toast.jpg" alt="토스트" class="img-fluid rounded"
        	 style="width:280px; height:280px; object-fit:cover;">
        <p class="mt-2">토스트</p>
      </div>
    </div>
  </section>

  <!-- 사용자 추천 레시피 -->
<section class="mb-5">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <h4 class="fw-bold border-bottom pb-2">사용자 추천 레시피</h4>
  </div>
  <div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach var="item" items="${hotList}">
      <div class="col">
        <div class="card h-100 shadow-sm">
          <img src="${pageContext.request.contextPath}/resources/image/${item.image}" class="card-img-top" alt="${item.title}" style="height:200px; object-fit:cover;">
          <div class="card-body">
            <h5 class="card-title">${item.title}</h5>
            <p class="card-text text-muted">${item.description}</p>
            <div class="d-flex justify-content-between align-items-center">
              <small class="text-muted">by ${item.writer}</small>
              <a href="${pageContext.request.contextPath}/cook/detail/${item.recipeid}" class="btn btn-sm btn-outline-primary">상세보기</a>
            </div>
          </div>
        </div>
      </div>
    </c:forEach>
    <c:if test="${empty hotList}">
      <div class="col text-center text-muted">추천 레시피가 아직 없습니다.</div>
    </c:if>
  </div>
</section>

<!-- 공지사항 -->
<section class="mb-5">
  <h4 class="fw-bold border-bottom pb-2">
  	<img src="${pageContext.request.contextPath}/resources/image/notice.png" alt="notice_icon" 
  		style="width: 30px; height: 30px;">
  	 공지사항
  </h4>
  <table class="table table-bordered table-hover text-center">
    <thead class="table-light">
      <tr>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="n" items="${noticeList}">
        <tr>
          <td class="text-start">${n.title}</td>
          <td>${n.writer}</td>
          <td>${n.date}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty noticeList}">
        <tr>
          <td colspan="3" class="text-muted text-center">공지사항이 없습니다.</td>
        </tr>
      </c:if>
    </tbody>
  </table>
</section>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>