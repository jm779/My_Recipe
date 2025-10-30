<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>공지사항 목록</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<%@include file="/WEB-INF/views/include/head.jsp" %>
<div class="container mt-4">
  <h3 class="fw-bold mb-3">공지사항 전체 보기</h3>
  <table class="table table-bordered table-hover text-center">
    <thead class="table-light">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>날짜</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach var="n" items="${noticeList}">
        <tr>
          <td>${n.noticeid}</td>
          <td class="text-start">${n.noticetitle}</td>
          <td>${n.writer}</td>
          <td>${n.date}</td>
        </tr>
      </c:forEach>
      <c:if test="${empty noticeList}">
        <tr>
          <td colspan="4" class="text-muted">공지사항이 없습니다.</td>
        </tr>
      </c:if>
    </tbody>
  </table>
</div>

<%@include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>