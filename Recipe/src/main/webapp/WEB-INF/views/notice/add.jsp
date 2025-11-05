<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>공지사항 등록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

<div class="container mt-4">
  <h3 class="fw-bold mb-3">공지사항 등록</h3>

  <form action="${pageContext.request.contextPath}/notice/add" method="post">
    <div class="mb-3">
      <label for="ntitle" class="form-label">제목</label>
      <input type="text" class="form-control" id="ntitle" name="ntitle" required>
    </div>

    <div class="mb-3">
      <label for="nwriter" class="form-label">작성자</label>
      <input type="text" class="form-control" id="nwriter" name="nwriter" required>
    </div>

    <button type="submit" class="btn btn-primary">등록</button>
    <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-secondary">취소</a>
  </form>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>