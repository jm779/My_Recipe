<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<!-- 푸터 고정 -->
<body class="d-flex flex-column min-vh-100">

<!-- 본문 : main -->
  <main class="flex-grow-1">
    <div class="container">
      <jsp:include page="/WEB-INF/views/include/head.jsp" />

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
  </main>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>