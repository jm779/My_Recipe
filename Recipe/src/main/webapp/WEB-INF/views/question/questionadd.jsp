<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>문의 작성</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<!-- 푸터 고정 -->
<body class="d-flex flex-column min-vh-100">

  <main class="flex-grow-1">
    <!-- 헤더 포함 -->
    <div class="container my-2">
      <jsp:include page="../include/head.jsp" />
    </div>

    <!-- 문의 작성 폼 -->
    <div class="container mt-5" style="max-width: 800px;">
      <div class="d-flex text-center mb-4">
        <a href="${pageContext.request.contextPath}/">
          <img src="${pageContext.request.contextPath}/resources/image/q_icon.png" alt="icon" style="height: 52px;">
        </a>
        <h4 style="margin-left: 12px; margin-top: 10px;">문의글 작성</h4>
      </div>

      <form action="/question/add" method="post">
        <div class="mb-3">
          <label for="title" class="form-label"><strong>문의 제목</strong></label>
          <input type="text" id="title" name="qtitle" class="form-control" required placeholder="제목을 입력하세요">
        </div>

        <div class="mb-3">
          <label for="content" class="form-label"><strong>문의 내용</strong></label>
          <textarea id="content" name="qcontent" class="form-control" rows="6" required placeholder="내용을 입력하세요"></textarea>
        </div>

        <div class="text-end">
          <button type="submit" class="btn btn-primary">등록</button>
          <a href="${pageContext.request.contextPath}/inquiry/list" class="btn btn-secondary">목록</a>
        </div>
      </form>
    </div>
  </main>

  <!-- 푸터 포함 -->
  <jsp:include page="../include/footer.jsp" />
</body>
</html>