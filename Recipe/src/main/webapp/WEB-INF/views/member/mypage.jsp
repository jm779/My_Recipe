<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<script src="${pageContext.request.contextPath}/js/delete.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<div class="profile">
		<jsp:include page="/WEB-INF/views/include/head.jsp"></jsp:include>
			<div id="profile_box">
				<img id="profile_img" src="${pageContext.request.contextPath}/resources/image/profile.png" alt="profile">
				<div id="profile_menu">
					<a href="${pageContext.request.contextPath}/member/mypage">회원정보 수정</a>
					<a href="${pageContext.request.contextPath}/js/add.js">알림</a>
					<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
					<div class="line"></div>
					<div><button class="plus"></button></div>
					<p>팔로워</p><p>팔로잉</p>
				</div>
			</div>
		</div>
	
	<div>
		<div><h1>내가 작성한 레시피</h1></div>
		<section>
			<div>		
			</div>
		</section>
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
								<a href="${pageContext.request.contextPath}/cook/detail/${cook.recipeid}">
									<button type="button" >상세</button>
								</a>
								<a href="${pageContext.request.contextPath}/cook/update/${cook.recipeid}">
									<button type="button" >수정</button>
								</a>
								<a href="${pageContext.request.contextPath}/cook/delete/${cook.recipeid}" class="btn-delete">
									<button type="button" >삭제</button>
								</a>	
							</td>
						</tr>
					</c:if>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="4">작성한 레시피가 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>