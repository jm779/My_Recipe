<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <title>문의목록</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100">
  <main class="flex-grow-1">
    <div class="container my-2">
      <jsp:include page="../include/head.jsp" />
      <div class="mt-4 mb-3"><h3>내 문의 내역</h3></div>

      <!-- 문의 목록 테이블 -->
      <table class="table table-sm" border="1">
        <thead>
          <tr>
            <th>문의번호</th>
            <th>문의제목</th>
            <th>문의내용</th>
            <th>작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="cook" items="${list}">
            <c:if test="${cook.userid == sessionScope.userid}">
              <tr>
                <td>${cook.recipeid}</td>
                <td>${cook.recipetitle}</td>
                <td>${cook.comment}</td>
                <td>${cook.link}</td>
              </tr>
            </c:if>
          </c:forEach>
          <c:if test="${empty list}">
            <tr>
              <td colspan="4">문의 정보가 없습니다.</td>
            </tr>
          </c:if>
        </tbody>
      </table>

      <!-- 등록 버튼 (오른쪽 하단) -->
      <div class="text-end mt-3">
        <a href="${pageContext.request.contextPath}/question/questionadd" class="btn btn-outline-primary btn-sm">문의 등록</a>
      </div>
    </div>
  </main>
  <jsp:include page="../include/footer.jsp" />
</body>
</html>