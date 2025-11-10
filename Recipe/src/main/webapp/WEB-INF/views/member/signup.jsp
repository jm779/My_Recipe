<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="${pageContext.request.contextPath}/resources/js/check_id.js"></script>
</head>
<body class="d-flex flex-column min-vh-100">
<!-- 회원가입 시 알림창 띄우고 첫페이지 -->
<c:if test="${not empty signupSuccess}">
  <script>
    alert('${signupSuccess}');
    location.href = '${pageContext.request.contextPath}/';
  </script>
</c:if>
<header style="background-color: #f0f0f0;" class="py-4 border-bottom text-muted">
  <div class="container">
    <div class="row align-items-center">
      <!-- 좌측: 로고 + 텍스트 -->
      <div class="col-md-4 d-flex align-items-center gap-2">
        <a href="/">
          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height:50px;">
        </a>
        <h2 class="mb-0 text-dark fs-2">RecipeTime</h2>
        <script src="${pageContext.request.contextPath}/resources/js/mypage_move.js"></script>
      </div>
      <!-- 가운데: 검색창 -->
      <div class="col-md-4 d-flex justify-content-center">
        <form action="search" method="get" class="d-flex gap-2 w-100" style="max-width: 400px;">
          <input type="text" name="query" placeholder="검색내용" class="form-control" />
          <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button>
        </form>
      </div>
      <!-- 우측: 비워둠 -->
      <div class="col-md-4"></div>
    </div>
  </div>
</header>
  <!-- ✅ 본문: 높이는 유지, 위치만 조정 -->
  <main class="flex-grow-1">
    <div class="container mt-5">
      <div class="d-flex justify-content-center">
        <form method="post" class="w-100" style="max-width: 600px;">
          <h3 class="text-center mb-4">회원가입</h3>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">아이디:</label>
            <div class="col-sm-5">
              <input type="text" name="userid" class="form-control" placeholder="아이디 입력"/>
            </div>
            <div class="col-sm-4">
              <button id="check_btn" type="button" class="btn btn-secondary w-100">중복확인</button>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">비밀번호:</label>
            <div class="col-sm-9">
              <input type="password" name="userpassword" class="form-control" placeholder="새 비밀번호"/>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">이름:</label>
            <div class="col-sm-9">
              <input type="text" name="name" class="form-control" placeholder="성명"/>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">이메일:</label>
            <div class="col-sm-9">
              <input type="text" name="email" class="form-control" placeholder="이메일"/>
            </div>
          </div>

          <div class="row mt-4">
            <div class="col-sm-6">
              <button class="btn btn-primary w-100">가입하기</button>
            </div>
            <div class="col-sm-6">
              <a href="."><button type="button" class="btn btn-outline-secondary w-100">취소</button></a>
            </div>
          </div>
        </form>
      </div>
    </div>
  </main>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>