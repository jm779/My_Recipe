<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="${pageContext.request.contextPath}/js/post_delete.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="container">
		<!-- Header -->
		<header class="d-flex justify-content-between align-items-center py-3 border-bottom">
			<div class="d-flex align-items-center gap-3">
				<a href="/"> 
					<img src="${pageContext.request.contextPath}/resources/image/logo.png" alt="logo" style="height: 50px;">
				</a>
				<h2 class="mb-0">RecipeTime</h2>
			</div>

			<!-- Search -->
			<form action="search" method="get" class="d-flex gap-2">
				<input type="text" name="query" placeholder="검색내용"
					class="form-control" />
				<button type="submit" style="width: 100px;">검색</button>
			</form>

			<!-- User Section -->
			<c:choose>
				<c:when test="${sessionScope.member == null}">
					<div class="d-flex gap-3">
						<a href="login">로그인</a> <a href="signup">회원가입</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="text-end">
						<img src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile" style="height: 40px;">
						<div>${sessionScope.member.name}(${sessionScope.member.userid})님 환영합니다.</div>
						<div>
							<a href="logout">로그아웃</a> | 
							<a href="/cook/add">레시피 등록</a> | 
							<a href="${pageContext.request.contextPath}/member/mypage">마이페이지</a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</header>
	</div>
	<div class="container mx-auto">
		<div>
			<h4>내가 작성한 레시피</h4>
		</div>

		<!-- 요리 목록 테이블 만들기 -->
		<table class="table table-sm" border="1">
			<thead>
				<tr>
					<th>레시피번호</th>
					<th>레시피이름</th>
					<th>코멘트</th>
					<th>링크</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="cook" items="${list}">
					<c:if test="${cook.userid == userid}">
						<tr>
							<td>${cook.recipeid}</td>
							<td>${cook.recipetitle}</td>
							<td>${cook.comment}</td>
							<td>${cook.link}</td>
							<td>
								<a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}" style="text-decoration: none;">
									<button type="button">상세</button>
								</a>
								<a href="${pageContext.request.contextPath}/cook/update/${cook.recipeid}" style="text-decoration: none;">
									<button type="button">수정</button>
								</a>
								<a href="${pageContext.request.contextPath}/cook/delete/${cook.recipeid}" class="btn-delete" style="text-decoration: none;">
									<button type="button">삭제</button>
								</a>
							</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="5">작성한 레시피가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>