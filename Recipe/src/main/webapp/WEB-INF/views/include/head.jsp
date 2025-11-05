<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header class="py-3 border-bottom">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <div class="d-flex align-items-center gap-2">
        <a href="/">
          <img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height:50px;">
        </a>
        <h2 class="mb-0">RecipeTime</h2>
        <script src="${pageContext.request.contextPath}/resources/js/mypage_move.js"></script>
      </div>

      <form action="search" method="get" class="d-flex gap-2">
        <input type="text" name="query" placeholder="검색내용" class="form-control" />
        <button type="submit" class="btn btn-primary" style="width: 100px;">검색</button>
      </form>

      <div>
        <c:choose>
          <c:when test="${sessionScope.member == null}">
            <div class="d-flex gap-3">
              <a href="/login">로그인</a>
              <a href="/signup">회원가입</a>
            </div>
          </c:when>
          <c:otherwise>
            <div class="text-end">
              <img src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile" style="height:40px;">
              <div>${sessionScope.member.name}(${sessionScope.member.userid})님 환영합니다.</div>
              <div style="position: relative;">
                <a href="/logout">로그아웃</a> |
                <a href="${pageContext.request.contextPath}/cook/add">레시피 등록</a> |
                <a id="mp_move" href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
                <div id="choose_help" style="width:79px; height:72px; position: absolute; 
                		left:70%; top: 90%; background-color: #e0e0e0; text-align: center; display: none;">
                	<a href="${pageContext.request.contextPath}/member/mypage">내 작성글</a>
                	<a href="${pageContext.request.contextPath}/question/memberqlist">문의</a>
                </div>
              </div>
            </div>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</header>