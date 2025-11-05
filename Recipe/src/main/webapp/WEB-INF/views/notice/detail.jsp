<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
   <title>공지 상세 보기</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/include/head.jsp" />

<div class="container mt-4">
  <h3 class="fw-bold mb-3">공지 상세 보기</h3>
  <table class="table table-bordered">
    <tr>
      <th>번호</th>
      <td>${notice.noticeid}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td>${notice.ntitle}</td>
    </tr>
    <tr>
      <th>작성자</th>
      <td>${notice.nwriter}</td>
    </tr>
    <tr>
      <th>작성일</th>
      <td>${notice.ndate}</td>
    </tr>
  </table>

  <div class="mt-3">
    <a href="${pageContext.request.contextPath}/notice/edit/${notice.noticeid}" class="btn btn-warning">수정</a>
    <a href="${pageContext.request.contextPath}/notice/delete/${notice.noticeid}" class="btn btn-danger">삭제</a>
    <a href="${pageContext.request.contextPath}/notice/list" class="btn btn-secondary">목록</a>
  </div>
</div>

<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>