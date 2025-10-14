<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <div class="container">
    <header class="d-flex justify-content-between align-items-center py-3 border-bottom">
      <div class="d-flex align-items-center gap-3">
        <a href="${pageContext.request.contextPath}/">
          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height:50px;">
        </a>
        <h2 class="mb-0">RecipeTime</h2>
      </div>
      <form action="search" method="get" class="d-flex gap-2">
        <input type="text" name="query" placeholder="검색내용" class="form-control" />
        <button type="submit" style="width: 100px;">검색</button>
      </form>
      <div style="width: 130px;"></div>
    </header>

    <!-- 로그인 -->
    <div class="d-flex justify-content-center mt-5">
      <div class="w-50">
        <h3 class="text-center mb-4">LOGIN</h3>

        <c:if test="${not empty loginError}">
          <p class="text-danger text-center">${loginError}</p>
        </c:if>

        <form method="post">
          <div class="mb-3">
            <label class="form-label">아이디:</label>
            <input type="text" name="userid" class="form-control" />
          </div>
          <div class="mb-3">
            <label class="form-label">비밀번호:</label>
            <input type="password" name="userpassword" class="form-control" />
          </div>
          <div class="d-flex justify-content-between">
            <button type="submit" class="btn btn-primary">로그인</button>
            <a href="${pageContext.request.contextPath}/"><button type="button" class="btn btn-secondary">취소</button></a>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>