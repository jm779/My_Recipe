<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>RecipeTime</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">

    <!-- Header -->
    <header class="d-flex justify-content-between align-items-center py-3 border-bottom">
      <div class="d-flex align-items-center gap-3">
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height:50px;">
        </a>
        <h2 class="mb-0">RecipeTime</h2>
      </div>

      <!-- Search -->
      <form action="search" method="get" class="d-flex gap-2">
        <input type="text" name="query" placeholder="검색내용" class="form-control" />
        <button type="submit" style="width: 100px;">검색</button>
      </form>

      <!-- User Section -->
      <c:choose>
        <c:when test="${sessionScope.member == null}">
          <div class="d-flex gap-3">
            <a href="login">로그인</a>
            <a href="signup">회원가입</a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="text-end">
            <img src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile" style="height:40px;">
            <div>${sessionScope.member.name}(${sessionScope.member.userid})님 환영합니다.</div>
            <div>
              <a href="logout">로그아웃</a> |
              <a href="goadd">레시피 등록</a> |
              <a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
            </div>
          </div>
        </c:otherwise>
      </c:choose>
    </header>

    <nav class="my-3">
      <ul class="nav nav-pills justify-content-around gap-3">
        <li class="nav-item"><a class="nav-link" href="#">추천 Recipe</a></li>
        <li class="nav-item"><a class="nav-link" href="#">인기 Recipe</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Best Chef</a></li>
        <li class="nav-item"><a class="nav-link" href="#">Help</a></li>
      </ul>
    </nav>

    <!-- Hot Recipe -->
    <section class="mb-5">
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h4>Hot Recipe</h4>
        <a href="#">더보기</a>
      </div>
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="item" items="${hotList}">
          <div class="col">
            <div class="card h-100">
              <div class="card-img-top" style="height:200px; background-size:cover; background-image:url('${pageContext.request.contextPath}/resources/image/${item.image}');"></div>
              <div class="card-body">
                <p class="card-text">${item.title}</p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </section>

    <!-- Best Recipe -->
    <section class="mb-5">
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h4>Best Recipe</h4>
        <a href="#">더보기</a>
      </div>
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="item" items="${bestList}">
          <div class="col">
            <div class="card h-100">
              <div class="card-img-top" style="height:200px; background-size:cover; background-image:url('${pageContext.request.contextPath}/resources/image/${item.image}');"></div>
              <div class="card-body">
                <p class="card-text">${item.title}</p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </section>

    <!-- Best Chef -->
    <section class="mb-5">
      <div class="d-flex justify-content-between align-items-center mb-2">
        <h4>Best Chef</h4>
        <a href="#">더보기</a>
      </div>
      <div class="row row-cols-1 row-cols-md-3 g-4">
        <c:forEach var="chef" items="${chefList}">
          <div class="col">
            <div class="card h-100">
              <div class="card-img-top" style="height:200px; background-size:cover; background-image:url('${pageContext.request.contextPath}/resources/image/${chef.image}');"></div>
              <div class="card-body">
                <p class="card-text">${chef.name}</p>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </section>

    <!-- 공지 -->
    <section class="mb-5">
      <h4>공지사항</h4>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>날짜</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="n" items="${noticeList}">
            <tr>
              <td>${n.title}</td>
              <td>${n.writer}</td>
              <td>${n.date}</td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </section>

    <footer class="text-center py-3 border-top">
      <small>&copy; 2025 RecipeTime. All rights reserved.</small>
    </footer>

  </div>
</body>
</html>